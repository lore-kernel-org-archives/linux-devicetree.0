From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH v7 1/8] drm: sun8i: Add a basic DRM
 driver for Allwinner DE2
Date: Tue, 29 Nov 2016 22:33:20 +0800
Message-ID: <825691480430000@web35j.yandex.ru>
References: <cover.1480414715.git.moinejf@free.fr>
	 <592a49a2d9505fc0f09b555847892fb7a4047530.1480414715.git.moinejf@free.fr> <20161129143051.vn6exubsirwcauag@phenom.ffwll.local>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBNND63AQKGQEYPDHHHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161129143051.vn6exubsirwcauag-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org



29.11.2016, 22:30, "Daniel Vetter" <daniel-/w4YWyX8dFk@public.gmane.org>:
> On Mon, Nov 28, 2016 at 03:23:54PM +0100, Jean-Francois Moine wrote:
>> =C2=A0Allwinner's recent SoCs, as A64, A83T and H3, contain a new displa=
y
>> =C2=A0engine, DE2.
>> =C2=A0This patch adds a DRM video driver for this device.
>>
>> =C2=A0Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
>
> Scrolled around a bit, seemed all reasonable.
>
> Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
>
> Not sure a new driver for each chip is reasonable, experience says that
> long-term you want to share quite a pile of code between different hw
> platforms from the same vendor. But that's entirely up to you.
> -Daniel

The Display Engine on A83T and newer SoCs is quite new, different from
the ones on A33 and older.

It's called "DE 2.0" in the user manual of the SoCs.

