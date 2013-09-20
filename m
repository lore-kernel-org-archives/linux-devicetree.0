From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v4 1/2] video: ARM CLCD: Add DT support
Date: Fri, 20 Sep 2013 15:19:59 +0100
Message-ID: <1379686800-27269-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds basic DT bindings for the PL11x CLCD cells
and make their fbdev driver use them.

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
Changes since v3:
- changed wording and order of interrupt-names and interrupts
  properties documentation
- changed wording of arm,pl11x,framebuffer-base property
  documentation
- cleaned up binding documentation indentation

Changes since v2:
- replaced video-ram phandle with arm,pl11x,framebuffer-base
- replaced panel-* properties with arm,pl11x,panel-data-pads
- replaced max-framebuffer-size with max-memory-bandwidth
- modified clcdfb_of_init_tft_panel() to use the pads
  data and take differences between PL110 and PL110 into
  account

Changes since v1:
- minor code cleanups as suggested by Sylwester Nawrocki
 .../devicetree/bindings/video/arm,pl11x.txt        | 145 +++++++++++
 .../devicetree/bindings/video/arm,pl11x.txt        | 146 +++++++++++
 drivers/video/Kconfig                              |   1 +
 drivers/video/amba-clcd.c                          | 268 +++++++++++++++++=
++++
 3 files changed, 415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/arm,pl11x.txt

