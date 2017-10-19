From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC resend 4/4] arm: dts: mt2701: Fix drm subsystem
Date: Thu, 19 Oct 2017 13:26:10 +0200
Message-ID: <20171019112610.13645-5-mbrugger@suse.com>
References: <20171019112610.13645-1-mbrugger@suse.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171019112610.13645-1-mbrugger@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux@armlinux.org.uk, matthias.bgg@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

DRM subysystem and clock driver shared the same compatible mmsys.
This stopped does not work, as only the first driver for a compatible
gets probed. We change the comaptible to the new DRM identifier to fix
this.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index afe12e5b51f9..1168ad69bb4e 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -530,6 +530,11 @@
 		#clock-cells = <1>;
 	};
 
+	dispsys: display-system {
+		compatible = "mediatek,mt2701-dispsys";
+		mediatek,mmsys = <&mmsys>;
+	}
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt2701-smi-larb";
 		reg = <0 0x14010000 0 0x1000>;
-- 
2.14.2
