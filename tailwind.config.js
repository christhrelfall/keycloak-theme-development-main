const forms = require("@tailwindcss/forms");

module.exports = {
    content: ["./themes/tailwind-example/**/*.{ftl,html,js,properties}"],
    plugins: [forms],
    theme: {
        fontFamily: {
            sans: ["roboto", "sans-serif"],
            serif: ["gelica", "serif"],
        },
    },
};
