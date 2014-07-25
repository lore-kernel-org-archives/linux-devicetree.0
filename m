From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: zynq: DT: Add CAN node
Date: Fri, 25 Jul 2014 08:52:36 +0200
Message-ID: <56bf20294d106e0fc9c23a70cd991a50b441d0aa.1406271138.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-7974-1406271156-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-7974-1406271156-0001

Add node describing Zynq's CAN controller.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

Changes in v2:
- Add can1
- Enable can0 for zc702
- Use status property

 arch/arm/boot/dts/zynq-7000.dtsi | 26 +++++++++++++++++++++++++-
 arch/arm/boot/dts/zynq-zc702.dts |  4 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 366ca6434f54..983148111e3a 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -71,7 +71,31 @@
 			interrupts = <0 7 4>;
 			interrupt-parent = <&intc>;
 			clocks = <&clkc 12>;
-		};
+		};
+
+		can0: can@e0008000 {
+			compatible = "xlnx,zynq-can-1.0";
+			status = "disabled";
+			clocks = <&clkc 19>, <&clkc 36>;
+			clock-names = "can_clk", "pclk";
+			reg = <0xe0008000 0x1000>;
+			interrupts = <0 28 4>;
+			interrupt-parent = <&intc>;
+			tx-fifo-depth = <0x40>;
+			rx-fifo-depth = <0x40>;
+		};
+
+		can1: can@e0009000 {
+			compatible = "xlnx,zynq-can-1.0";
+			status = "disabled";
+			clocks = <&clkc 19>, <&clkc 36>;
+			clock-names = "can_clk", "pclk";
+			reg = <0xe0009000 0x1000>;
+			interrupts = <0 51 4>;
+			interrupt-parent = <&intc>;
+			tx-fifo-depth = <0x40>;
+			rx-fifo-depth = <0x40>;
+		};

 		gpio0: gpio@e000a000 {
 			compatible = "xlnx,zynq-gpio-1.0";
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 5e09cee33d42..835c3089c61c 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -29,6 +29,10 @@

 };

+&can0 {
+	status = "okay";
+};
+
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii";
--
1.8.2.3


--=_mimegpg-monstr-desktop-7974-1406271156-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlPR/rQACgkQykllyylKDCGRtACdE/dKfw8wL0OHWM6nz3FaqM+o
wPQAnineIwS5v6b207C4R6Acyd8ZIudG
=gl9I
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-7974-1406271156-0001--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
