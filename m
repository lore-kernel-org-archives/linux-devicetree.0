From: Madalin Bucur <madalin.bucur@nxp.com>
Subject: [PATCH 3/3] powerpc/fsl/dts: add FMan node for t1042d4rdb
Date: Fri, 11 Nov 2016 17:53:18 +0200
Message-ID: <1478879598-3362-3-git-send-email-madalin.bucur@nxp.com>
References: <1478879598-3362-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: madalin.bucur@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1478879598-3362-1-git-send-email-madalin.bucur@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
To: devicetree@vger.kernel.org
Cc: oss@buserror.net, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Madalin Bucur <madalin.bucur@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1042d4rdb.dts | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
index 2a5a90d..8c0c318 100644
--- a/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042d4rdb.dts
@@ -48,6 +48,53 @@
 					"fsl,deepsleep-cpld";
 		};
 	};
+	soc: soc@ffe000000 {
+		fman0: fman@400000 {
+			ethernet@e0000 {
+				phy-handle = <&phy_sgmii_0>;
+				phy-connection-type = "sgmii";
+			};
+
+			ethernet@e2000 {
+				phy-handle = <&phy_sgmii_1>;
+				phy-connection-type = "sgmii";
+			};
+
+			ethernet@e4000 {
+				phy-handle = <&phy_sgmii_2>;
+				phy-connection-type = "sgmii";
+			};
+
+			ethernet@e6000 {
+				phy-handle = <&phy_rgmii_0>;
+				phy-connection-type = "rgmii";
+			};
+
+			ethernet@e8000 {
+				phy-handle = <&phy_rgmii_1>;
+				phy-connection-type = "rgmii";
+			};
+
+			mdio0: mdio@fc000 {
+				phy_sgmii_0: ethernet-phy@02 {
+					reg = <0x02>;
+				};
+				phy_sgmii_1: ethernet-phy@03 {
+					reg = <0x03>;
+				};
+				phy_sgmii_2: ethernet-phy@01 {
+					reg = <0x01>;
+				};
+				phy_rgmii_0: ethernet-phy@04 {
+					reg = <0x04>;
+				};
+				phy_rgmii_1: ethernet-phy@05 {
+					reg = <0x05>;
+				};
+			};
+		};
+	};
+
 };
 
 #include "t1042si-post.dtsi"
-- 
2.1.0
