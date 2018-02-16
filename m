From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 2/6] dt-bindings: phy-rockchip-typec: deprecate some
 register properties.
Date: Fri, 16 Feb 2018 13:09:52 +0100
Message-ID: <20180216120956.19034-2-enric.balletbo@collabora.com>
References: <20180216120956.19034-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180216120956.19034-1-enric.balletbo@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Brian Norris <briannorris@chromium.org>
Cc: devicetree@vger.kernel.org, hl@rock-chips.com, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, William wu <wulf@rock-chips.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

As now the following register properties are in the driver, document as
deprecated these properties and recommend to not use them on new bindings.

The deprecated properties are:

- rockchip,typec-conn-dir : the register of type-c connector direction
- rockchip,usb3tousb2-en : the register of type-c force usb3 to usb2
                           enable control.
- rockchip,external-psm : the register of type-c phy external psm clock
                          selection.
- rockchip,pipe-status : the register of type-c phy pipe status.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes since v2:
- Apply the nit suggested by Heiko Stuebner.
Changes since v1:
- This patch is new on these series and is just a documentation update
  due patch [1/6]

 .../devicetree/bindings/phy/phy-rockchip-typec.txt | 33 +++++-----------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
index 6ea867e3176f..f95cd492d6fc 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
@@ -16,24 +16,6 @@ Required properties:
 		 "uphy", "uphy-pipe", "uphy-tcphy"
  - extcon : extcon specifier for the Power Delivery
 
-Note, there are 2 type-c phys for RK3399, and they are almost identical, except
-these registers(description below), every register node contains 3 sections:
-offset, enable bit, write mask bit.
- - rockchip,typec-conn-dir : the register of type-c connector direction,
-   for type-c phy0, it must be <0xe580 0 16>;
-   for type-c phy1, it must be <0xe58c 0 16>;
- - rockchip,usb3tousb2-en : the register of type-c force usb3 to usb2 enable
-   control.
-   for type-c phy0, it must be <0xe580 3 19>;
-   for type-c phy1, it must be <0xe58c 3 19>;
- - rockchip,external-psm : the register of type-c phy external psm clock
-   selection.
-   for type-c phy0, it must be <0xe588 14 30>;
-   for type-c phy1, it must be <0xe594 14 30>;
- - rockchip,pipe-status : the register of type-c phy pipe status.
-   for type-c phy0, it must be <0xe5c0 0 0>;
-   for type-c phy1, it must be <0xe5c0 16 16>;
-
 Required nodes : a sub-node is required for each port the phy provides.
 		 The sub-node name is used to identify dp or usb3 port,
 		 and shall be the following entries:
@@ -43,6 +25,13 @@ Required nodes : a sub-node is required for each port the phy provides.
 Required properties (port (child) node):
 - #phy-cells : must be 0, See ./phy-bindings.txt for details.
 
+Deprecated properties, do not use in new device tree sources, these
+properties are determined by the compatible value:
+ - rockchip,typec-conn-dir
+ - rockchip,usb3tousb2-en
+ - rockchip,external-psm
+ - rockchip,pipe-status
+
 Example:
 	tcphy0: phy@ff7c0000 {
 		compatible = "rockchip,rk3399-typec-phy";
@@ -58,10 +47,6 @@ Example:
 			 <&cru SRST_UPHY0_PIPE_L00>,
 			 <&cru SRST_P_UPHY0_TCPHY>;
 		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-		rockchip,typec-conn-dir = <0xe580 0 16>;
-		rockchip,usb3tousb2-en = <0xe580 3 19>;
-		rockchip,external-psm = <0xe588 14 30>;
-		rockchip,pipe-status = <0xe5c0 0 0>;
 
 		tcphy0_dp: dp-port {
 			#phy-cells = <0>;
@@ -86,10 +71,6 @@ Example:
 			 <&cru SRST_UPHY1_PIPE_L00>,
 			 <&cru SRST_P_UPHY1_TCPHY>;
 		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-		rockchip,typec-conn-dir = <0xe58c 0 16>;
-		rockchip,usb3tousb2-en = <0xe58c 3 19>;
-		rockchip,external-psm = <0xe594 14 30>;
-		rockchip,pipe-status = <0xe5c0 16 16>;
 
 		tcphy1_dp: dp-port {
 			#phy-cells = <0>;
-- 
2.15.1
