From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v6 1/2] bus: sunxi-rsb: Add Allwinner Reduced
 Serial Bus (RSB) controller bindings
Date: Sun, 18 Oct 2015 01:27:09 +0800
Message-ID: <1445102830-21774-2-git-send-email-wens@csie.org>
References: <1445102830-21774-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB44JRKYQKGQERUE7U6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445102830-21774-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reduced Serial Bus is a proprietary 2-line push-pull serial bus supporting
multiple slave devices. It was developed by Allwinner, Inc. and used by
Allwinner and X-Powers, Inc. for their line of PMICs and other peripheral
ICs.

Recent Allwinner SoCs, starting with the A23, have an RSB controller. This
is used to talk to the PMIC, and later with the A80 and A83 platform, the
audio codec IC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/bus/sunxi-rsb.txt          | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/sunxi-rsb.txt

diff --git a/Documentation/devicetree/bindings/bus/sunxi-rsb.txt b/Documentation/devicetree/bindings/bus/sunxi-rsb.txt
new file mode 100644
index 000000000000..3dd28343b6ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/sunxi-rsb.txt
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
2.6.1