diff --git a/Documentation/devicetree/bindings/video/arm,pl11x.txt b/Docume=
ntation/devicetree/bindings/video/arm,pl11x.txt
new file mode 100644
index 0000000..247e120
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/arm,pl11x.txt
@@ -0,0 +1,146 @@
+* ARM PrimeCell Color LCD Controller PL110/PL111
+
+See also Documentation/devicetree/bindings/arm/primecell.txt
+
+Required properties:
+
+- compatible: must be one of:
+=09"arm,pl110", "arm,primecell"
+=09"arm,pl111", "arm,primecell"
+
+- reg: base address and size of the control registers block
+
+- interrupt-names: either the single entry "combined" representing a
+=09combined interrupt output (CLCDINTR), or the four entries
+=09"mbe", "vcomp", "lnbu", "fuf" representing the individual
+=09CLCDMBEINTR, CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR interrupts
+
+- interrupts: contains an interrupt specifier for each entry in
+=09interrupt-names
+
+- clocks names: should contain "clcdclk" and "apb_pclk"
+
+- clocks: contains phandle and clock specifier pairs for the entries
+=09in the clock-names property. See
+=09Documentation/devicetree/binding/clock/clock-bindings.txt
+
+- arm,pl11x,panel-data-pads: array of 24 cells, each of them describing
+=09a function of one of the CLD pads, starting from 0 up to 23;
+=09each pad can be described by one of the following values:
+=09- 0: reserved (not connected)
+=09- 0x100-0x107: color upper STN panel data 0 to 7
+=09- 0x110-0x117: color lower STN panel data 0 to 7
+=09- 0x200-0x207: mono upper STN panel data 0 to 7
+=09- 0x210-0x217: mono lower STN panel data 0 to 7
+=09- 0x300-0x307: red component bit 0 to 7 of TFT panel data
+=09- 0x310-0x317: green component bit 0 to 7 of TFT panel data
+=09- 0x320-0x327: blue component bit 0 to 7 of TFT panel data
+=09- 0x330: intensity bit of TFT panel data
+=09Example sets of values for standard panel interfaces:
+=09- PL110 single colour STN panel:
+=09=09<0x107 0x106 0x105 0x104 0x103 0x102 0x101 0x100>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL110 dual colour STN panel:
+=09=09<0x107 0x106 0x105 0x104 0x103 0x102 0x101 0x100>,
+=09=09<0x117 0x116 0x115 0x114 0x113 0x112 0x111 0x110>,
+=09=09<0 0 0 0 0 0 0 0>;
+=09- PL110 single mono 4-bit STN panel:
+=09=09<0x203 0x202 0x201 0x200>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL110 dual mono 4-bit STN panel:
+=09=09<0x203 0x202 0x201 0x200>, <0 0 0 0>,
+=09=09<0x213 0x212 0x211 0x210>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL110 single mono 8-bit STN panel:
+=09=09<0x207 0x206 0x205 0x204 0x203 0x202 0x201 0x200>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL110 dual mono 8-bit STN panel:
+=09=09<0x207 0x206 0x205 0x204 0x203 0x202 0x201 0x200>,
+=09=09<0x217 0x216 0x215 0x214 0x213 0x212 0x211 0x210>,
+=09=09<0 0 0 0 0 0 0 0>;
+=09- PL110 TFT (1:)5:5:5 panel:
+=09=09<0x330 0x300 0x301 0x302 0x303 0x304>,
+=09=09<0x330 0x310 0x311 0x312 0x313 0x314>,
+=09=09<0x330 0x320 0x321 0x322 0x323 0x324>,
+=09=09<0 0 0 0 0 0>
+=09- PL110 and PL111 TFT RGB 888 panel:
+=09=09<0x300 0x301 0x302 0x303 0x304 0x305 0x306 0x307>,
+=09=09<0x310 0x311 0x312 0x313 0x314 0x315 0x316 0x317>,
+=09=09<0x320 0x321 0x322 0x323 0x324 0x325 0x326 0x327>;
+=09- PL111 single colour STN panel:
+=09=09<0x100 0x101 0x102 0x103 0x104 0x105 0x106 0x107>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL111 dual colour STN panel:
+=09=09<0x100 0x101 0x102 0x103 0x104 0x105 0x106 0x107>,
+=09=09<0x110 0x111 0x112 0x113 0x114 0x115 0x116 0x117>,
+=09=09<0 0 0 0 0 0 0 0>;
+=09- PL111 single mono 4-bit STN panel:
+=09=09<0x200 0x201 0x202 0x203>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL111 dual mono 4-bit STN panel:
+=09=09<0x200 0x201 0x202 0x203>, <0 0 0 0>,
+=09=09<0x210 0x211 0x212 0x213>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL111 single mono 8-bit STN panel:
+=09=09<0x200 0x201 0x202 0x203 0x204 0x205 0x206 0x207>,
+=09=09<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
+=09- PL111 dual mono 8-bit STN panel:
+=09=09<0x200 0x201 0x202 0x203 0x204 0x205 0x206 0x207>,
+=09=09<0x210 0x211 0x212 0x213 0x214 0x215 0x216 0x217>,
+=09=09<0 0 0 0 0 0 0 0>;
+=09- PL111 TFT 4:4:4 panel:
+=09=09<0 0 0 0>, <0x300 0x301 0x302 0x303>,
+=09=09<0 0 0 0>, <0x310 0x311 0x312 0x313>,
+=09=09<0 0 0 0>, <0x320 0x321 0x322 0x323>;
+=09- PL111 TFT 5:6:5 panel:
+=09=09<0 0 0>, <0x300 0x301 0x302 0x303 0x304>,
+=09=09<0 0>, <0x310 0x311 0x312 0x313 0x314 0x315>,
+=09=09<0 0 0>, <0x320 0x321 0x322 0x323 0x324>;
+=09- PL111 TFT (1):5:5:5 panel:
+=09=09<0 0 0>, <0x300 0x301 0x302 0x303 0x304>,
+=09=09<0 0>, <0x330 0x310 0x311 0x312 0x313 0x314>,
+=09=09<0 0 0>, <0x320 0x321 0x322 0x323 0x324>;
+
+Optional properties:
+
+- arm,pl11x,framebuffer-base: a pair of two values, address and size,
+=09defining the framebuffer that must be used; if not present, the
+=09framebuffer may be located anywhere in the memory
+
+- max-memory-bandwidth: maximum bandwidth in bytes per second that the
+=09cell's memory interface can handle
+
+- display-timings: standard display timings sub-node, defining possible
+=09video modes of a connected panel; for details see
+=09Documentation/devicetree/bindings/video/display-timing.txt
+
+Example:
+
+=09clcd@1f0000 {
+=09=09compatible =3D "arm,pl111", "arm,primecell";
+=09=09reg =3D <0x1f0000 0x1000>;
+=09=09interrupt-names =3D "combined";
+=09=09interrupts =3D <14>;
+=09=09clock-names =3D "clcdclk", "apb_pclk";
+=09=09clocks =3D <&v2m_oscclk1>, <&smbclk>;
+
+=09=09arm,pl11x,panel-data-pads =3D <0x300 0x301 0x302 0x303 0x304 0x305 0=
x306 0x307>,
+=09=09=09=09=09    <0x310 0x311 0x312 0x313 0x314 0x315 0x316 0x317>,
+=09=09=09=09=09    <0x320 0x321 0x322 0x323 0x324 0x325 0x326 0x327>;
+=09=09arm,pl11x,framebuffer-base =3D <0x18000000 0x00800000>;
+=09=09max-memory-bandwidth =3D <36864000>; /* bps, 640x480@60 16bpp */
+=09=09display-timings {
+=09=09=09native-mode =3D <&v2m_clcd_timing0>;
+=09=09=09v2m_clcd_timing0: vga {
+=09=09=09=09clock-frequency =3D <25175000>;
+=09=09=09=09hactive =3D <640>;
+=09=09=09=09hback-porch =3D <40>;
+=09=09=09=09hfront-porch =3D <24>;
+=09=09=09=09hsync-len =3D <96>;
+=09=09=09=09vactive =3D <480>;
+=09=09=09=09vback-porch =3D <32>;
+=09=09=09=09vfront-porch =3D <11>;
+=09=09=09=09vsync-len =3D <2>;
+=09=09=09};
+=09=09};
+=09};
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 84b685f..b7d8c23 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -316,6 +316,7 @@ config FB_ARMCLCD
 =09select FB_CFB_FILLRECT
 =09select FB_CFB_COPYAREA
 =09select FB_CFB_IMAGEBLIT
