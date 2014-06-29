From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/4] dt: bindings: add bindings for Broadcom
 bcm43xx sdio devices
Date: Sun, 29 Jun 2014 16:16:58 +0200
Message-ID: <1404051421-24377-2-git-send-email-hdegoede@redhat.com>
References: <1404051421-24377-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBZV7YCOQKGQEXSMWRZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404051421-24377-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

The Broadcom bcm43xx sdio devices are fullmac devices that may be
integrated in ARM platforms. Currently, the brcmfmac driver for
these devices support use of platform data. This patch specifies
the bindings that allow this platform data to be expressed in the
devicetree.

Reviewed-by: Hante Meuleman <meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Franky (Zhenhui) Lin <frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Daniel (Deognyoun) Kim <dekim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: drop clk / reg_on gpio handling, as there is no consensus
 on how to handle this yet]
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: move from bindings/staging to bindings]
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
new file mode 100644
index 0000000..5dbf169
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
@@ -0,0 +1,41 @@
+Broadcom BCM43xx Fullmac wireless SDIO devices
+
+This node provides properties for controlling the Broadcom wireless device. The
+node is expected to be specified as a child node to the SDIO controller that
+connects the device to the system.
+
+Required properties:
+
+ - compatible : Should be "brcm,bcm4329-fmac".
+
+Optional properties:
+ - brcm,drive-strength : drive strength used for SDIO pins on device in mA
+	(default = 6).
+ - interrupt-parent : the phandle for the interrupt controller to which the
+	device interrupts are connected.
+ - interrupts : specifies attributes for the out-of-band interrupt (host-wake).
+	When not specified the device will use in-band SDIO interrupts.
+ - interrupt-names : name of the out-of-band interrupt, which must be set
+	to "host-wake".
+
+Example:
+
+mmc3: mmc@01c12000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins_a>;
+	vmmc-supply = <&reg_vmmc3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&pio>;
+		interrupts = <10 8>; /* PH10 / EINT10 */
+		interrupt-names = "host-wake";
+	};
+};
-- 
2.0.0
