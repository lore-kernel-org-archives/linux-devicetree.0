From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC resend 3/4] arm64: dts: mt8173: Fix drm subsystem
Date: Thu, 19 Oct 2017 13:26:09 +0200
Message-ID: <20171019112610.13645-4-mbrugger@suse.com>
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
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b99a27372965..89db0a3f5950 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -803,6 +803,11 @@
 			#clock-cells = <1>;
 		};
 
+		dispsys: display-system {
+			compatible = "mediatek,mt2701-dispsys";
+			mediatek,mmsys = <&mmsys>;
+		}
+
 		mdp_rdma0: rdma@14001000 {
 			compatible = "mediatek,mt8173-mdp-rdma",
 				     "mediatek,mt8173-mdp";
-- 
2.14.2
