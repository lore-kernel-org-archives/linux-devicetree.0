From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2] ARM: dts: imx6dl-yapp4: Use rgmii-id phy mode on the cpu port
Date: Fri,  1 Mar 2019 08:26:42 +0100
Message-ID: <1551425202-8871-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

Use rgmii-id phy mode for the CPU port (MAC0) of the QCA8334 switch
to add delays to both Tx and Rx clock.

It worked with the rgmii mode before because the qca8k driver
(incorrectly) enabled delays in that mode and rgmii-id was not
implemented at all.

Commit 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")
removed the delays from the RGMII mode and hence broke the networking.

To fix the problem, commit a968b5e9d587 ("net: dsa: qca8k: Enable delay
for RGMII_ID mode") was introduced.

Now the correct phy mode is available so use it.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes in v2:
 - Reworded commit message - added more details regarding the issue.

 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
index b715ab0fa1ff..091d829f6b05 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
@@ -125,7 +125,7 @@
 				ethphy0: port@0 {
 					reg = <0>;
 					label = "cpu";
-					phy-mode = "rgmii";
+					phy-mode = "rgmii-id";
 					ethernet = <&fec>;
 
 					fixed-link {
-- 
2.1.4
