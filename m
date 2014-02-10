From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC] dt: bindings: add bindings for Broadcom bcm43xx sdio devices
Date: Mon, 10 Feb 2014 20:17:48 +0100
Message-ID: <1392059868-8782-1-git-send-email-arend@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom bcm43xx sdio devices are fullmac devices that may be
integrated in ARM platforms. Currently, the brcmfmac driver for
these devices support use of platform data. This patch specifies
the bindings that allow this platform data to be expressed in the
devicetree.

Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Hante Meuleman <meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
This devicetree binding proposal is intended for platforms with
Broadcom wireless device in MMC sdio slot. These devices may
have their own interrupt and power line. Also the SDIO drive
strength is often hardware dependent and expressed in this
binding.

Not sure if this should go in staging or not. Feel free to
comment on this proposal.

Regards,
Arend
---
 .../staging/net/wireless/brcm,bcm43xx-fmac.txt     |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt

diff --git a/Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt
new file mode 100644
index 0000000..535f343
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt
@@ -0,0 +1,37 @@
+Broadcom BCM43xx Fullmac wireless SDIO devices
+
+This node provides properties for controlling the Broadcom wireless device. The
+node is expected to be specified as a child node to the MMC controller that
+connects the device to the system.
+
+Required properties:
+
+ - compatible : Should be "brcm,bcm43xx-fmac".
+ - wlan-supply : phandle for fixed regulator used to control power for
+	the device/module.
+
+Optional properties:
+ - drive-strength : drive strength used for SDIO pins on device (default = 6mA).
+ - interrupt-parent : the phandle for the interrupt controller to which the
+	device interrupt (HOST_WAKE) is connected.
+ - interrupts : interrupt specifier encoded according the interrupt controller
+	specified by interrupt-parent property.
+
+Example:
+
+mmc3: mmc@01c20000 {
+	pinctrl-0 = <&mmc3_pins>;
+	pinctrl-1 = <&wifi_host_wake>;
+	vmmc-supply = <&mmc3_supply>;
+	bus-width = <4>;
+
+	bcm4335: bcm4335@0 {
+		compatible = "brcm,bcm43xx-fmac";
+		wlan-supply = <&wlan-reg>;
+		drive-strength = <4>;
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "HOST_WAKE";
+	};
+};
+
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
