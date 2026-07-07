import db from './db.js'

const getAllCategories = async() => {
    const query = `
        SELECT 
            category_id,
            category_name
        FROM public.categories
        ORDER BY category_name;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getCategoryById = async (category_id) => {
    const query = `
        SELECT
            category_id,
            category_name
        FROM public.categories
        WHERE category_id = $1;
    `;

    const queryParams = [category_id];
    const result = await db.query(query, queryParams);

    return result.rows.length > 0 ? result.rows[0] : null;
};

const getCategoriesByProjectId = async (project_id) => {
    const query = `
        SELECT
            c.category_id,
            c.category_name
        FROM public.categories c
        JOIN public.project_categories pc
            ON c.category_id = pc.category_id
        WHERE pc.project_id = $1
        ORDER BY c.category_name;
    `;

    const queryParams = [project_id];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectsByCategoryId = async (category_id) => {
    const query = `
        SELECT
            p.project_id,
            p.project_title,
            p.description,
            p.project_location,
            p.project_date,
            o.organization_id,
            o.name AS organization_name
        FROM public.projects p
        JOIN public.project_categories pc
            ON p.project_id = pc.project_id
        JOIN public.organization o
            ON p.organization_id = o.organization_id
        WHERE pc.category_id = $1
        ORDER BY p.project_date;
    `;

    const queryParams = [category_id];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllCategories, getCategoryById, getCategoriesByProjectId, getProjectsByCategoryId }