From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 01/10] dt-bindings: phy: add binding for
 Allwinner H6 USB2 PHY
Date: Thu,  4 Oct 2018 20:28:46 +0800
Message-ID: <20181004122855.22981-2-icenowy@aosc.io>
References: <20181004122855.22981-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBMMP3DOQKGQEELSBGBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181004122855.22981-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The USB2.0 PHY on Allwinner H6 is similar to the ones on the ones on
older SoCs, but with holes in PHY number (USB1 and USB2 are missing, in
which USB1 is a USB3 PHY).

Add binding for the PHY.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
New patch in v4.

 Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
index 07ca4ec4a745..f2e120af17f0 100644
--- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
@@ -14,13 +14,14 @@ Required properties:
   * allwinner,sun8i-r40-usb-phy
   * allwinner,sun8i-v3s-usb-phy
   * allwinner,sun50i-a64-usb-phy
+  * allwinner,sun50i-h6-usb-phy
 - reg : a list of offset + length pairs
 - reg-names :
   * "phy_ctrl"
-  * "pmu0" for H3, V3s and A64
+  * "pmu0" for H3, V3s, A64 or H6
   * "pmu1"
   * "pmu2" for sun4i, sun6i, sun7i, sun8i-a83t or sun8i-h3
-  * "pmu3" for sun8i-h3
+  * "pmu3" for sun8i-h3 or sun50i-h6
 - #phy-cells : from the generic phy bindings, must be 1
 - clocks : phandle + clock specifier for the phy clocks
 - clock-names :
@@ -29,12 +30,13 @@ Required properties:
   * "usb0_phy", "usb1_phy" for sun8i
   * "usb0_phy", "usb1_phy", "usb2_phy" and "usb2_hsic_12M" for sun8i-a83t
   * "usb0_phy", "usb1_phy", "usb2_phy" and "usb3_phy" for sun8i-h3
+  * "usb0_phy" and "usb3_phy" for sun50i-h6
 - resets : a list of phandle + reset specifier pairs
 - reset-names :
   * "usb0_reset"
   * "usb1_reset"
   * "usb2_reset" for sun4i, sun6i, sun7i, sun8i-a83t or sun8i-h3
-  * "usb3_reset" for sun8i-h3
+  * "usb3_reset" for sun8i-h3 and sun50i-h6
 
 Optional properties:
 - usb0_id_det-gpios : gpio phandle for reading the otg id pin value
-- 
2.18.0
