From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 1/5] soc: sunxi: Add Allwinner Reduced Serial
 Bus (RSB) controller bindings
Date: Thu, 24 Sep 2015 00:05:17 +0800
Message-ID: <1443024323-9115-2-git-send-email-wens@csie.org>
References: <1443024323-9115-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB5E3ROYAKGQETCOSS3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443024323-9115-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Reduced Serial Bus is a proprietary 2-line push-pull serial bus supporting
multiple slave devices. It was developed by Allwinner, Inc. and used by
Allwinner and X-Powers, Inc. for their line of PMICs and other peripheral
ICs.

Recent Allwinner SoCs, starting with the A23, have an RSB controller. This
is used to talk to the PMIC, and later with the A80 and A83 platform, the
audio codec IC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

Changes since v3:

  - Merged common RSB bindings and Allwinner RSB controller bindings
  - Moved to soc/sunxi/rsb.txt
  - Removed runtime address from bindings
  - #address-cells changed to 1
  - Default to 3 MHz if bus clock speed is not specified

---
 .../devicetree/bindings/soc/sunxi/rsb.txt          | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sunxi/rsb.txt

diff --git a/Documentation/devicetree/bindings/soc/sunxi/rsb.txt b/Documentation/devicetree/bindings/soc/sunxi/rsb.txt
new file mode 100644
index 000000000000..3dd28343b6ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sunxi/rsb.txt
@@ -0,0 +1,47 @@
+Allwinner Reduced Serial Bus (RSB) controller
+
+The RSB controller found on later Allwinner SoCs is an SMBus like 2 wire
+serial bus with 1 master and up to 15 slaves. It is represented by a node
+for the controller itself, and child nodes representing the slave devices.
+
+Required properties :
+
+ - reg             : Offset and length of the register set for the controller.
+ - compatible      : Shall be "allwinner,sun8i-a23-rsb".
+ - interrupts      : The interrupt line associated to the RSB controller.
+ - clocks          : The gate clk associated to the RSB controller.
+ - resets          : The reset line associated to the RSB controller.
+ - #address-cells  : shall be 1
+ - #size-cells     : shall be 0
+
+Optional properties :
+
+ - clock-frequency : Desired RSB bus clock frequency in Hz. Maximum is 20MHz.
+		     If not set this defaults to 3MHz.
+
+Child nodes:
+
+An RSB controller node can contain zero or more child nodes representing
+slave devices on the bus.  Child 'reg' properties should contain the slave
+device's hardware address. The hardware address is hardwired in the device,
+which can normally be found in the datasheet.
+
+Example:
+
+	rsb@01f03400 {
+		compatible = "allwinner,sun8i-a23-rsb";
+		reg = <0x01f03400 0x400>;
+		interrupts = <0 39 4>;
+		clocks = <&apb0_gates 3>;
+		clock-frequency = <3000000>;
+		resets = <&apb0_rst 3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic@3e3 {
+			compatible = "...";
+			reg = <0x3e3>;
+
+			/* ... */
+		};
+	};
-- 
2.5.3
