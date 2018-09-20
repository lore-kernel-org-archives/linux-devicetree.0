From: Camelia Groza <camelia.groza@nxp.com>
Subject: [PATCH] powerpc/dts/fsl: t2080rdb: reorder the Cortina PHY XFI lanes
Date: Thu, 20 Sep 2018 14:47:01 +0300
Message-ID: <1537444021-10113-1-git-send-email-camelia.groza@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: oss@buserror.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Camelia Groza <camelia.groza@nxp.com>
List-Id: devicetree@vger.kernel.org

According to the T2080RDB schematics, for the CS4315 PHY, the XFI 1 lane is
connected to SFP 2 and the XFI 2 lane is connected to SFP 1. Change the
device tree to reflect the correct PHY order and port association.

Signed-off-by: Camelia Groza <camelia.groza@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t2080rdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t2080rdb.dts b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
index 55c0210..092a400 100644
--- a/arch/powerpc/boot/dts/fsl/t2080rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
@@ -77,12 +77,12 @@
 		};

 		ethernet@f0000 {
-			phy-handle = <&xg_cs4315_phy1>;
+			phy-handle = <&xg_cs4315_phy2>;
 			phy-connection-type = "xgmii";
 		};

 		ethernet@f2000 {
-			phy-handle = <&xg_cs4315_phy2>;
+			phy-handle = <&xg_cs4315_phy1>;
 			phy-connection-type = "xgmii";
 		};

--
1.9.1
