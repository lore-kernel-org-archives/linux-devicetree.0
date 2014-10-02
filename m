From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: zynq: DT: Add cadence watchdog node
Date: Thu,  2 Oct 2014 15:11:27 +0200
Message-ID: <2079bb5b538a78c720cc7a1517c227376da1a3ba.1412255481.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-3789-1412255487-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-3789-1412255487-0001

Add the cadence watchdog node to the Zynq devicetree.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/boot/dts/zynq-7000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 2690e6d01f71..ea2651cd92ec 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -314,5 +314,16 @@
 			reg = <0xf8f00600 0x20>;
 			clocks = <&clkc 4>;
 		};
+
+		watchdog0: watchdog@f8005000 {
+			clocks = <&clkc 45>;
+			compatible = "xlnx,zynq-wdt-r1p2";
+			device_type = "watchdog";
+			interrupt-parent = <&intc>;
+			interrupts = <0 9 1>;
+			reg = <0xf8005000 0x1000>;
+			reset = <0>;
+			timeout-sec = <10>;
+		};
 	};
 };
--
1.8.2.3


--=_mimegpg-monstr-desktop-3789-1412255487-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlQtTv8ACgkQykllyylKDCF1iACfcj/wTl9A6n18jlexoPqZsIXM
nkMAniS+P4ihESUnBau++sTtCuBbp3Sp
=/ZMu
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-3789-1412255487-0001--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
