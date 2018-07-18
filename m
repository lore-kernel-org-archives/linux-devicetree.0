From: Camelia Groza <camelia.groza@nxp.com>
Subject: [PATCH 3/3] powerpc/dts/fsl: t2080rdb: use the Cortina PHY driver compatible
Date: Wed, 18 Jul 2018 14:46:51 +0300
Message-ID: <1d1d60a461700d02fbb319e0cbdd134c5a107782.1531903211.git.camelia.groza@nxp.com>
References: <cover.1531903211.git.camelia.groza@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1531903211.git.camelia.groza@nxp.com>
In-Reply-To: <cover.1531903211.git.camelia.groza@nxp.com>
References: <cover.1531903211.git.camelia.groza@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org
Cc: paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Camelia Groza <camelia.groza@nxp.com>
List-Id: devicetree@vger.kernel.org

The Cortina PHY requires the use of the dedicated Cortina PHY driver
instead of the generic one.

Signed-off-by: Camelia Groza <camelia.groza@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t2080rdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t2080rdb.dts b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
index 836e4c9..55c0210 100644
--- a/arch/powerpc/boot/dts/fsl/t2080rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t2080rdb.dts
@@ -97,12 +97,12 @@
 
 		mdio@fd000 {
 			xg_cs4315_phy1: ethernet-phy@c {
-				compatible = "ethernet-phy-ieee802.3-c45";
+				compatible = "ethernet-phy-id13e5.1002";
 				reg = <0xc>;
 			};
 
 			xg_cs4315_phy2: ethernet-phy@d {
-				compatible = "ethernet-phy-ieee802.3-c45";
+				compatible = "ethernet-phy-id13e5.1002";
 				reg = <0xd>;
 			};
 
-- 
1.9.1
