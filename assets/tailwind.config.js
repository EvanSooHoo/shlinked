// const colors = require("tailwindcss/colors");

module.exports = {
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  darkMode: "media", // or 'media' or 'class'
  theme: {
    fontFamily: {
      times: ["Times New Roman"],
      windows: ["VT323"],
      mono: ["ui-monospace", "SFMono-Regular"],
      creepster: ["Creepster"],
      ibm_plex: ["IBM Plex Serif"],
      metal: ["Metal Mania"],
      marker: ["Permanent Marker"],
    },
    extend: {
      colors: {
        // teal: colors.teal,
        // gray: colors.slate,
      },
    },
  },
  variants: {
    extend: {
      borderColor: ["active"],
      backgroundColor: ["active"],
      textColor: ["active"],
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
