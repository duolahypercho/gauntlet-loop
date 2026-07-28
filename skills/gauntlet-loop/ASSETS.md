# Game art: image gen vs Blender MCP

This skill builds **games**. Art tools exist to make the game look closer to the named reference — they are not the product.

← [SKILL.md](SKILL.md) · [AGENTS.md](AGENTS.md) · [BLENDER_MCP.md](BLENDER_MCP.md)

## Default posture

1. Ship playable game code in the chosen stack (ThreeJS, Godot, …).
2. Glance at a light in-game frame.
3. Blind-compare to the real reference game.
4. Fix the **game**. Pull art tools only when a defect is clearly an asset gap.

Do not replace the Gauntlet with an art-tool loop.

## When to use **image gen**

Use image generation (Cursor `GenerateImage`, fal, Midjourney, etc.) when the game needs **flat pixels**:

| Use image gen | Examples |
|---|---|
| 2D sprites / sprite sheets | characters, enemies, pickups, VFX cards |
| Textures & materials maps | albedo, rough notes, posters, graffiti, UI skins |
| Concept / target stills | mood board to aim the look (not shipped as gameplay mesh) |
| Icons, thumbnails, loading art | HUD icons, store cards |
| Sky / backdrop stills | painted skybox faces, menu backgrounds |

**Rules**

- Export into the game’s `assets/` (or equivalent) and **wire them in-engine**
- Match the reference game’s art language (pixel, painterly, PBR, …)
- Prefer sheets the engine can atlas; avoid one-off PNGs that never get imported
- Image gen is wrong for anything that must rotate, deform, or read as solid geometry under a moving camera

## 2D games (Brotato / Hades-likes): characters & monsters via image gen

For top-down / side-view **sprite** games, hero and enemies use **image gen**, not Blender and not procedural blob generators (`PIL` / `artgen`-style ovals). Goal: **2D game art**, not “a generated picture pasted in.”

### Do it as a sprite factory

1. **Style lock (one page)** from the reference game’s craft — outline weight, soft shade, highlight, camera angle, fist-scale. Copy the *craft*, not the IP (don’t clone their exact mascot).
2. **Hero first** — one isolated character on **transparent PNG**, no ground, no UI, no text. Gate: next to a reference still, does it feel like the same sport?
3. **Batch from that lock** — same prompt block for enemy families, then held weapons / hotbar icons. Reject background scrape, photo noise, or a new outline language.
4. **Drop-in replace** existing `assets/art/characters|enemies|weapons/*.png` (or project equivalent). Stop any code sprite generator from overwriting them.
5. **Prove in-game** — light wave/arena frame. Critic grades the **game**, not the Midjourney grid.

### Prompt constraints (every character / monster sheet)

- single subject, transparent background  
- game sprite / faux-2.5D illustration — not photoreal, not UI mock, not full scene  
- match locked outline + shade; readable at thumbnail in chaos  
- same scale language as hotbar / held props  

### Anti-patterns (this is why builds look “sus”)

- Generating full arena screenshots as “character art” → reads as an image, not a sprite world  
- Mixing PIL ovals + AI icons + glitch enemies → two games in one frame  
- New style every batch  
- Approving the gen grid while the in-game frame still clashes  

## When to use **Blender MCP**

Use Blender ([BLENDER_MCP.md](BLENDER_MCP.md)) when the game needs **real 3D**:

| Use Blender | Examples |
|---|---|
| Meshes you walk around / hold | weapons, props, environment kits, vehicles |
| Exports the engine loads as 3D | GLB / GLTF / FBX into ThreeJS or Godot |
| Lighting / lookdev for bake | studio light, then bake or screenshot reference |
| UV / material setup on geometry | trim sheets on real models |
| Blockouts that become levels | greybox → kitbash → export |

**Rules**

- Blender GUI open → **BlenderMCP → Connect** before tool calls
- Export into the game project; prove it in a playable frame
- Do not leave Blender as a second product (no endless Blender-only rounds)
- Blender is wrong for a pure 2D sprite game unless you are baking sprites from a turntable

## Quick chooser

```text
Does the player need to see it as 3D geometry (orbit, FPS hands, world mesh)?
  YES → Blender MCP → export GLB/FBX → import in game
  NO  → is it a flat image the engine samples (sprite, texture, UI)?
          YES → image gen → save under assets → import in game
          NO  → fix it in code / shaders / engine primitives first
```

| Symptom from critic | Prefer |
|---|---|
| "looks like engine primitives / greybox" | Blender kit or strong textured meshes |
| "flat / missing texture language" | image gen textures + engine materials |
| "sprite reads wrong vs reference 2D game" | image gen sprites (or Blender bake → sprite) |
| "gun has no silhouette under motion" | Blender mesh, not a billboard PNG |

## Anti-patterns

- Generating concept art forever without importing into the game
- Building a full Blender scene as the deliverable while the game stays cubes
- Using image gen for a weapon the FPS camera must orbit
- Using Blender for a Brotato-style 2D sprite when a PNG sheet is the real bar
- Capture farms in either tool — one honest in-game glance beats a render farm

## Gauntlet reminder

Image gen and Blender are **fan-out workstreams under the game**, same as textures/physics in the pure prompt. The harsh critic still grades the **game frame** against the real reference game — not the Blender viewport and not the Midjourney grid.