>
>> =C2=A0---
>> =C2=A0=C2=A0drivers/gpu/drm/Kconfig | 2 +
>> =C2=A0=C2=A0drivers/gpu/drm/Makefile | 1 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/Kconfig | 19 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/Makefile | 7 +
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/de2_crtc.c | 449 +++++++++++++++++++++=
++
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/de2_crtc.h | 50 +++
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/de2_drv.c | 317 ++++++++++++++++
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/de2_drv.h | 48 +++
>> =C2=A0=C2=A0drivers/gpu/drm/sun8i/de2_plane.c | 734 ++++++++++++++++++++=
++++++++++++++++++
>> =C2=A0=C2=A09 files changed, 1627 insertions(+)
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/Kconfig
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/Makefile
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.c
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/de2_crtc.h
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/de2_drv.c
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/de2_drv.h
>> =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/sun8i/de2_plane.c
>>
>> =C2=A0diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> =C2=A0index 95fc041..bb1bfbc 100644
>> =C2=A0--- a/drivers/gpu/drm/Kconfig
>> =C2=A0+++ b/drivers/gpu/drm/Kconfig
>> =C2=A0@@ -202,6 +202,8 @@ source "drivers/gpu/drm/shmobile/Kconfig"
>>
>> =C2=A0=C2=A0source "drivers/gpu/drm/sun4i/Kconfig"
>>
>> =C2=A0+source "drivers/gpu/drm/sun8i/Kconfig"
>> =C2=A0+
>> =C2=A0=C2=A0source "drivers/gpu/drm/omapdrm/Kconfig"
>>
>> =C2=A0=C2=A0source "drivers/gpu/drm/tilcdc/Kconfig"
>> =C2=A0diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> =C2=A0index 883f3e7..3e1eaa0 100644
>> =C2=A0--- a/drivers/gpu/drm/Makefile
>> =C2=A0+++ b/drivers/gpu/drm/Makefile
>> =C2=A0@@ -72,6 +72,7 @@ obj-$(CONFIG_DRM_RCAR_DU) +=3D rcar-du/
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SHMOBILE) +=3Dshmobile/
>> =C2=A0=C2=A0obj-y +=3D omapdrm/
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_SUN4I) +=3D sun4i/
>> =C2=A0+obj-$(CONFIG_DRM_SUN8I) +=3D sun8i/
>> =C2=A0=C2=A0obj-y +=3D tilcdc/
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_QXL) +=3D qxl/
>> =C2=A0=C2=A0obj-$(CONFIG_DRM_BOCHS) +=3D bochs/
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/Kconfig b/drivers/gpu/drm/sun8i=
/Kconfig
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..6940895
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/Kconfig
>> =C2=A0@@ -0,0 +1,19 @@
>> =C2=A0+#
>> =C2=A0+# Allwinner DE2 Video configuration
>> =C2=A0+#
>> =C2=A0+
>> =C2=A0+config DRM_SUN8I
>> =C2=A0+ bool
>> =C2=A0+
>> =C2=A0+config DRM_SUN8I_DE2
>> =C2=A0+ tristate "Support for Allwinner Video with DE2 interface"
>> =C2=A0+ depends on DRM && OF
>> =C2=A0+ depends on ARCH_SUNXI || COMPILE_TEST
>> =C2=A0+ select DRM_GEM_CMA_HELPER
>> =C2=A0+ select DRM_KMS_CMA_HELPER
>> =C2=A0+ select DRM_KMS_HELPER
>> =C2=A0+ select DRM_SUN8I
>> =C2=A0+ help
>> =C2=A0+ Choose this option if your Allwinner chipset has the DE2 interfa=
ce
>> =C2=A0+ as the A64, A83T and H3. If M is selected the module will be cal=
led
>> =C2=A0+ sun8i-de2-drm.
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/Makefile b/drivers/gpu/drm/sun8=
i/Makefile
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..f107919
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/Makefile
>> =C2=A0@@ -0,0 +1,7 @@
>> =C2=A0+#
>> =C2=A0+# Makefile for Allwinner's sun8i DRM device driver
>> =C2=A0+#
>> =C2=A0+
>> =C2=A0+sun8i-de2-drm-objs :=3D de2_drv.o de2_crtc.o de2_plane.o
>> =C2=A0+
>> =C2=A0+obj-$(CONFIG_DRM_SUN8I_DE2) +=3D sun8i-de2-drm.o
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/de2_crtc.c b/drivers/gpu/drm/su=
n8i/de2_crtc.c
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..4e94ccc
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/de2_crtc.c
>> =C2=A0@@ -0,0 +1,449 @@
>> =C2=A0+/*
>> =C2=A0+ * Allwinner DRM driver - DE2 CRTC
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2016 Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <linux/component.h>
>> =C2=A0+#include <drm/drm_crtc_helper.h>
>> =C2=A0+#include <drm/drm_atomic_helper.h>
>> =C2=A0+#include <linux/io.h>
>> =C2=A0+#include <linux/of_irq.h>
>> =C2=A0+#include <linux/of_graph.h>
>> =C2=A0+
>> =C2=A0+#include "de2_drv.h"
>> =C2=A0+#include "de2_crtc.h"
>> =C2=A0+
>> =C2=A0+/* I/O map */
>> =C2=A0+
>> =C2=A0+#define TCON_GCTL_REG 0x00
>> =C2=A0+#define TCON_GCTL_TCON_ENABLE BIT(31)
>> =C2=A0+#define TCON_GINT0_REG 0x04
>> =C2=A0+#define TCON_GINT0_TCON1_Vb_Int_En BIT(30)
>> =C2=A0+#define TCON_GINT0_TCON1_Vb_Int_Flag BIT(14)
>> =C2=A0+#define TCON_GINT0_TCON1_Vb_Line_Int_Flag BIT(12)
>> =C2=A0+#define TCON0_CTL_REG 0x40
>> =C2=A0+#define TCON0_CTL_TCON_ENABLE BIT(31)
>> =C2=A0+#define TCON1_CTL_REG 0x90
>> =C2=A0+#define TCON1_CTL_TCON_ENABLE BIT(31)
>> =C2=A0+#define TCON1_CTL_INTERLACE_ENABLE BIT(20)
>> =C2=A0+#define TCON1_CTL_Start_Delay_SHIFT 4
>> =C2=A0+#define TCON1_CTL_Start_Delay_MASK GENMASK(8, 4)
>> =C2=A0+#define TCON1_BASIC0_REG 0x94 /* XI/YI */
>> =C2=A0+#define TCON1_BASIC1_REG 0x98 /* LS_XO/LS_YO */
>> =C2=A0+#define TCON1_BASIC2_REG 0x9c /* XO/YO */
>> =C2=A0+#define TCON1_BASIC3_REG 0xa0 /* HT/HBP */
>> =C2=A0+#define TCON1_BASIC4_REG 0xa4 /* VT/VBP */
>> =C2=A0+#define TCON1_BASIC5_REG 0xa8 /* HSPW/VSPW */
>> =C2=A0+#define TCON1_PS_SYNC_REG 0xb0
>> =C2=A0+#define TCON1_IO_POL_REG 0xf0
>> =C2=A0+#define TCON1_IO_POL_IO0_inv BIT(24)
>> =C2=A0+#define TCON1_IO_POL_IO1_inv BIT(25)
>> =C2=A0+#define TCON1_IO_POL_IO2_inv BIT(26)
>> =C2=A0+#define TCON1_IO_TRI_REG 0xf4
>> =C2=A0+#define TCON_CEU_CTL_REG 0x100
>> =C2=A0+#define TCON_CEU_CTL_ceu_en BIT(31)
>> =C2=A0+#define TCON1_FILL_CTL_REG 0x300
>> =C2=A0+#define TCON1_FILL_START0_REG 0x304
>> =C2=A0+#define TCON1_FILL_END0_REG 0x308
>> =C2=A0+#define TCON1_FILL_DATA0_REG 0x30c
>> =C2=A0+
>> =C2=A0+#define XY(x, y) (((x) << 16) | (y))
>> =C2=A0+
>> =C2=A0+#define andl_relaxed(addr, val) \
>> =C2=A0+ writel_relaxed(readl_relaxed(addr) & val, addr)
>> =C2=A0+#define orl_relaxed(addr, val) \
>> =C2=A0+ writel_relaxed(readl_relaxed(addr) | val, addr)
>> =C2=A0+
>> =C2=A0+/* vertical blank functions */
>> =C2=A0+
>> =C2=A0+static void de2_atomic_flush(struct drm_crtc *crtc,
>> =C2=A0+ struct drm_crtc_state *old_state)
>> =C2=A0+{
>> =C2=A0+ struct drm_pending_vblank_event *event =3D crtc->state->event;
>> =C2=A0+
>> =C2=A0+ if (event) {
>> =C2=A0+ crtc->state->event =3D NULL;
>> =C2=A0+ spin_lock_irq(&crtc->dev->event_lock);
>> =C2=A0+ if (drm_crtc_vblank_get(crtc) =3D=3D 0)
>> =C2=A0+ drm_crtc_arm_vblank_event(crtc, event);
>> =C2=A0+ else
>> =C2=A0+ drm_crtc_send_vblank_event(crtc, event);
>> =C2=A0+ spin_unlock_irq(&crtc->dev->event_lock);
>> =C2=A0+ }
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static irqreturn_t de2_lcd_irq(int irq, void *dev_id)
>> =C2=A0+{
>> =C2=A0+ struct lcd *lcd =3D (struct lcd *) dev_id;
>> =C2=A0+ u32 isr;
>> =C2=A0+
>> =C2=A0+ isr =3D readl_relaxed(lcd->mmio + TCON_GINT0_REG);
>> =C2=A0+
>> =C2=A0+ drm_crtc_handle_vblank(&lcd->crtc);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(isr &
>> =C2=A0+ ~(TCON_GINT0_TCON1_Vb_Int_Flag |
>> =C2=A0+ TCON_GINT0_TCON1_Vb_Line_Int_Flag),
>> =C2=A0+ lcd->mmio + TCON_GINT0_REG);
>> =C2=A0+
>> =C2=A0+ return IRQ_HANDLED;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+int de2_enable_vblank(struct drm_device *drm, unsigned int crtc_i=
x)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+ struct lcd *lcd =3D priv->lcds[crtc_ix];
>> =C2=A0+
>> =C2=A0+ orl_relaxed(lcd->mmio + TCON_GINT0_REG, TCON_GINT0_TCON1_Vb_Int_=
En);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+void de2_disable_vblank(struct drm_device *drm, unsigned int crtc=
_ix)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+ struct lcd *lcd =3D priv->lcds[crtc_ix];
>> =C2=A0+
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON_GINT0_REG, ~TCON_GINT0_TCON1_Vb_In=
t_En);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+void de2_vblank_reset(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ drm_crtc_vblank_reset(&lcd->crtc);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* frame functions */
>> =C2=A0+static int de2_crtc_set_clock(struct lcd *lcd, int rate)
>> =C2=A0+{
>> =C2=A0+ struct clk *parent_clk;
>> =C2=A0+ u32 parent_rate;
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ /* determine and set the best rate for the parent clock (pll-vid=
eo) */
>> =C2=A0+ if ((270000 * 2) % rate =3D=3D 0)
>> =C2=A0+ parent_rate =3D 270000000;
>> =C2=A0+ else if (297000 % rate =3D=3D 0)
>> =C2=A0+ parent_rate =3D 297000000;
>> =C2=A0+ else
>> =C2=A0+ return -EINVAL; /* unsupported clock */
>> =C2=A0+
>> =C2=A0+ parent_clk =3D clk_get_parent(lcd->clk);
>> =C2=A0+
>> =C2=A0+ ret =3D clk_set_rate(parent_clk, parent_rate);
>> =C2=A0+ if (ret) {
>> =C2=A0+ dev_err(lcd->dev, "set parent rate failed %d\n", ret);
>> =C2=A0+ return ret;
>> =C2=A0+ }
>> =C2=A0+ ret =3D clk_set_rate(lcd->clk, rate * 1000);
>> =C2=A0+ if (ret) {
>> =C2=A0+ dev_err(lcd->dev, "set rate failed %d\n", ret);
>> =C2=A0+ return ret;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* enable the clock */
>> =C2=A0+ reset_control_deassert(lcd->reset);
>> =C2=A0+ clk_prepare_enable(lcd->bus);
>> =C2=A0+ clk_prepare_enable(lcd->clk);
>> =C2=A0+
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_tcon_init(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON0_CTL_REG, ~TCON0_CTL_TCON_ENABLE);
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON1_CTL_REG, ~TCON1_CTL_TCON_ENABLE);
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON_GCTL_REG, ~TCON_GCTL_TCON_ENABLE);
>> =C2=A0+
>> =C2=A0+ /* disable/ack interrupts */
>> =C2=A0+ writel_relaxed(0, lcd->mmio + TCON_GINT0_REG);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_tcon_enable(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ struct drm_crtc *crtc =3D &lcd->crtc;
>> =C2=A0+ const struct drm_display_mode *mode =3D &crtc->mode;
>> =C2=A0+ int interlace =3D mode->flags & DRM_MODE_FLAG_INTERLACE ? 2 : 1;
>> =C2=A0+ int start_delay;
>> =C2=A0+ u32 data;
>> =C2=A0+
>> =C2=A0+ orl_relaxed(lcd->mmio + TCON_GCTL_REG, TCON_GCTL_TCON_ENABLE);
>> =C2=A0+
>> =C2=A0+ data =3D XY(mode->hdisplay - 1, mode->vdisplay / interlace - 1);
>> =C2=A0+ writel_relaxed(data, lcd->mmio + TCON1_BASIC0_REG);
>> =C2=A0+ writel_relaxed(data, lcd->mmio + TCON1_BASIC1_REG);
>> =C2=A0+ writel_relaxed(data, lcd->mmio + TCON1_BASIC2_REG);
>> =C2=A0+ writel_relaxed(XY(mode->htotal - 1,
>> =C2=A0+ mode->htotal - mode->hsync_start - 1),
>> =C2=A0+ lcd->mmio + TCON1_BASIC3_REG);
>> =C2=A0+ writel_relaxed(XY(mode->vtotal * (3 - interlace),
>> =C2=A0+ mode->vtotal - mode->vsync_start - 1),
>> =C2=A0+ lcd->mmio + TCON1_BASIC4_REG);
>> =C2=A0+ writel_relaxed(XY(mode->hsync_end - mode->hsync_start - 1,
>> =C2=A0+ mode->vsync_end - mode->vsync_start - 1),
>> =C2=A0+ lcd->mmio + TCON1_BASIC5_REG);
>> =C2=A0+
>> =C2=A0+ data =3D TCON1_IO_POL_IO2_inv;
>> =C2=A0+ if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>> =C2=A0+ data |=3D TCON1_IO_POL_IO0_inv;
>> =C2=A0+ if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>> =C2=A0+ data |=3D TCON1_IO_POL_IO1_inv;
>> =C2=A0+ writel_relaxed(data, lcd->mmio + TCON1_IO_POL_REG);
>> =C2=A0+
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON_CEU_CTL_REG, ~TCON_CEU_CTL_ceu_en)=
;
>> =C2=A0+
>> =C2=A0+ if (interlace =3D=3D 2)
>> =C2=A0+ orl_relaxed(lcd->mmio + TCON1_CTL_REG,
>> =C2=A0+ TCON1_CTL_INTERLACE_ENABLE);
>> =C2=A0+ else
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON1_CTL_REG,
>> =C2=A0+ ~TCON1_CTL_INTERLACE_ENABLE);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(0, lcd->mmio + TCON1_FILL_CTL_REG);
>> =C2=A0+ writel_relaxed(mode->vtotal + 1, lcd->mmio + TCON1_FILL_START0_R=
EG);
>> =C2=A0+ writel_relaxed(mode->vtotal, lcd->mmio + TCON1_FILL_END0_REG);
>> =C2=A0+ writel_relaxed(0, lcd->mmio + TCON1_FILL_DATA0_REG);
>> =C2=A0+
>> =C2=A0+ start_delay =3D (mode->vtotal - mode->vdisplay) / interlace - 5;
>> =C2=A0+ if (start_delay > 31)
>> =C2=A0+ start_delay =3D 31;
>> =C2=A0+ data =3D readl_relaxed(lcd->mmio + TCON1_CTL_REG);
>> =C2=A0+ data &=3D ~TCON1_CTL_Start_Delay_MASK;
>> =C2=A0+ data |=3D start_delay << TCON1_CTL_Start_Delay_SHIFT;
>> =C2=A0+ writel_relaxed(data, lcd->mmio + TCON1_CTL_REG);
>> =C2=A0+
>> =C2=A0+ orl_relaxed(lcd->mmio + TCON1_CTL_REG, TCON1_CTL_TCON_ENABLE);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_tcon_disable(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON1_CTL_REG, ~TCON1_CTL_TCON_ENABLE);
>> =C2=A0+ andl_relaxed(lcd->mmio + TCON_GCTL_REG, ~TCON_GCTL_TCON_ENABLE);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_crtc_enable(struct drm_crtc *crtc)
>> =C2=A0+{
>> =C2=A0+ struct lcd *lcd =3D crtc_to_lcd(crtc);
>> =C2=A0+ struct drm_display_mode *mode =3D &crtc->mode;
>> =C2=A0+
>> =C2=A0+ if (de2_crtc_set_clock(lcd, mode->clock) < 0)
>> =C2=A0+ return;
>> =C2=A0+ lcd->clk_enabled =3D true;
>> =C2=A0+
>> =C2=A0+ /* start the TCON and the DE */
>> =C2=A0+ de2_tcon_enable(lcd);
>> =C2=A0+ de2_de_enable(lcd);
>> =C2=A0+
>> =C2=A0+ /* turn on blanking interrupt */
>> =C2=A0+ drm_crtc_vblank_on(crtc);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_crtc_disable(struct drm_crtc *crtc,
>> =C2=A0+ struct drm_crtc_state *old_crtc_state)
>> =C2=A0+{
>> =C2=A0+ struct lcd *lcd =3D crtc_to_lcd(crtc);
>> =C2=A0+
>> =C2=A0+ if (!lcd->clk_enabled)
>> =C2=A0+ return; /* already disabled */
>> =C2=A0+ lcd->clk_enabled =3D false;
>> =C2=A0+
>> =C2=A0+ de2_de_disable(lcd);
>> =C2=A0+
>> =C2=A0+ drm_crtc_vblank_off(crtc);
>> =C2=A0+
>> =C2=A0+ de2_tcon_disable(lcd);
>> =C2=A0+
>> =C2=A0+ clk_disable_unprepare(lcd->clk);
>> =C2=A0+ clk_disable_unprepare(lcd->bus);
>> =C2=A0+ reset_control_assert(lcd->reset);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct drm_crtc_funcs de2_crtc_funcs =3D {
>> =C2=A0+ .destroy =3D drm_crtc_cleanup,
>> =C2=A0+ .set_config =3D drm_atomic_helper_set_config,
>> =C2=A0+ .page_flip =3D drm_atomic_helper_page_flip,
>> =C2=A0+ .reset =3D drm_atomic_helper_crtc_reset,
>> =C2=A0+ .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_sta=
te,
>> =C2=A0+ .atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const struct drm_crtc_helper_funcs de2_crtc_helper_funcs =
=3D {
>> =C2=A0+ .atomic_flush =3D de2_atomic_flush,
>> =C2=A0+ .enable =3D de2_crtc_enable,
>> =C2=A0+ .atomic_disable =3D de2_crtc_disable,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+/* device init */
>> =C2=A0+static int de2_lcd_bind(struct device *dev, struct device *master=
,
>> =C2=A0+ void *data)
>> =C2=A0+{
>> =C2=A0+ struct drm_device *drm =3D data;
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+ struct lcd *lcd =3D dev_get_drvdata(dev);
>> =C2=A0+ struct drm_crtc *crtc =3D &lcd->crtc;
>> =C2=A0+ int ret, i, crtc_ix;
>> =C2=A0+
>> =C2=A0+ lcd->priv =3D priv;
>> =C2=A0+
>> =C2=A0+ /* set the CRTC reference */
>> =C2=A0+ crtc_ix =3D drm_crtc_index(crtc);
>> =C2=A0+ if (crtc_ix >=3D ARRAY_SIZE(priv->lcds)) {
>> =C2=A0+ dev_err(drm->dev, "Bad crtc index");
>> =C2=A0+ return -ENOENT;
>> =C2=A0+ }
>> =C2=A0+ priv->lcds[crtc_ix] =3D lcd;
>> =C2=A0+
>> =C2=A0+ /* and the mixer index (DT port index in the DE) */
>> =C2=A0+ for (i =3D 0; ; i++) {
>> =C2=A0+ struct device_node *port;
>> =C2=A0+
>> =C2=A0+ port =3D of_parse_phandle(drm->dev->of_node, "ports", i);
>> =C2=A0+ if (!port)
>> =C2=A0+ break;
>> =C2=A0+ if (port =3D=3D lcd->crtc.port) {
>> =C2=A0+ lcd->mixer =3D i;
>> =C2=A0+ break;
>> =C2=A0+ }
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ ret =3D de2_plane_init(drm, lcd);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ return ret;
>> =C2=A0+
>> =C2=A0+ drm_crtc_helper_add(crtc, &de2_crtc_helper_funcs);
>> =C2=A0+
>> =C2=A0+ return drm_crtc_init_with_planes(drm, crtc,
>> =C2=A0+ &lcd->planes[DE2_PRIMARY_PLANE],
>> =C2=A0+ &lcd->planes[DE2_CURSOR_PLANE],
>> =C2=A0+ &de2_crtc_funcs, NULL);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_lcd_unbind(struct device *dev, struct device *mas=
ter,
>> =C2=A0+ void *data)
>> =C2=A0+{
>> =C2=A0+ struct platform_device *pdev =3D to_platform_device(dev);
>> =C2=A0+ struct lcd *lcd =3D platform_get_drvdata(pdev);
>> =C2=A0+
>> =C2=A0+ if (lcd->priv)
>> =C2=A0+ lcd->priv->lcds[drm_crtc_index(&lcd->crtc)] =3D NULL;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct component_ops de2_lcd_ops =3D {
>> =C2=A0+ .bind =3D de2_lcd_bind,
>> =C2=A0+ .unbind =3D de2_lcd_unbind,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int de2_lcd_probe(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ struct device *dev =3D &pdev->dev;
>> =C2=A0+ struct device_node *np =3D dev->of_node, *tmp, *parent, *port;
>> =C2=A0+ struct lcd *lcd;
>> =C2=A0+ struct resource *res;
>> =C2=A0+ int id, irq, ret;
>> =C2=A0+
>> =C2=A0+ lcd =3D devm_kzalloc(dev, sizeof(*lcd), GFP_KERNEL);
>> =C2=A0+ if (!lcd)
>> =C2=A0+ return -ENOMEM;
>> =C2=A0+
>> =C2=A0+ dev_set_drvdata(dev, lcd);
>> =C2=A0+ lcd->dev =3D dev;
>> =C2=A0+ lcd->mixer =3D id;
>> =C2=A0+
>> =C2=A0+ res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =C2=A0+ if (!res) {
>> =C2=A0+ dev_err(dev, "failed to get memory resource\n");
>> =C2=A0+ return -EINVAL;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ lcd->mmio =3D devm_ioremap_resource(dev, res);
>> =C2=A0+ if (IS_ERR(lcd->mmio)) {
>> =C2=A0+ dev_err(dev, "failed to map registers\n");
>> =C2=A0+ return PTR_ERR(lcd->mmio);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* possible CRTC */
>> =C2=A0+ parent =3D np;
>> =C2=A0+ tmp =3D of_get_child_by_name(np, "ports");
>> =C2=A0+ if (tmp)
>> =C2=A0+ parent =3D tmp;
>> =C2=A0+ port =3D of_get_child_by_name(parent, "port");
>> =C2=A0+ of_node_put(tmp);
>> =C2=A0+ if (!port) {
>> =C2=A0+ dev_err(dev, "no port node\n");
>> =C2=A0+ return -ENXIO;
>> =C2=A0+ }
>> =C2=A0+ lcd->crtc.port =3D port;
>> =C2=A0+
>> =C2=A0+ lcd->bus =3D devm_clk_get(dev, "bus");
>> =C2=A0+ if (IS_ERR(lcd->bus)) {
>> =C2=A0+ dev_err(dev, "get bus clock err %d\n", (int) PTR_ERR(lcd->bus));
>> =C2=A0+ ret =3D PTR_ERR(lcd->bus);
>> =C2=A0+ goto err;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ lcd->clk =3D devm_clk_get(dev, "clock");
>> =C2=A0+ if (IS_ERR(lcd->clk)) {
>> =C2=A0+ ret =3D PTR_ERR(lcd->clk);
>> =C2=A0+ dev_err(dev, "get video clock err %d\n", ret);
>> =C2=A0+ goto err;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ lcd->reset =3D devm_reset_control_get(dev, NULL);
>> =C2=A0+ if (IS_ERR(lcd->reset)) {
>> =C2=A0+ ret =3D PTR_ERR(lcd->reset);
>> =C2=A0+ dev_err(dev, "get reset err %d\n", ret);
>> =C2=A0+ goto err;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ irq =3D platform_get_irq(pdev, 0);
>> =C2=A0+ if (irq <=3D 0) {
>> =C2=A0+ dev_err(dev, "unable to get irq\n");
>> =C2=A0+ ret =3D -EINVAL;
>> =C2=A0+ goto err;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ de2_tcon_init(lcd); /* stop TCON and avoid interrupts */
>> =C2=A0+
>> =C2=A0+ ret =3D devm_request_irq(dev, irq, de2_lcd_irq, 0,
>> =C2=A0+ dev_name(dev), lcd);
>> =C2=A0+ if (ret < 0) {
>> =C2=A0+ dev_err(dev, "unable to request irq %d\n", irq);
>> =C2=A0+ goto err;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ return component_add(dev, &de2_lcd_ops);
>> =C2=A0+
>> =C2=A0+err:
>> =C2=A0+ of_node_put(lcd->crtc.port);
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int de2_lcd_remove(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ struct lcd *lcd =3D platform_get_drvdata(pdev);
>> =C2=A0+
>> =C2=A0+ component_del(&pdev->dev, &de2_lcd_ops);
>> =C2=A0+
>> =C2=A0+ of_node_put(lcd->crtc.port);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct of_device_id de2_lcd_ids[] =3D {
>> =C2=A0+ { .compatible =3D "allwinner,sun8i-a83t-tcon", },
>> =C2=A0+ { }
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+struct platform_driver de2_lcd_platform_driver =3D {
>> =C2=A0+ .probe =3D de2_lcd_probe,
>> =C2=A0+ .remove =3D de2_lcd_remove,
>> =C2=A0+ .driver =3D {
>> =C2=A0+ .name =3D "sun8i-de2-tcon",
>> =C2=A0+ .of_match_table =3D of_match_ptr(de2_lcd_ids),
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/de2_crtc.h b/drivers/gpu/drm/su=
n8i/de2_crtc.h
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..c0d34a7
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/de2_crtc.h
>> =C2=A0@@ -0,0 +1,50 @@
>> =C2=A0+#ifndef __DE2_CRTC_H__
>> =C2=A0+#define __DE2_CRTC_H__
>> =C2=A0+/*
>> =C2=A0+ * Copyright (C) 2016 Jean-Fran??ois Moine
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <drm/drm_plane_helper.h>
>> =C2=A0+
>> =C2=A0+struct clk;
>> =C2=A0+struct reset_control;
>> =C2=A0+struct priv;
>> =C2=A0+
>> =C2=A0+/* planes */
>> =C2=A0+#define DE2_PRIMARY_PLANE 0
>> =C2=A0+#define DE2_CURSOR_PLANE 1
>> =C2=A0+#define DE2_N_PLANES 5 /* number of planes - see plane_tb[] in de=
2_plane.c */
>> =C2=A0+
>> =C2=A0+struct lcd {
>> =C2=A0+ void __iomem *mmio;
>> =C2=A0+
>> =C2=A0+ struct device *dev;
>> =C2=A0+ struct drm_crtc crtc;
>> =C2=A0+
>> =C2=A0+ struct priv *priv; /* DRM/DE private data */
>> =C2=A0+
>> =C2=A0+ u8 mixer; /* LCD (mixer) number */
>> =C2=A0+ u8 delayed; /* bitmap of planes with delayed update */
>> =C2=A0+
>> =C2=A0+ u8 clk_enabled; /* used for error in crtc_enable */
>> =C2=A0+
>> =C2=A0+ struct clk *clk;
>> =C2=A0+ struct clk *bus;
>> =C2=A0+ struct reset_control *reset;
>> =C2=A0+
>> =C2=A0+ struct drm_plane planes[DE2_N_PLANES];
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+#define crtc_to_lcd(x) container_of(x, struct lcd, crtc)
>> =C2=A0+
>> =C2=A0+/* in de2_plane.c */
>> =C2=A0+void de2_de_enable(struct lcd *lcd);
>> =C2=A0+void de2_de_disable(struct lcd *lcd);
>> =C2=A0+int de2_plane_init(struct drm_device *drm, struct lcd *lcd);
>> =C2=A0+
>> =C2=A0+#endif /* __DE2_CRTC_H__ */
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/de2_drv.c b/drivers/gpu/drm/sun=
8i/de2_drv.c
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..f96babe
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/de2_drv.c
>> =C2=A0@@ -0,0 +1,317 @@
>> =C2=A0+/*
>> =C2=A0+ * Allwinner DRM driver - DE2 DRM driver
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2016 Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <linux/module.h>
>> =C2=A0+#include <linux/of_device.h>
>> =C2=A0+#include <drm/drm_of.h>
>> =C2=A0+#include <linux/component.h>
>> =C2=A0+#include <drm/drm_atomic_helper.h>
>> =C2=A0+#include <drm/drm_crtc_helper.h>
>> =C2=A0+#include <drm/drm_fb_cma_helper.h>
>> =C2=A0+#include <drm/drm_gem_cma_helper.h>
>> =C2=A0+
>> =C2=A0+#include "de2_drv.h"
>> =C2=A0+
>> =C2=A0+#define DRIVER_NAME "sun8i-de2"
>> =C2=A0+#define DRIVER_DESC "Allwinner DRM DE2"
>> =C2=A0+#define DRIVER_DATE "20161101"
>> =C2=A0+#define DRIVER_MAJOR 1
>> =C2=A0+#define DRIVER_MINOR 0
>> =C2=A0+
>> =C2=A0+static const struct of_device_id de2_drm_of_match[] =3D {
>> =C2=A0+ { .compatible =3D "allwinner,sun8i-a83t-display-engine",
>> =C2=A0+ .data =3D (void *) SOC_A83T },
>> =C2=A0+ { .compatible =3D "allwinner,sun8i-h3-display-engine",
>> =C2=A0+ .data =3D (void *) SOC_H3 },
>> =C2=A0+ { },
>> =C2=A0+};
>> =C2=A0+MODULE_DEVICE_TABLE(of, de2_drm_of_match);
>> =C2=A0+
>> =C2=A0+static void de2_fb_output_poll_changed(struct drm_device *drm)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+
>> =C2=A0+ if (priv->fbdev)
>> =C2=A0+ drm_fbdev_cma_hotplug_event(priv->fbdev);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct drm_mode_config_funcs de2_mode_config_funcs =
=3D {
>> =C2=A0+ .fb_create =3D drm_fb_cma_create,
>> =C2=A0+ .output_poll_changed =3D de2_fb_output_poll_changed,
>> =C2=A0+ .atomic_check =3D drm_atomic_helper_check,
>> =C2=A0+ .atomic_commit =3D drm_atomic_helper_commit,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+/* -- DRM operations -- */
>> =C2=A0+
>> =C2=A0+static void de2_lastclose(struct drm_device *drm)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+
>> =C2=A0+ if (priv->fbdev)
>> =C2=A0+ drm_fbdev_cma_restore_mode(priv->fbdev);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct file_operations de2_fops =3D {
>> =C2=A0+ .owner =3D THIS_MODULE,
>> =C2=A0+ .open =3D drm_open,
>> =C2=A0+ .release =3D drm_release,
>> =C2=A0+ .unlocked_ioctl =3D drm_ioctl,
>> =C2=A0+ .poll =3D drm_poll,
>> =C2=A0+ .read =3D drm_read,
>> =C2=A0+ .llseek =3D no_llseek,
>> =C2=A0+ .mmap =3D drm_gem_cma_mmap,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static struct drm_driver de2_drm_driver =3D {
>> =C2=A0+ .driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME =
|
>> =C2=A0+ DRIVER_ATOMIC,
>> =C2=A0+ .lastclose =3D de2_lastclose,
>> =C2=A0+ .get_vblank_counter =3D drm_vblank_no_hw_counter,
>> =C2=A0+ .enable_vblank =3D de2_enable_vblank,
>> =C2=A0+ .disable_vblank =3D de2_disable_vblank,
>> =C2=A0+ .gem_free_object =3D drm_gem_cma_free_object,
>> =C2=A0+ .gem_vm_ops =3D &drm_gem_cma_vm_ops,
>> =C2=A0+ .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>> =C2=A0+ .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>> =C2=A0+ .gem_prime_import =3D drm_gem_prime_import,
>> =C2=A0+ .gem_prime_export =3D drm_gem_prime_export,
>> =C2=A0+ .gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
>> =C2=A0+ .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table=
,
>> =C2=A0+ .gem_prime_vmap =3D drm_gem_cma_prime_vmap,
>> =C2=A0+ .gem_prime_vunmap =3D drm_gem_cma_prime_vunmap,
>> =C2=A0+ .gem_prime_mmap =3D drm_gem_cma_prime_mmap,
>> =C2=A0+ .dumb_create =3D drm_gem_cma_dumb_create,
>> =C2=A0+ .dumb_map_offset =3D drm_gem_cma_dumb_map_offset,
>> =C2=A0+ .dumb_destroy =3D drm_gem_dumb_destroy,
>> =C2=A0+ .fops =3D &de2_fops,
>> =C2=A0+ .name =3D DRIVER_NAME,
>> =C2=A0+ .desc =3D DRIVER_DESC,
>> =C2=A0+ .date =3D DRIVER_DATE,
>> =C2=A0+ .major =3D DRIVER_MAJOR,
>> =C2=A0+ .minor =3D DRIVER_MINOR,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * Platform driver
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+static int de2_drm_bind(struct device *dev)
>> =C2=A0+{
>> =C2=A0+ struct drm_device *drm;
>> =C2=A0+ struct priv *priv;
>> =C2=A0+ struct resource *res;
>> =C2=A0+ struct lcd *lcd;
>> =C2=A0+ int i, ret;
>> =C2=A0+
>> =C2=A0+ priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
>> =C2=A0+ if (!priv)
>> =C2=A0+ return -ENOMEM;
>> =C2=A0+
>> =C2=A0+ drm =3D &priv->drm;
>> =C2=A0+ dev_set_drvdata(dev, drm);
>> =C2=A0+
>> =C2=A0+ /* get the resources */
>> =C2=A0+ priv->soc_type =3D (int) of_match_device(de2_drm_of_match, dev)-=
>data;
>> =C2=A0+
>> =C2=A0+ res =3D platform_get_resource(to_platform_device(dev),
>> =C2=A0+ IORESOURCE_MEM, 0);
>> =C2=A0+ if (!res) {
>> =C2=A0+ dev_err(dev, "failed to get memory resource\n");
>> =C2=A0+ ret =3D -EINVAL;
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ priv->mmio =3D devm_ioremap_resource(dev, res);
>> =C2=A0+ if (IS_ERR(priv->mmio)) {
>> =C2=A0+ ret =3D PTR_ERR(priv->mmio);
>> =C2=A0+ dev_err(dev, "failed to map registers %d\n", ret);
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ priv->gate =3D devm_clk_get(dev, "bus");
>> =C2=A0+ if (IS_ERR(priv->gate)) {
>> =C2=A0+ ret =3D PTR_ERR(priv->gate);
>> =C2=A0+ dev_err(dev, "bus gate err %d\n", ret);
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ priv->clk =3D devm_clk_get(dev, "clock");
>> =C2=A0+ if (IS_ERR(priv->clk)) {
>> =C2=A0+ ret =3D PTR_ERR(priv->clk);
>> =C2=A0+ dev_err(dev, "clock err %d\n", ret);
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ priv->reset =3D devm_reset_control_get(dev, NULL);
>> =C2=A0+ if (IS_ERR(priv->reset)) {
>> =C2=A0+ ret =3D PTR_ERR(priv->reset);
>> =C2=A0+ dev_err(dev, "reset err %d\n", ret);
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ mutex_init(&priv->mutex); /* protect DE I/O accesses */
>> =C2=A0+
>> =C2=A0+ ret =3D drm_dev_init(drm, &de2_drm_driver, dev);
>> =C2=A0+ if (ret !=3D 0) {
>> =C2=A0+ dev_err(dev, "dev_init failed %d\n", ret);
>> =C2=A0+ goto out1;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ drm_mode_config_init(drm);
>> =C2=A0+ drm->mode_config.min_width =3D 32; /* needed for cursor */
>> =C2=A0+ drm->mode_config.min_height =3D 32;
>> =C2=A0+ drm->mode_config.max_width =3D 1920;
>> =C2=A0+ drm->mode_config.max_height =3D 1080;
>> =C2=A0+ drm->mode_config.funcs =3D &de2_mode_config_funcs;
>> =C2=A0+
>> =C2=A0+ drm->irq_enabled =3D true;
>> =C2=A0+
>> =C2=A0+ /* start the subdevices */
>> =C2=A0+ ret =3D component_bind_all(dev, drm);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ goto out2;
>> =C2=A0+
>> =C2=A0+ /* initialize and disable vertical blanking on all CRTCs */
>> =C2=A0+ ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ dev_warn(dev, "vblank_init failed %d\n", ret);
>> =C2=A0+
>> =C2=A0+ for (i =3D 0; i < ARRAY_SIZE(priv->lcds); i++) {
>> =C2=A0+ lcd =3D priv->lcds[i];
>> =C2=A0+ if (lcd)
>> =C2=A0+ de2_vblank_reset(lcd);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ drm_mode_config_reset(drm);
>> =C2=A0+
>> =C2=A0+ priv->fbdev =3D drm_fbdev_cma_init(drm,
>> =C2=A0+ 32, /* bpp */
>> =C2=A0+ drm->mode_config.num_crtc,
>> =C2=A0+ drm->mode_config.num_connector);
>> =C2=A0+ if (IS_ERR(priv->fbdev)) {
>> =C2=A0+ ret =3D PTR_ERR(priv->fbdev);
>> =C2=A0+ priv->fbdev =3D NULL;
>> =C2=A0+ goto out3;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ drm_kms_helper_poll_init(drm);
>> =C2=A0+
>> =C2=A0+ ret =3D drm_dev_register(drm, 0);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ goto out4;
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+
>> =C2=A0+out4:
>> =C2=A0+ drm_fbdev_cma_fini(priv->fbdev);
>> =C2=A0+out3:
>> =C2=A0+ component_unbind_all(dev, drm);
>> =C2=A0+out2:
>> =C2=A0+ drm_dev_unref(drm);
>> =C2=A0+out1:
>> =C2=A0+ kfree(priv);
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_drm_unbind(struct device *dev)
>> =C2=A0+{
>> =C2=A0+ struct drm_device *drm =3D dev_get_drvdata(dev);
>> =C2=A0+ struct priv *priv =3D drm_to_priv(drm);
>> =C2=A0+
>> =C2=A0+ drm_dev_unregister(drm);
>> =C2=A0+
>> =C2=A0+ drm_fbdev_cma_fini(priv->fbdev);
>> =C2=A0+ drm_kms_helper_poll_fini(drm);
>> =C2=A0+ drm_vblank_cleanup(drm);
>> =C2=A0+ drm_mode_config_cleanup(drm);
>> =C2=A0+
>> =C2=A0+ component_unbind_all(dev, drm);
>> =C2=A0+
>> =C2=A0+ kfree(priv);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct component_master_ops de2_drm_comp_ops =3D {
>> =C2=A0+ .bind =3D de2_drm_bind,
>> =C2=A0+ .unbind =3D de2_drm_unbind,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * drm_of_component_probe() does:
>> =C2=A0+ * - bind of the ports (lcd-controller.port)
>> =C2=A0+ * - bind of the remote nodes (hdmi, tve..)
>> =C2=A0+ */
>> =C2=A0+static int compare_of(struct device *dev, void *data)
>> =C2=A0+{
>> =C2=A0+ struct device_node *np =3D data;
>> =C2=A0+
>> =C2=A0+ if (of_node_cmp(np->name, "port") =3D=3D 0) {
>> =C2=A0+ np =3D of_get_parent(np);
>> =C2=A0+ of_node_put(np);
>> =C2=A0+ }
>> =C2=A0+ return dev->of_node =3D=3D np;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int de2_drm_probe(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ ret =3D drm_of_component_probe(&pdev->dev,
>> =C2=A0+ compare_of,
>> =C2=A0+ &de2_drm_comp_ops);
>> =C2=A0+ if (ret =3D=3D -EINVAL)
>> =C2=A0+ ret =3D -ENXIO;
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int de2_drm_remove(struct platform_device *pdev)
>> =C2=A0+{
>> =C2=A0+ component_master_del(&pdev->dev, &de2_drm_comp_ops);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static struct platform_driver de2_drm_platform_driver =3D {
>> =C2=A0+ .probe =3D de2_drm_probe,
>> =C2=A0+ .remove =3D de2_drm_remove,
>> =C2=A0+ .driver =3D {
>> =C2=A0+ .name =3D DRIVER_NAME,
>> =C2=A0+ .of_match_table =3D de2_drm_of_match,
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int __init de2_drm_init(void)
>> =C2=A0+{
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ ret =3D platform_driver_register(&de2_lcd_platform_driver);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ return ret;
>> =C2=A0+
>> =C2=A0+ ret =3D platform_driver_register(&de2_drm_platform_driver);
>> =C2=A0+ if (ret < 0)
>> =C2=A0+ platform_driver_unregister(&de2_lcd_platform_driver);
>> =C2=A0+
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void __exit de2_drm_fini(void)
>> =C2=A0+{
>> =C2=A0+ platform_driver_unregister(&de2_lcd_platform_driver);
>> =C2=A0+ platform_driver_unregister(&de2_drm_platform_driver);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+module_init(de2_drm_init);
>> =C2=A0+module_exit(de2_drm_fini);
>> =C2=A0+
>> =C2=A0+MODULE_AUTHOR("Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>");
>> =C2=A0+MODULE_DESCRIPTION("Allwinner DE2 DRM Driver");
>> =C2=A0+MODULE_LICENSE("GPL v2");
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/de2_drv.h b/drivers/gpu/drm/sun=
8i/de2_drv.h
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..c42c30a
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/de2_drv.h
>> =C2=A0@@ -0,0 +1,48 @@
>> =C2=A0+#ifndef __DE2_DRM_H__
>> =C2=A0+#define __DE2_DRM_H__
>> =C2=A0+/*
>> =C2=A0+ * Copyright (C) 2016 Jean-Fran??ois Moine
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <drm/drmP.h>
>> =C2=A0+#include <linux/clk.h>
>> =C2=A0+#include <linux/reset.h>
>> =C2=A0+
>> =C2=A0+struct drm_fbdev_cma;
>> =C2=A0+struct lcd;
>> =C2=A0+
>> =C2=A0+#define N_LCDS 2
>> =C2=A0+
>> =C2=A0+struct priv {
>> =C2=A0+ struct drm_device drm;
>> =C2=A0+ void __iomem *mmio;
>> =C2=A0+ struct clk *clk;
>> =C2=A0+ struct clk *gate;
>> =C2=A0+ struct reset_control *reset;
>> =C2=A0+
>> =C2=A0+ struct mutex mutex; /* protect DE I/O access */
>> =C2=A0+ u8 soc_type;
>> =C2=A0+#define SOC_A83T 0
>> =C2=A0+#define SOC_H3 1
>> =C2=A0+ u8 started; /* bitmap of started mixers */
>> =C2=A0+ u8 clean; /* bitmap of clean mixers */
>> =C2=A0+
>> =C2=A0+ struct drm_fbdev_cma *fbdev;
>> =C2=A0+
>> =C2=A0+ struct lcd *lcds[N_LCDS]; /* CRTCs */
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+#define drm_to_priv(x) container_of(x, struct priv, drm)
>> =C2=A0+
>> =C2=A0+/* in de2_crtc.c */
>> =C2=A0+int de2_enable_vblank(struct drm_device *drm, unsigned int crtc);
>> =C2=A0+void de2_disable_vblank(struct drm_device *drm, unsigned int crtc=
);
>> =C2=A0+void de2_vblank_reset(struct lcd *lcd);
>> =C2=A0+extern struct platform_driver de2_lcd_platform_driver;
>> =C2=A0+
>> =C2=A0+#endif /* __DE2_DRM_H__ */
>> =C2=A0diff --git a/drivers/gpu/drm/sun8i/de2_plane.c b/drivers/gpu/drm/s=
un8i/de2_plane.c
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..2fd72dc
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/drivers/gpu/drm/sun8i/de2_plane.c
>> =C2=A0@@ -0,0 +1,734 @@
>> =C2=A0+/*
>> =C2=A0+ * Allwinner DRM driver - Display Engine 2
>> =C2=A0+ *
>> =C2=A0+ * Copyright (C) 2016 Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
>> =C2=A0+ * Adapted from the sun8iw6 and sun8iw7 disp2 drivers
>> =C2=A0+ * Copyright (c) 2016 Allwinnertech Co., Ltd.
>> =C2=A0+ *
>> =C2=A0+ * This program is free software; you can redistribute it and/or
>> =C2=A0+ * modify it under the terms of the GNU General Public License as
>> =C2=A0+ * published by the Free Software Foundation; either version 2 of
>> =C2=A0+ * the License, or (at your option) any later version.
>> =C2=A0+ */
>> =C2=A0+
>> =C2=A0+#include <linux/io.h>
>> =C2=A0+#include <drm/drm_atomic_helper.h>
>> =C2=A0+#include <drm/drm_crtc_helper.h>
>> =C2=A0+#include <drm/drm_fb_cma_helper.h>
>> =C2=A0+#include <drm/drm_gem_cma_helper.h>
>> =C2=A0+#include <drm/drm_plane_helper.h>
>> =C2=A0+
>> =C2=A0+#include "de2_drv.h"
>> =C2=A0+#include "de2_crtc.h"
>> =C2=A0+
>> =C2=A0+/* DE2 I/O map */
>> =C2=A0+
>> =C2=A0+#define DE2_MOD_REG 0x0000 /* 1 bit per LCD */
>> =C2=A0+#define DE2_GATE_REG 0x0004
>> =C2=A0+#define DE2_RESET_REG 0x0008
>> =C2=A0+#define DE2_DIV_REG 0x000c /* 4 bits per LCD */
>> =C2=A0+#define DE2_SEL_REG 0x0010
>> =C2=A0+
>> =C2=A0+#define DE2_MIXER0_BASE 0x00100000 /* LCD 0 */
>> =C2=A0+#define DE2_MIXER1_BASE 0x00200000 /* LCD 1 */
>> =C2=A0+
>> =C2=A0+/* mixer registers (addr / mixer base) */
>> =C2=A0+#define MIXER_GLB_REGS 0x00000 /* global control */
>> =C2=A0+#define MIXER_BLD_REGS 0x01000 /* alpha blending */
>> =C2=A0+#define MIXER_CHAN_REGS 0x02000 /* VI/UI overlay channels */
>> =C2=A0+#define MIXER_CHAN_SZ 0x1000 /* size of a channel */
>> =C2=A0+#define MIXER_VSU_REGS 0x20000 /* VSU */
>> =C2=A0+#define MIXER_GSU1_REGS 0x30000 /* GSUs */
>> =C2=A0+#define MIXER_GSU2_REGS 0x40000
>> =C2=A0+#define MIXER_GSU3_REGS 0x50000
>> =C2=A0+#define MIXER_FCE_REGS 0xa0000 /* FCE */
>> =C2=A0+#define MIXER_BWS_REGS 0xa2000 /* BWS */
>> =C2=A0+#define MIXER_LTI_REGS 0xa4000 /* LTI */
>> =C2=A0+#define MIXER_PEAK_REGS 0xa6000 /* PEAK */
>> =C2=A0+#define MIXER_ASE_REGS 0xa8000 /* ASE */
>> =C2=A0+#define MIXER_FCC_REGS 0xaa000 /* FCC */
>> =C2=A0+#define MIXER_DCSC_REGS 0xb0000 /* DCSC/SMBL */
>> =C2=A0+
>> =C2=A0+/* global control */
>> =C2=A0+#define MIXER_GLB_CTL_REG 0x00
>> =C2=A0+#define MIXER_GLB_CTL_rt_en BIT(0)
>> =C2=A0+#define MIXER_GLB_CTL_finish_irq_en BIT(4)
>> =C2=A0+#define MIXER_GLB_CTL_rtwb_port BIT(12)
>> =C2=A0+#define MIXER_GLB_STATUS_REG 0x04
>> =C2=A0+#define MIXER_GLB_DBUFF_REG 0x08
>> =C2=A0+#define MIXER_GLB_SIZE_REG 0x0c
>> =C2=A0+
>> =C2=A0+/* alpha blending */
>> =C2=A0+#define MIXER_BLD_FCOLOR_CTL_REG 0x00
>> =C2=A0+#define MIXER_BLD_FCOLOR_CTL_PEN(pipe) (0x0100 << (pipe))
>> =C2=A0+#define MIXER_BLD_ATTR_N 4 /* number of attribute blocks */
>> =C2=A0+#define MIXER_BLD_ATTR_SIZE (4 * 4) /* size of an attribute block=
 */
>> =C2=A0+#define MIXER_BLD_ATTRx_FCOLOR(x) (0x04 + MIXER_BLD_ATTR_SIZE * (=
x))
>> =C2=A0+#define MIXER_BLD_ATTRx_INSIZE(x) (0x08 + MIXER_BLD_ATTR_SIZE * (=
x))
>> =C2=A0+#define MIXER_BLD_ATTRx_OFFSET(x) (0x0c + MIXER_BLD_ATTR_SIZE * (=
x))
>> =C2=A0+#define MIXER_BLD_ROUTE_REG 0x80
>> =C2=A0+#define MIXER_BLD_ROUTE(chan, pipe) ((chan) << ((pipe) * 4))
>> =C2=A0+#define MIXER_BLD_PREMULTIPLY_REG 0x84
>> =C2=A0+#define MIXER_BLD_BKCOLOR_REG 0x88
>> =C2=A0+#define MIXER_BLD_OUTPUT_SIZE_REG 0x8c
>> =C2=A0+#define MIXER_BLD_MODEx_REG(x) (0x90 + 4 * (x)) /* x =3D 0..3 */
>> =C2=A0+#define MIXER_BLD_MODE_SRCOVER 0x03010301
>> =C2=A0+#define MIXER_BLD_OUT_CTL_REG 0xfc
>> =C2=A0+
>> =C2=A0+/* VI channel (channel 0) */
>> =C2=A0+#define VI_CFG_N 4 /* number of layers */
>> =C2=A0+#define VI_CFG_SIZE 0x30 /* size of a layer */
>> =C2=A0+#define VI_CFGx_ATTR(l) (0x00 + VI_CFG_SIZE * (l))
>> =C2=A0+#define VI_CFG_ATTR_en BIT(0)
>> =C2=A0+#define VI_CFG_ATTR_fcolor_en BIT(4)
>> =C2=A0+#define VI_CFG_ATTR_fmt_SHIFT 8
>> =C2=A0+#define VI_CFG_ATTR_fmt_MASK GENMASK(12, 8)
>> =C2=A0+#define VI_CFG_ATTR_ui_sel BIT(15)
>> =C2=A0+#define VI_CFG_ATTR_top_down BIT(23)
>> =C2=A0+#define VI_CFGx_SIZE(l) (0x04 + VI_CFG_SIZE * (l))
>> =C2=A0+#define VI_CFGx_COORD(l) (0x08 + VI_CFG_SIZE * (l))
>> =C2=A0+#define VI_N_PLANES 3
>> =C2=A0+#define VI_CFGx_PITCHy(l, p) (0x0c + VI_CFG_SIZE * (l) + 4 * (p))
>> =C2=A0+#define VI_CFGx_TOP_LADDRy(l, p) (0x18 + VI_CFG_SIZE * (l) + 4 * =
(p))
>> =C2=A0+#define VI_CFGx_BOT_LADDRy(l, p) (0x24 + VI_CFG_SIZE * (l) + 4 * =
(p))
>> =C2=A0+#define VI_FCOLORx(l) (0xc0 + 4 * (l))
>> =C2=A0+#define VI_TOP_HADDRx(p) (0xd0 + 4 * (p))
>> =C2=A0+#define VI_BOT_HADDRx(p) (0xdc + 4 * (p))
>> =C2=A0+#define VI_OVL_SIZEx(n) (0xe8 + 4 * (n))
>> =C2=A0+#define VI_HORI_DSx(n) (0xf0 + 4 * (n))
>> =C2=A0+#define VI_VERT_DSx(n) (0xf8 + 4 * (n))
>> =C2=A0+#define VI_SIZE 0x100
>> =C2=A0+
>> =C2=A0+/* UI channel (channels 1..3) */
>> =C2=A0+#define UI_CFG_N 4 /* number of layers */
>> =C2=A0+#define UI_CFG_SIZE (8 * 4) /* size of a layer */
>> =C2=A0+#define UI_CFGx_ATTR(l) (0x00 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFG_ATTR_en BIT(0)
>> =C2=A0+#define UI_CFG_ATTR_alpmod_SHIFT 1
>> =C2=A0+#define UI_CFG_ATTR_alpmod_MASK GENMASK(2, 1)
>> =C2=A0+#define UI_CFG_ATTR_fcolor_en BIT(4)
>> =C2=A0+#define UI_CFG_ATTR_fmt_SHIFT 8
>> =C2=A0+#define UI_CFG_ATTR_fmt_MASK GENMASK(12, 8)
>> =C2=A0+#define UI_CFG_ATTR_top_down BIT(23)
>> =C2=A0+#define UI_CFG_ATTR_alpha_SHIFT 24
>> =C2=A0+#define UI_CFG_ATTR_alpha_MASK GENMASK(31, 24)
>> =C2=A0+#define UI_CFGx_SIZE(l) (0x04 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFGx_COORD(l) (0x08 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFGx_PITCH(l) (0x0c + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFGx_TOP_LADDR(l) (0x10 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFGx_BOT_LADDR(l) (0x14 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_CFGx_FCOLOR(l) (0x18 + UI_CFG_SIZE * (l))
>> =C2=A0+#define UI_TOP_HADDR 0x80
>> =C2=A0+#define UI_BOT_HADDR 0x84
>> =C2=A0+#define UI_OVL_SIZE 0x88
>> =C2=A0+#define UI_SIZE 0x8c
>> =C2=A0+
>> =C2=A0+/* coordinates and sizes */
>> =C2=A0+#define XY(x, y) (((y) << 16) | (x))
>> =C2=A0+#define WH(w, h) ((((h) - 1) << 16) | ((w) - 1))
>> =C2=A0+
>> =C2=A0+/* UI video formats */
>> =C2=A0+#define DE2_FORMAT_ARGB_8888 0
>> =C2=A0+#define DE2_FORMAT_BGRA_8888 3
>> =C2=A0+#define DE2_FORMAT_XRGB_8888 4
>> =C2=A0+#define DE2_FORMAT_RGB_888 8
>> =C2=A0+#define DE2_FORMAT_BGR_888 9
>> =C2=A0+
>> =C2=A0+/* VI video formats */
>> =C2=A0+#define DE2_FORMAT_YUV422_I_YVYU 1 /* YVYU */
>> =C2=A0+#define DE2_FORMAT_YUV422_I_UYVY 2 /* UYVY */
>> =C2=A0+#define DE2_FORMAT_YUV422_I_YUYV 3 /* YUYV */
>> =C2=A0+#define DE2_FORMAT_YUV422_P 6 /* YYYY UU VV planar */
>> =C2=A0+#define DE2_FORMAT_YUV420_P 10 /* YYYY U V planar */
>> =C2=A0+
>> =C2=A0+/* plane formats */
>> =C2=A0+static const uint32_t ui_formats[] =3D {
>> =C2=A0+ DRM_FORMAT_ARGB8888,
>> =C2=A0+ DRM_FORMAT_BGRA8888,
>> =C2=A0+ DRM_FORMAT_XRGB8888,
>> =C2=A0+ DRM_FORMAT_RGB888,
>> =C2=A0+ DRM_FORMAT_BGR888,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const uint32_t vi_formats[] =3D {
>> =C2=A0+ DRM_FORMAT_XRGB8888,
>> =C2=A0+ DRM_FORMAT_YUYV,
>> =C2=A0+ DRM_FORMAT_YVYU,
>> =C2=A0+ DRM_FORMAT_YUV422,
>> =C2=A0+ DRM_FORMAT_YUV420,
>> =C2=A0+ DRM_FORMAT_UYVY,
>> =C2=A0+ DRM_FORMAT_BGRA8888,
>> =C2=A0+ DRM_FORMAT_RGB888,
>> =C2=A0+ DRM_FORMAT_BGR888,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * plane table
>> =C2=A0+ *
>> =C2=A0+ * The chosen channel/layer assignment of the planes respects
>> =C2=A0+ * the following constraints:
>> =C2=A0+ * - the cursor must be in a channel higher than the primary chan=
nel
>> =C2=A0+ * - there are 4 channels in the LCD 0 and only 2 channels in the=
 LCD 1
>> =C2=A0+ */
>> =C2=A0+static const struct {
>> =C2=A0+ u8 chan;
>> =C2=A0+ u8 layer;
>> =C2=A0+ u8 pipe;
>> =C2=A0+ u8 type; /* plane type */
>> =C2=A0+ const uint32_t *formats;
>> =C2=A0+ u8 n_formats;
>> =C2=A0+} plane_tb[] =3D {
>> =C2=A0+ [DE2_PRIMARY_PLANE] =3D { /* primary plane: channel 0 (VI) */
>> =C2=A0+ 0, 0, 0,
>> =C2=A0+ DRM_PLANE_TYPE_PRIMARY,
>> =C2=A0+ ui_formats, ARRAY_SIZE(ui_formats),
>> =C2=A0+ },
>> =C2=A0+ [DE2_CURSOR_PLANE] =3D { /* cursor: channel 1 (UI) */
>> =C2=A0+ 1, 0, 1,
>> =C2=A0+ DRM_PLANE_TYPE_CURSOR,
>> =C2=A0+ ui_formats, ARRAY_SIZE(ui_formats),
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ 0, 1, 0, /* 1st overlay: channel 0, layer 1 */
>> =C2=A0+ DRM_PLANE_TYPE_OVERLAY,
>> =C2=A0+ vi_formats, ARRAY_SIZE(vi_formats),
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ 0, 2, 0, /* 2nd overlay: channel 0, layer 2 */
>> =C2=A0+ DRM_PLANE_TYPE_OVERLAY,
>> =C2=A0+ vi_formats, ARRAY_SIZE(vi_formats),
>> =C2=A0+ },
>> =C2=A0+ {
>> =C2=A0+ 0, 3, 0, /* 3rd overlay: channel 0, layer 3 */
>> =C2=A0+ DRM_PLANE_TYPE_OVERLAY,
>> =C2=A0+ vi_formats, ARRAY_SIZE(vi_formats),
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static inline void andl_relaxed(void __iomem *addr, u32 val)
>> =C2=A0+{
>> =C2=A0+ writel_relaxed(readl_relaxed(addr) & val, addr);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static inline void orl_relaxed(void __iomem *addr, u32 val)
>> =C2=A0+{
>> =C2=A0+ writel_relaxed(readl_relaxed(addr) | val, addr);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* alert the DE processor about changes in a mixer configuration =
*/
>> =C2=A0+static void de2_mixer_select(struct priv *priv,
>> =C2=A0+ int mixer,
>> =C2=A0+ void __iomem *mixer_io)
>> =C2=A0+{
>> =C2=A0+ /* select the mixer */
>> =C2=A0+ andl_relaxed(priv->mmio + DE2_SEL_REG, ~1);
>> =C2=A0+
>> =C2=A0+ /* double register switch */
>> =C2=A0+ writel_relaxed(1, mixer_io + MIXER_GLB_REGS + MIXER_GLB_DBUFF_RE=
G);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/*
>> =C2=A0+ * cleanup a mixer
>> =C2=A0+ *
>> =C2=A0+ * This is needed only once after power on.
>> =C2=A0+ */
>> =C2=A0+static void de2_mixer_cleanup(struct priv *priv, int mixer,
>> =C2=A0+ u32 size)
>> =C2=A0+{
>> =C2=A0+ void __iomem *mixer_io =3D priv->mmio;
>> =C2=A0+ void __iomem *chan_io;
>> =C2=A0+ u32 data;
>> =C2=A0+ unsigned int i;
>> =C2=A0+
>> =C2=A0+ mixer_io +=3D (mixer =3D=3D 0) ? DE2_MIXER0_BASE : DE2_MIXER1_BA=
SE;
>> =C2=A0+ chan_io =3D mixer_io + MIXER_CHAN_REGS;
>> =C2=A0+
>> =C2=A0+ andl_relaxed(priv->mmio + DE2_SEL_REG, ~1);
>> =C2=A0+ writel_relaxed(1, mixer_io + MIXER_GLB_REGS + MIXER_GLB_DBUFF_RE=
G);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(MIXER_GLB_CTL_rt_en,
>> =C2=A0+ mixer_io + MIXER_GLB_REGS + MIXER_GLB_CTL_REG);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GLB_REGS + MIXER_GLB_STATUS_R=
EG);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(size, mixer_io + MIXER_GLB_REGS + MIXER_GLB_SIZE_=
REG);
>> =C2=A0+
>> =C2=A0+ /*
>> =C2=A0+ * clear the VI/UI channels
>> =C2=A0+ * LCD0: 1 VI and 3 UIs
>> =C2=A0+ * LCD1: 1 VI and 1 UI
>> =C2=A0+ */
>> =C2=A0+ memset_io(chan_io, 0, VI_SIZE);
>> =C2=A0+ memset_io(chan_io + MIXER_CHAN_SZ, 0, UI_SIZE);
>> =C2=A0+ if (mixer =3D=3D 0) {
>> =C2=A0+ memset_io(chan_io + MIXER_CHAN_SZ * 2, 0, UI_SIZE);
>> =C2=A0+ memset_io(chan_io + MIXER_CHAN_SZ * 3, 0, UI_SIZE);
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* alpha blending */
>> =C2=A0+ writel_relaxed(0x00000001 | /* fcolor for primary */
>> =C2=A0+ MIXER_BLD_FCOLOR_CTL_PEN(0),
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_FCOLOR_CTL_REG);
>> =C2=A0+ for (i =3D 0; i < MIXER_BLD_ATTR_N; i++) {
>> =C2=A0+ writel_relaxed(0xff000000,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_ATTRx_FCOLOR(i));
>> =C2=A0+ writel_relaxed(size,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_ATTRx_INSIZE(i));
>> =C2=A0+ writel_relaxed(0,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_ATTRx_OFFSET(i));
>> =C2=A0+ }
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_BLD_REGS + MIXER_BLD_OUT_CTL_=
REG);
>> =C2=A0+
>> =C2=A0+ /* prepare the pipe route for the planes */
>> =C2=A0+ data =3D 0;
>> =C2=A0+ for (i =3D 0; i < DE2_N_PLANES; i++)
>> =C2=A0+ data |=3D MIXER_BLD_ROUTE(plane_tb[i].chan, plane_tb[i].pipe);
>> =C2=A0+ writel_relaxed(data, mixer_io + MIXER_BLD_REGS + MIXER_BLD_ROUTE=
_REG);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_PREMULTIPLY_REG);
>> =C2=A0+ writel_relaxed(0xff000000, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_BKCOLOR_REG);
>> =C2=A0+ writel_relaxed(size, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_OUTPUT_SIZE_REG);
>> =C2=A0+ writel_relaxed(MIXER_BLD_MODE_SRCOVER,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_MODEx_REG(0));
>> =C2=A0+ writel_relaxed(MIXER_BLD_MODE_SRCOVER,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_MODEx_REG(1));
>> =C2=A0+
>> =C2=A0+ /* disable the enhancements */
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_VSU_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GSU1_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GSU2_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GSU3_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_FCE_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_BWS_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_LTI_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_PEAK_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_ASE_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_FCC_REGS);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_DCSC_REGS);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* enable a mixer */
>> =C2=A0+static void de2_mixer_enable(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D lcd->priv;
>> =C2=A0+ void __iomem *mixer_io =3D priv->mmio;
>> =C2=A0+ struct drm_display_mode *mode =3D &lcd->crtc.mode;
>> =C2=A0+ u32 size =3D WH(mode->hdisplay, mode->vdisplay);
>> =C2=A0+ u32 data;
>> =C2=A0+ int mixer =3D lcd->mixer;
>> =C2=A0+ int i;
>> =C2=A0+
>> =C2=A0+ mixer_io +=3D (mixer =3D=3D 0) ? DE2_MIXER0_BASE : DE2_MIXER1_BA=
SE;
>> =C2=A0+
>> =C2=A0+ /* if not done yet, start the DE processor */
>> =C2=A0+ if (!priv->started) {
>> =C2=A0+ reset_control_deassert(priv->reset);
>> =C2=A0+ clk_prepare_enable(priv->gate);
>> =C2=A0+ clk_prepare_enable(priv->clk);
>> =C2=A0+ }
>> =C2=A0+ priv->started |=3D 1 << mixer;
>> =C2=A0+
>> =C2=A0+ /* set the A83T clock divider (500 / 2) =3D 250MHz */
>> =C2=A0+ if (priv->soc_type =3D=3D SOC_A83T)
>> =C2=A0+ writel_relaxed(0x00000011, /* div =3D 2 for both LCDs */
>> =C2=A0+ priv->mmio + DE2_DIV_REG);
>> =C2=A0+
>> =C2=A0+ /* deassert the mixer and enable its clock */
>> =C2=A0+ orl_relaxed(priv->mmio + DE2_RESET_REG, mixer =3D=3D 0 ? 1 : 4);
>> =C2=A0+ data =3D 1 << mixer; /* 1 bit / lcd */
>> =C2=A0+ orl_relaxed(priv->mmio + DE2_GATE_REG, data);
>> =C2=A0+ orl_relaxed(priv->mmio + DE2_MOD_REG, data);
>> =C2=A0+
>> =C2=A0+ /* if not done yet, cleanup and enable */
>> =C2=A0+ if (!(priv->clean & (1 << mixer))) {
>> =C2=A0+ priv->clean |=3D 1 << mixer;
>> =C2=A0+ de2_mixer_cleanup(priv, mixer, size);
>> =C2=A0+ return;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* enable */
>> =C2=A0+ de2_mixer_select(priv, mixer, mixer_io);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(MIXER_GLB_CTL_rt_en,
>> =C2=A0+ mixer_io + MIXER_GLB_REGS + MIXER_GLB_CTL_REG);
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GLB_REGS + MIXER_GLB_STATUS_R=
EG);
>> =C2=A0+
>> =C2=A0+ /* set the size of the frame buffer */
>> =C2=A0+ writel_relaxed(size, mixer_io + MIXER_GLB_REGS + MIXER_GLB_SIZE_=
REG);
>> =C2=A0+ for (i =3D 0; i < MIXER_BLD_ATTR_N; i++)
>> =C2=A0+ writel_relaxed(size, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_ATTRx_INSIZE(i));
>> =C2=A0+ writel_relaxed(size, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_OUTPUT_SIZE_REG);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(mode->flags & DRM_MODE_FLAG_INTERLACE ? 2 : 0,
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_OUT_CTL_REG);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* enable a LCD (DE mixer) */
>> =C2=A0+void de2_de_enable(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ mutex_lock(&lcd->priv->mutex);
>> =C2=A0+
>> =C2=A0+ de2_mixer_enable(lcd);
>> =C2=A0+
>> =C2=A0+ mutex_unlock(&lcd->priv->mutex);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* disable a LCD (DE mixer) */
>> =C2=A0+void de2_de_disable(struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ struct priv *priv =3D lcd->priv;
>> =C2=A0+ void __iomem *mixer_io =3D priv->mmio;
>> =C2=A0+ int mixer =3D lcd->mixer;
>> =C2=A0+ u32 data;
>> =C2=A0+
>> =C2=A0+ mixer_io +=3D (mixer =3D=3D 0) ? DE2_MIXER0_BASE : DE2_MIXER1_BA=
SE;
>> =C2=A0+
>> =C2=A0+ mutex_lock(&priv->mutex);
>> =C2=A0+
>> =C2=A0+ de2_mixer_select(priv, mixer, mixer_io);
>> =C2=A0+
>> =C2=A0+ writel_relaxed(0, mixer_io + MIXER_GLB_REGS + MIXER_GLB_CTL_REG)=
;
>> =C2=A0+
>> =C2=A0+ data =3D ~(1 << mixer);
>> =C2=A0+ andl_relaxed(priv->mmio + DE2_MOD_REG, data);
>> =C2=A0+ andl_relaxed(priv->mmio + DE2_GATE_REG, data);
>> =C2=A0+ andl_relaxed(priv->mmio + DE2_RESET_REG, data);
>> =C2=A0+
>> =C2=A0+ mutex_unlock(&priv->mutex);
>> =C2=A0+
>> =C2=A0+ /* if all mixers are disabled, stop the DE */
>> =C2=A0+ priv->started &=3D ~(1 << mixer);
>> =C2=A0+ if (!priv->started) {
>> =C2=A0+ clk_disable_unprepare(priv->clk);
>> =C2=A0+ clk_disable_unprepare(priv->gate);
>> =C2=A0+ reset_control_assert(priv->reset);
>> =C2=A0+ }
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_vi_update(void __iomem *chan_io,
>> =C2=A0+ struct drm_gem_cma_object *gem,
>> =C2=A0+ int layer,
>> =C2=A0+ unsigned int fmt,
>> =C2=A0+ u32 ui_sel,
>> =C2=A0+ u32 size,
>> =C2=A0+ u32 coord,
>> =C2=A0+ struct drm_framebuffer *fb,
>> =C2=A0+ u32 screen_size)
>> =C2=A0+{
>> =C2=A0+ int i;
>> =C2=A0+
>> =C2=A0+ writel_relaxed(VI_CFG_ATTR_en |
>> =C2=A0+ (fmt << VI_CFG_ATTR_fmt_SHIFT) |
>> =C2=A0+ ui_sel,
>> =C2=A0+ chan_io + VI_CFGx_ATTR(layer));
>> =C2=A0+ writel_relaxed(size, chan_io + VI_CFGx_SIZE(layer));
>> =C2=A0+ writel_relaxed(coord, chan_io + VI_CFGx_COORD(layer));
>> =C2=A0+ for (i =3D 0; i < VI_N_PLANES; i++) {
>> =C2=A0+ writel_relaxed(fb->pitches[i] ? fb->pitches[i] :
>> =C2=A0+ fb->pitches[0],
>> =C2=A0+ chan_io + VI_CFGx_PITCHy(layer, i));
>> =C2=A0+ writel_relaxed(gem->paddr + fb->offsets[i],
>> =C2=A0+ chan_io + VI_CFGx_TOP_LADDRy(layer, i));
>> =C2=A0+ }
>> =C2=A0+ writel_relaxed(0xff000000, chan_io + VI_FCOLORx(layer));
>> =C2=A0+ if (layer =3D=3D 0) {
>> =C2=A0+ writel_relaxed(screen_size,
>> =C2=A0+ chan_io + VI_OVL_SIZEx(0));
>> =C2=A0+ }
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_ui_update(void __iomem *chan_io,
>> =C2=A0+ struct drm_gem_cma_object *gem,
>> =C2=A0+ int layer,
>> =C2=A0+ unsigned int fmt,
>> =C2=A0+ u32 alpha_glob,
>> =C2=A0+ u32 size,
>> =C2=A0+ u32 coord,
>> =C2=A0+ struct drm_framebuffer *fb,
>> =C2=A0+ u32 screen_size)
>> =C2=A0+{
>> =C2=A0+ writel_relaxed(UI_CFG_ATTR_en |
>> =C2=A0+ (fmt << UI_CFG_ATTR_fmt_SHIFT) |
>> =C2=A0+ alpha_glob,
>> =C2=A0+ chan_io + UI_CFGx_ATTR(layer));
>> =C2=A0+ writel_relaxed(size, chan_io + UI_CFGx_SIZE(layer));
>> =C2=A0+ writel_relaxed(coord, chan_io + UI_CFGx_COORD(layer));
>> =C2=A0+ writel_relaxed(fb->pitches[0], chan_io + UI_CFGx_PITCH(layer));
>> =C2=A0+ writel_relaxed(gem->paddr + fb->offsets[0],
>> =C2=A0+ chan_io + UI_CFGx_TOP_LADDR(layer));
>> =C2=A0+ if (layer =3D=3D 0)
>> =C2=A0+ writel_relaxed(screen_size, chan_io + UI_OVL_SIZE);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_plane_update(struct priv *priv, struct lcd *lcd,
>> =C2=A0+ int plane_num,
>> =C2=A0+ struct drm_plane_state *state,
>> =C2=A0+ struct drm_plane_state *old_state)
>> =C2=A0+{
>> =C2=A0+ void __iomem *mixer_io =3D priv->mmio;
>> =C2=A0+ void __iomem *chan_io;
>> =C2=A0+ struct drm_framebuffer *fb =3D state->fb;
>> =C2=A0+ struct drm_gem_cma_object *gem;
>> =C2=A0+ u32 size =3D WH(state->crtc_w, state->crtc_h);
>> =C2=A0+ u32 coord, screen_size;
>> =C2=A0+ u32 fcolor;
>> =C2=A0+ u32 ui_sel, alpha_glob;
>> =C2=A0+ int mixer =3D lcd->mixer;
>> =C2=A0+ int chan, layer, x, y;
>> =C2=A0+ unsigned int fmt;
>> =C2=A0+
>> =C2=A0+ chan =3D plane_tb[plane_num].chan;
>> =C2=A0+ layer =3D plane_tb[plane_num].layer;
>> =C2=A0+
>> =C2=A0+ mixer_io +=3D (mixer =3D=3D 0) ? DE2_MIXER0_BASE : DE2_MIXER1_BA=
SE;
>> =C2=A0+ chan_io =3D mixer_io + MIXER_CHAN_REGS + MIXER_CHAN_SZ * chan;
>> =C2=A0+
>> =C2=A0+ x =3D state->crtc_x >=3D 0 ? state->crtc_x : 0;
>> =C2=A0+ y =3D state->crtc_y >=3D 0 ? state->crtc_y : 0;
>> =C2=A0+ coord =3D XY(x, y);
>> =C2=A0+
>> =C2=A0+ /* if plane update was delayed, force a full update */
>> =C2=A0+ if (priv->lcds[drm_crtc_index(&lcd->crtc)]->delayed &
>> =C2=A0+ (1 << plane_num)) {
>> =C2=A0+ priv->lcds[drm_crtc_index(&lcd->crtc)]->delayed &=3D
>> =C2=A0+ ~(1 << plane_num);
>> =C2=A0+
>> =C2=A0+ /* handle plane move */
>> =C2=A0+ } else if (fb =3D=3D old_state->fb) {
>> =C2=A0+ de2_mixer_select(priv, mixer, mixer_io);
>> =C2=A0+ if (chan =3D=3D 0)
>> =C2=A0+ writel_relaxed(coord, chan_io + VI_CFGx_COORD(layer));
>> =C2=A0+ else
>> =C2=A0+ writel_relaxed(coord, chan_io + UI_CFGx_COORD(layer));
>> =C2=A0+ return;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ gem =3D drm_fb_cma_get_gem_obj(fb, 0);
>> =C2=A0+
>> =C2=A0+ ui_sel =3D alpha_glob =3D 0;
>> =C2=A0+
>> =C2=A0+ switch (fb->pixel_format) {
>> =C2=A0+ case DRM_FORMAT_ARGB8888:
>> =C2=A0+ fmt =3D DE2_FORMAT_ARGB_8888;
>> =C2=A0+ ui_sel =3D VI_CFG_ATTR_ui_sel;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_BGRA8888:
>> =C2=A0+ fmt =3D DE2_FORMAT_BGRA_8888;
>> =C2=A0+ ui_sel =3D VI_CFG_ATTR_ui_sel;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_XRGB8888:
>> =C2=A0+ fmt =3D DE2_FORMAT_XRGB_8888;
>> =C2=A0+ ui_sel =3D VI_CFG_ATTR_ui_sel;
>> =C2=A0+ alpha_glob =3D (1 << UI_CFG_ATTR_alpmod_SHIFT) |
>> =C2=A0+ (0xff << UI_CFG_ATTR_alpha_SHIFT);
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_RGB888:
>> =C2=A0+ fmt =3D DE2_FORMAT_RGB_888;
>> =C2=A0+ ui_sel =3D VI_CFG_ATTR_ui_sel;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_BGR888:
>> =C2=A0+ fmt =3D DE2_FORMAT_BGR_888;
>> =C2=A0+ ui_sel =3D VI_CFG_ATTR_ui_sel;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_YUYV:
>> =C2=A0+ fmt =3D DE2_FORMAT_YUV422_I_YUYV;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_YVYU:
>> =C2=A0+ fmt =3D DE2_FORMAT_YUV422_I_YVYU;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_YUV422:
>> =C2=A0+ fmt =3D DE2_FORMAT_YUV422_P;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_YUV420:
>> =C2=A0+ fmt =3D DE2_FORMAT_YUV420_P;
>> =C2=A0+ break;
>> =C2=A0+ case DRM_FORMAT_UYVY:
>> =C2=A0+ fmt =3D DE2_FORMAT_YUV422_I_UYVY;
>> =C2=A0+ break;
>> =C2=A0+ default:
>> =C2=A0+ pr_err("de2_plane_update: format %.4s not yet treated\n",
>> =C2=A0+ (char *) &fb->pixel_format);
>> =C2=A0+ return;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ /* the overlay size is the one of the primary plane */
>> =C2=A0+ screen_size =3D plane_num =3D=3D DE2_PRIMARY_PLANE ?
>> =C2=A0+ size :
>> =C2=A0+ readl_relaxed(mixer_io + MIXER_GLB_REGS + MIXER_GLB_SIZE_REG);
>> =C2=A0+
>> =C2=A0+ /* prepare pipe enable */
>> =C2=A0+ fcolor =3D readl_relaxed(mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_FCOLOR_CTL_REG);
>> =C2=A0+ fcolor |=3D MIXER_BLD_FCOLOR_CTL_PEN(plane_tb[plane_num].pipe);
>> =C2=A0+
>> =C2=A0+ de2_mixer_select(priv, mixer, mixer_io);
>> =C2=A0+
>> =C2=A0+ if (chan =3D=3D 0) /* VI channel */
>> =C2=A0+ de2_vi_update(chan_io, gem, layer, fmt, ui_sel, size, coord,
>> =C2=A0+ fb, screen_size);
>> =C2=A0+ else /* UI channel */
>> =C2=A0+ de2_ui_update(chan_io, gem, layer, fmt, alpha_glob, size, coord,
>> =C2=A0+ fb, screen_size);
>> =C2=A0+ writel_relaxed(fcolor, mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_FCOLOR_CTL_REG);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int vi_nb_layers(void __iomem *chan_io)
>> =C2=A0+{
>> =C2=A0+ int layer, n =3D 0;
>> =C2=A0+
>> =C2=A0+ for (layer =3D 0; layer < 4; layer++) {
>> =C2=A0+ if (readl_relaxed(chan_io + VI_CFGx_ATTR(layer)) !=3D 0)
>> =C2=A0+ n++;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ return n;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static int ui_nb_layers(void __iomem *chan_io)
>> =C2=A0+{
>> =C2=A0+ int layer, n =3D 0;
>> =C2=A0+
>> =C2=A0+ for (layer =3D 0; layer < 4; layer++) {
>> =C2=A0+ if (readl_relaxed(chan_io + UI_CFGx_ATTR(layer)) !=3D 0)
>> =C2=A0+ n++;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ return n;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_plane_disable(struct priv *priv,
>> =C2=A0+ int mixer, int plane_num)
>> =C2=A0+{
>> =C2=A0+ void __iomem *mixer_io =3D priv->mmio;
>> =C2=A0+ void __iomem *chan_io;
>> =C2=A0+ u32 fcolor;
>> =C2=A0+ int chan, layer, n;
>> =C2=A0+
>> =C2=A0+ chan =3D plane_tb[plane_num].chan;
>> =C2=A0+ layer =3D plane_tb[plane_num].layer;
>> =C2=A0+
>> =C2=A0+ mixer_io +=3D (mixer =3D=3D 0) ? DE2_MIXER0_BASE : DE2_MIXER1_BA=
SE;
>> =C2=A0+ chan_io =3D mixer_io + MIXER_CHAN_REGS + MIXER_CHAN_SZ * chan;
>> =C2=A0+
>> =C2=A0+ if (chan =3D=3D 0)
>> =C2=A0+ n =3D vi_nb_layers(chan_io);
>> =C2=A0+ else
>> =C2=A0+ n =3D ui_nb_layers(chan_io);
>> =C2=A0+
>> =C2=A0+ fcolor =3D readl_relaxed(mixer_io + MIXER_BLD_REGS +
>> =C2=A0+ MIXER_BLD_FCOLOR_CTL_REG);
>> =C2=A0+
>> =C2=A0+ de2_mixer_select(priv, mixer, mixer_io);
>> =C2=A0+
>> =C2=A0+ if (chan =3D=3D 0)
>> =C2=A0+ writel_relaxed(0, chan_io + VI_CFGx_ATTR(layer));
>> =C2=A0+ else
>> =C2=A0+ writel_relaxed(0, chan_io + UI_CFGx_ATTR(layer));
>> =C2=A0+
>> =C2=A0+ /* disable the pipe if no more active layer */
>> =C2=A0+ if (n <=3D 1)
>> =C2=A0+ writel_relaxed(fcolor &
>> =C2=A0+ ~MIXER_BLD_FCOLOR_CTL_PEN(plane_tb[plane_num].pipe),
>> =C2=A0+ mixer_io + MIXER_BLD_REGS + MIXER_BLD_FCOLOR_CTL_REG);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_drm_plane_update(struct drm_plane *plane,
>> =C2=A0+ struct drm_plane_state *old_state)
>> =C2=A0+{
>> =C2=A0+ struct drm_plane_state *state =3D plane->state;
>> =C2=A0+ struct drm_crtc *crtc =3D state->crtc;
>> =C2=A0+ struct lcd *lcd =3D crtc_to_lcd(crtc);
>> =C2=A0+ struct priv *priv =3D lcd->priv;
>> =C2=A0+ int plane_num =3D plane - lcd->planes;
>> =C2=A0+
>> =C2=A0+ /* if the crtc is disabled, mark update delayed */
>> =C2=A0+ if (!(priv->started & (1 << lcd->mixer))) {
>> =C2=A0+ lcd->delayed |=3D 1 << plane_num;
>> =C2=A0+ return; /* mixer disabled */
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ mutex_lock(&priv->mutex);
>> =C2=A0+
>> =C2=A0+ de2_plane_update(priv, lcd, plane_num, state, old_state);
>> =C2=A0+
>> =C2=A0+ mutex_unlock(&priv->mutex);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static void de2_drm_plane_disable(struct drm_plane *plane,
>> =C2=A0+ struct drm_plane_state *old_state)
>> =C2=A0+{
>> =C2=A0+ struct drm_crtc *crtc =3D old_state->crtc;
>> =C2=A0+ struct lcd *lcd =3D crtc_to_lcd(crtc);
>> =C2=A0+ struct priv *priv =3D lcd->priv;
>> =C2=A0+ int plane_num =3D plane - lcd->planes;
>> =C2=A0+
>> =C2=A0+ if (!(priv->started & (1 << lcd->mixer)))
>> =C2=A0+ return; /* mixer disabled */
>> =C2=A0+
>> =C2=A0+ mutex_lock(&priv->mutex);
>> =C2=A0+
>> =C2=A0+ de2_plane_disable(lcd->priv, lcd->mixer, plane_num);
>> =C2=A0+
>> =C2=A0+ mutex_unlock(&priv->mutex);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+static const struct drm_plane_helper_funcs plane_helper_funcs =3D=
 {
>> =C2=A0+ .atomic_update =3D de2_drm_plane_update,
>> =C2=A0+ .atomic_disable =3D de2_drm_plane_disable,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const struct drm_plane_funcs plane_funcs =3D {
>> =C2=A0+ .update_plane =3D drm_atomic_helper_update_plane,
>> =C2=A0+ .disable_plane =3D drm_atomic_helper_disable_plane,
>> =C2=A0+ .destroy =3D drm_plane_cleanup,
>> =C2=A0+ .reset =3D drm_atomic_helper_plane_reset,
>> =C2=A0+ .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_st=
ate,
>> =C2=A0+ .atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int de2_one_plane_init(struct drm_device *drm,
>> =C2=A0+ struct drm_plane *plane,
>> =C2=A0+ int possible_crtcs,
>> =C2=A0+ int plane_num)
>> =C2=A0+{
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ ret =3D drm_universal_plane_init(drm, plane, possible_crtcs,
>> =C2=A0+ &plane_funcs,
>> =C2=A0+ plane_tb[plane_num].formats,
>> =C2=A0+ plane_tb[plane_num].n_formats,
>> =C2=A0+ plane_tb[plane_num].type, NULL);
>> =C2=A0+ if (ret >=3D 0)
>> =C2=A0+ drm_plane_helper_add(plane, &plane_helper_funcs);
>> =C2=A0+
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0+/* initialize the planes */
>> =C2=A0+int de2_plane_init(struct drm_device *drm, struct lcd *lcd)
>> =C2=A0+{
>> =C2=A0+ int i, n, ret, possible_crtcs =3D 1 << drm_crtc_index(&lcd->crtc=
);
>> =C2=A0+
>> =C2=A0+ n =3D ARRAY_SIZE(plane_tb);
>> =C2=A0+ if (n !=3D DE2_N_PLANES) {
>> =C2=A0+ dev_err(lcd->dev, "Bug: incorrect number of planes %d !=3D "
>> =C2=A0+ __stringify(DE2_N_PLANES) "\n", n);
>> =C2=A0+ return -EINVAL;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ for (i =3D 0; i < n; i++) {
>> =C2=A0+ ret =3D de2_one_plane_init(drm, &lcd->planes[i],
>> =C2=A0+ possible_crtcs, i);
>> =C2=A0+ if (ret < 0) {
>> =C2=A0+ dev_err(lcd->dev, "plane init failed %d\n", ret);
>> =C2=A0+ break;
>> =C2=A0+ }
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ return ret;
>> =C2=A0+}
>> =C2=A0--
>> =C2=A02.10.2
>
>> =C2=A0_______________________________________________
>> =C2=A0dri-devel mailing list
>> =C2=A0dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> =C2=A0https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
