import db from './db.js'

const getAllProjects = async() => {
    const query = `
        SELECT 
            p.project_id,
            p.project_title,
            p.description,
            p.project_location,
            p.project_date,
            o.organization_id,
            o.name AS organization_name,
            STRING_AGG(c.category_name, ', ' ORDER BY c.category_name) AS categories
        FROM public.projects p
        JOIN public.organization o
            ON p.organization_id = o.organization_id
        LEFT JOIN public.project_categories pc
            ON p.project_id = pc.project_id
        LEFT JOIN public.categories c
            ON pc.category_id = c.category_id
        GROUP BY 
            p.project_id,
            p.project_title,
            p.description,
            p.project_location,
            p.project_date,
            o.organization_id,
            o.name
        ORDER BY p.project_date;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
            project_id,
            organization_id,
            project_title,
            description,
            project_location,
            project_date
        FROM public.projects
        WHERE organization_id = $1
        ORDER BY project_date;
    `;

    const queryParams = [organizationId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllProjects, getProjectsByOrganizationId };