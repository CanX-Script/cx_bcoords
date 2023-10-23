const copyToClipboard = (str) => {
    const el = document.createElement("textarea");
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand("copy");
    document.body.removeChild(el);
};

window.addEventListener("message", (event) => {
    switch (event.data.action) {
        case "toggle_bcoords":
            document.getElementById("bcoords").classList.toggle("hide");
            break;
        case "ped_coords":
            const x = document.getElementById("x");
            const y = document.getElementById("y");
            const z = document.getElementById("z");
            const h = document.getElementById("h");
            const coords = event.data.PedCoords;
            x.textContent = coords.x.toFixed(2);
            y.textContent = coords.y.toFixed(2);
            z.textContent = coords.z.toFixed(2);
            h.textContent = coords.h.toFixed(2);
            break;
        case "copy":
            const coordsV = event.data.coords;
            const coordsText = `vector3(${coordsV.x},${coordsV.y},${coordsV.z})
vector4(${coordsV.x},${coordsV.y},${coordsV.z},${coordsV.h})
{ x = ${coordsV.x}, y = ${coordsV.y}, z = ${coordsV.z}, heading = ${coordsV.h} }
{ x = ${coordsV.x}, y = ${coordsV.y}, z = ${coordsV.z} }`;
            copyToClipboard(coordsText);
            const copyTitle = document.querySelector(".copy .title");
            copyTitle.textContent = "COPIED!";
            setTimeout(() => {
                copyTitle.textContent = "COPY";
            }, 1000);
            break;
        default:
            console.log("unknow!");
            break;
    }
});