+=09select VIDEOMODE_HELPERS if OF
 =09help
 =09  This framebuffer device driver is for the ARM PrimeCell PL110
 =09  Colour LCD controller.  ARM PrimeCells provide the building
diff --git a/drivers/video/amba-clcd.c b/drivers/video/amba-clcd.c
index 0a2cce7..03420d1 100644
--- a/drivers/video/amba-clcd.c
+++ b/drivers/video/amba-clcd.c
@@ -25,6 +25,11 @@
 #include <linux/amba/clcd.h>
 #include <linux/clk.h>
 #include <linux/hardirq.h>
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
=20
 #include <asm/sizes.h>
=20
@@ -542,6 +547,266 @@ static int clcdfb_register(struct clcd_fb *fb)
 =09return ret;
 }
=20
+#ifdef CONFIG_OF
+
+#define CLCD_PADS_NUM 24
+
+#define CLCD_PAD_BIT(pad) ((pad) & 0xf)
+#define CLCD_PAD_TYPE(pad) (((pad) >> 8) & 0xf)
+
+#define CLCD_PAD_IS_TFT(pad) (CLCD_PAD_TYPE(pad) =3D=3D 0x3)
+
+#define CLCD_PAD_RGB(pad) (((pad) >> 4) & 0xf)
+#define CLCD_PAD_R 0x0
+#define CLCD_PAD_G 0x1
+#define CLCD_PAD_B 0x2
+
+static int clcdfb_of_init_tft_panel(struct clcd_fb *fb, u32 *pads)
+{
+=09static struct {
+=09=09unsigned int part;
+=09=09int r0, g0, b0;
+=09=09u32 caps;
+=09} panels[] =3D {
+=09=09{ 0x110, 1,  7, 13, CLCD_CAP_5551 },
+=09=09{ 0x110, 0,  8, 16, CLCD_CAP_888 },
+=09=09{ 0x111, 4, 14, 20, CLCD_CAP_444 },
+=09=09{ 0x111, 3, 11, 19, CLCD_CAP_444 | CLCD_CAP_5551 },
+=09=09{ 0x111, 3, 10, 19, CLCD_CAP_444 | CLCD_CAP_5551 |
+=09=09=09=09    CLCD_CAP_565 },
+=09=09{ 0x111, 0,  8, 16, CLCD_CAP_444 | CLCD_CAP_5551 |
+=09=09=09=09    CLCD_CAP_565 | CLCD_CAP_888 },
+=09};
+=09int r =3D 0, g =3D 0, b =3D 0;
+=09int r0 =3D -1, g0 =3D -1, b0 =3D -1;
+=09int i;
+
+=09/* Bypass pixel clock divider, data output on the falling edge */
+=09fb->panel->tim2 =3D TIM2_BCD | TIM2_IPC;
+
+=09/* TFT display, vert. comp. interrupt at the start of the back porch */
+=09fb->panel->cntl |=3D CNTL_LCDTFT | CNTL_LCDVCOMP(1);
+
+=09fb->panel->caps =3D 0;
+
+=09/*
+=09 * Find indices of the first component bits and make sure they
+=09 * are in correct order
+=09 */
+=09for (i =3D 0; i < CLCD_PADS_NUM; i++) {
+=09=09int bit;
+
+=09=09if (!pads[i])
+=09=09=09continue;
+=09=09switch (CLCD_PAD_RGB(pads[i])) {
+=09=09case CLCD_PAD_R:
+=09=09=09r0 =3D r ? r0 : i;
+=09=09=09bit =3D r++;
+=09=09=09break;
+=09=09case CLCD_PAD_G:
+=09=09=09g0 =3D g ? g0 : i;
+=09=09=09bit =3D g++;
+=09=09=09break;
+=09=09case CLCD_PAD_B:
+=09=09=09b0 =3D b ? b0 : i;
+=09=09=09bit =3D b++;
+=09=09=09break;
+=09=09default:
+=09=09=09return -EINVAL;
+=09=09}
+=09=09if (bit !=3D CLCD_PAD_BIT(pads[i]) || !CLCD_PAD_IS_TFT(pads[i]))
+=09=09=09return -EINVAL;
+=09}
+
+=09/* Match the setup with known variants */
+=09for (i =3D 0; i < ARRAY_SIZE(panels) && !fb->panel->caps; i++) {
+=09=09if (amba_part(fb->dev) !=3D panels[i].part)
+=09=09=09continue;
+=09=09if (g0 !=3D panels[i].g0)
+=09=09=09continue;
+=09=09if (r0 =3D=3D panels[i].r0 && b0 =3D=3D panels[i].b0)
+=09=09=09fb->panel->caps =3D panels[i].caps & CLCD_CAP_RGB;
+=09=09if (r0 =3D=3D panels[i].b0 && b0 =3D=3D panels[i].r0)
+=09=09=09fb->panel->caps =3D panels[i].caps & CLCD_CAP_BGR;
+=09}
+
+=09return fb->panel->caps ? 0 : -EINVAL;
+}
+
+static int clcdfb_snprintf_mode(char *buf, int size, struct fb_videomode *=
mode)
+{
+=09return snprintf(buf, size, "%ux%u@%u", mode->xres, mode->yres,
+=09=09=09mode->refresh);
+}
+
+static int clcdfb_of_init_display(struct clcd_fb *fb)
+{
+=09struct device_node *node =3D fb->dev->dev.of_node;
+=09int err, len;
+=09char *mode_name;
+=09u32 max_bandwidth;
+=09u32 pads[CLCD_PADS_NUM];
+=09int i;
+
+=09fb->panel =3D devm_kzalloc(&fb->dev->dev, sizeof(*fb->panel), GFP_KERNE=
L);
+=09if (!fb->panel)
+=09=09return -ENOMEM;
+
+=09err =3D of_get_fb_videomode(node, &fb->panel->mode, OF_USE_NATIVE_MODE)=
;
+=09if (err)
+=09=09return err;
+
+=09len =3D clcdfb_snprintf_mode(NULL, 0, &fb->panel->mode);
+=09mode_name =3D devm_kzalloc(&fb->dev->dev, len + 1, GFP_KERNEL);
+=09clcdfb_snprintf_mode(mode_name, len + 1, &fb->panel->mode);
+=09fb->panel->mode.name =3D mode_name;
+
+=09err =3D of_property_read_u32(node, "max-memory-bandwidth",
+=09=09=09&max_bandwidth);
+=09if (!err)
+=09=09fb->panel->bpp =3D 8 * max_bandwidth / (fb->panel->mode.xres *
+=09=09=09=09fb->panel->mode.yres * fb->panel->mode.refresh);
+=09else
+=09=09fb->panel->bpp =3D 32;
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+=09fb->panel->cntl |=3D CNTL_BEBO;
+#endif
+=09fb->panel->width =3D -1;
+=09fb->panel->height =3D -1;
+
+=09err =3D of_property_read_u32_array(node, "arm,pl11x,panel-data-pads",
+=09=09=09pads, ARRAY_SIZE(pads));
+=09if (err)
+=09=09return err;
+
+=09/* Find first connected pad - its type determines the panel */
+=09for (i =3D 0; i < CLCD_PADS_NUM; i++)
+=09=09if (pads[i] && CLCD_PAD_IS_TFT(pads[i]))
+=09=09=09return clcdfb_of_init_tft_panel(fb, pads);
+
+=09return -EINVAL;
+}
+
+static int clcdfb_of_vram_setup(struct clcd_fb *fb)
+{
+=09int err;
+=09u32 values[2];
+=09phys_addr_t phys_base;
+=09size_t size;
+
+=09err =3D clcdfb_of_init_display(fb);
+=09if (err)
+=09=09return err;
+
+=09err =3D of_property_read_u32_array(fb->dev->dev.of_node,
+=09=09=09"arm,pl11x,framebuffer-base",
+=09=09=09values, ARRAY_SIZE(values));
+=09if (err)
+=09=09return err;
+
+=09phys_base =3D values[0];
+=09size =3D values[1];
+
+=09fb->fb.screen_base =3D ioremap(phys_base, size);
+=09if (!fb->fb.screen_base)
+=09=09return -ENOMEM;
+
+=09fb->fb.fix.smem_start =3D phys_base;
+=09fb->fb.fix.smem_len =3D size;
+
+=09return 0;
+}
+
+static int clcdfb_of_vram_mmap(struct clcd_fb *fb, struct vm_area_struct *=
vma)
+{
+=09unsigned long off, user_size, kernel_size;
+
+=09off =3D vma->vm_pgoff << PAGE_SHIFT;
+=09user_size =3D vma->vm_end - vma->vm_start;
+=09kernel_size =3D fb->fb.fix.smem_len;
+
+=09if (off >=3D kernel_size || user_size > (kernel_size - off))
+=09=09return -ENXIO;
+
+=09return remap_pfn_range(vma, vma->vm_start,
+=09=09=09__phys_to_pfn(fb->fb.fix.smem_start) + vma->vm_pgoff,
+=09=09=09user_size,
+=09=09=09pgprot_writecombine(vma->vm_page_prot));
+}
+
+static void clcdfb_of_vram_remove(struct clcd_fb *fb)
+{
+=09iounmap(fb->fb.screen_base);
+}
+
+static int clcdfb_of_dma_setup(struct clcd_fb *fb)
+{
+=09unsigned long framesize;
+=09dma_addr_t dma;
+=09int err;
+
+=09err =3D clcdfb_of_init_display(fb);
+=09if (err)
+=09=09return err;
+
+=09framesize =3D fb->panel->mode.xres * fb->panel->mode.yres *
+=09=09=09fb->panel->bpp / 8;
+=09fb->fb.screen_base =3D dma_alloc_writecombine(&fb->dev->dev, framesize,
+=09=09=09&dma, GFP_KERNEL);
+=09if (!fb->fb.screen_base)
+=09=09return -ENOMEM;
+
+=09fb->fb.fix.smem_start =3D dma;
+=09fb->fb.fix.smem_len =3D framesize;
+
+=09return 0;
+}
+
+static int clcdfb_of_dma_mmap(struct clcd_fb *fb, struct vm_area_struct *v=
ma)
+{
+=09return dma_mmap_writecombine(&fb->dev->dev, vma, fb->fb.screen_base,
+=09=09=09fb->fb.fix.smem_start, fb->fb.fix.smem_len);
+}
+
+static void clcdfb_of_dma_remove(struct clcd_fb *fb)
+{
+=09dma_free_writecombine(&fb->dev->dev, fb->fb.fix.smem_len,
+=09=09=09fb->fb.screen_base, fb->fb.fix.smem_start);
+}
+
+static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
+{
+=09struct clcd_board *board =3D devm_kzalloc(&dev->dev, sizeof(*board),
+=09=09=09GFP_KERNEL);
+=09struct device_node *node =3D dev->dev.of_node;
+
+=09if (!board)
+=09=09return NULL;
+
+=09board->name =3D of_node_full_name(node);
+=09board->caps =3D CLCD_CAP_ALL;
+=09board->check =3D clcdfb_check;
+=09board->decode =3D clcdfb_decode;
+=09if (of_find_property(node, "arm,pl11x,framebuffer-base", NULL)) {
+=09=09board->setup =3D clcdfb_of_vram_setup;
+=09=09board->mmap =3D clcdfb_of_vram_mmap;
+=09=09board->remove =3D clcdfb_of_vram_remove;
+=09} else {
+=09=09board->setup =3D clcdfb_of_dma_setup;
+=09=09board->mmap =3D clcdfb_of_dma_mmap;
+=09=09board->remove =3D clcdfb_of_dma_remove;
+=09}
+
+=09return board;
+}
+#else
+static struct clcd_board *clcdfb_of_get_board(struct amba_dev *dev)
+{
+=09return NULL;
+}
+#endif
+
 static int clcdfb_probe(struct amba_device *dev, const struct amba_id *id)
 {
 =09struct clcd_board *board =3D dev->dev.platform_data;
@@ -549,6 +814,9 @@ static int clcdfb_probe(struct amba_device *dev, const =
struct amba_id *id)
 =09int ret;
=20
 =09if (!board)
+=09=09board =3D clcdfb_of_get_board(dev);
+
+=09if (!board)
 =09=09return -EINVAL;
=20
 =09ret =3D amba_request_regions(dev, NULL);
--=20
1.8.1.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
