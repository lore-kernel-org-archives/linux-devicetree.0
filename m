From: Rob Herring <robh@kernel.org>
Subject: [PATCH] MAINTAINERS: update DT binding doc locations
Date: Thu,  5 Nov 2015 13:41:15 -0600
Message-ID: <1446752475-2708-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>, Alison Wang <alison.wang@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, James Hogan <james.hogan@imgtec.com>, Hans de Goede <hdegoede@redhat.com>, Vineet Gupta <vgupta@synopsys.com>
List-Id: devicetree@vger.kernel.org

After the recent moving of DT binding documents, some maintainers entries
are stale. Update them to the new locations.

In bindings/fb/, there were only 2 files and I'm assuming the FB
maintainers don't want to be copied on all of bindings/display/. So I've
dropped them.

Reported-by: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jianwei Wang <jianwei.wang.chn@gmail.com>
Cc: Alison Wang <alison.wang@freescale.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Yao <mark.yao@rock-chips.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f6685f..e2aa973 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3577,7 +3577,7 @@ S:	Maintained
 F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
-F:	Documentation/devicetree/bindings/panel/
+F:	Documentation/devicetree/bindings/display/panel/
 
 INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
 M:	Daniel Vetter <daniel.vetter@intel.com>
@@ -3609,15 +3609,15 @@ M:	Alison Wang <alison.wang@freescale.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/gpu/drm/fsl-dcu/
-F:	Documentation/devicetree/bindings/video/fsl,dcu.txt
-F:	Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
+F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
+F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19_05b.txt
 
 DRM DRIVERS FOR FREESCALE IMX
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	drivers/gpu/drm/imx/
-F:	Documentation/devicetree/bindings/drm/imx/
+F:	Documentation/devicetree/bindings/display/imx/
 
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
@@ -3630,7 +3630,7 @@ F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
-F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 
 DRM DRIVERS FOR RENESAS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
@@ -3647,7 +3647,7 @@ M:	Mark Yao <mark.yao@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	drivers/gpu/drm/rockchip/
-F:	Documentation/devicetree/bindings/video/rockchip*
+F:	Documentation/devicetree/bindings/display/rockchip*
 
 DRM DRIVERS FOR STI
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
@@ -3656,7 +3656,7 @@ L:	dri-devel@lists.freedesktop.org
 T:	git http://git.linaro.org/people/benjamin.gaignard/kernel.git
 S:	Maintained
 F:	drivers/gpu/drm/sti
-F:	Documentation/devicetree/bindings/gpu/st,stih4xx.txt
+F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
 
 DSBR100 USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
@@ -4342,7 +4342,6 @@ Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/plagnioj/linux-fbdev.git
 S:	Maintained
 F:	Documentation/fb/
-F:	Documentation/devicetree/bindings/fb/
 F:	drivers/video/
 F:	include/video/
 F:	include/linux/fb.h
@@ -6855,6 +6854,7 @@ S:	Supported
 F:	arch/metag/
 F:	Documentation/metag/
 F:	Documentation/devicetree/bindings/metag/
+F:	Documentation/devicetree/bindings/interrupt-controller/img,*
 F:	drivers/clocksource/metag_generic.c
 F:	drivers/irqchip/irq-metag.c
 F:	drivers/irqchip/irq-metag-ext.c
@@ -9443,7 +9443,7 @@ SIMPLEFB FB DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-fbdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/video/simple-framebuffer.txt
+F:	Documentation/devicetree/bindings/display/simple-framebuffer.txt
 F:	drivers/video/fbdev/simplefb.c
 F:	include/linux/platform_data/simplefb.h
 
@@ -10072,6 +10072,7 @@ M:	Vineet Gupta <vgupta@synopsys.com>
 S:	Supported
 F:	arch/arc/
 F:	Documentation/devicetree/bindings/arc/*
+F:	Documentation/devicetree/bindings/interrupt-controller/snps,arc*
 F:	drivers/tty/serial/arc_uart.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
 
-- 
2.5.0
