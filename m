From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] ARM: zynq: DT: Add missing reference for ADC
Date: Wed, 24 Sep 2014 16:01:32 +0200
Message-ID: <fced9e56dc4ef8df9ead34f6444c010cc31c7a61.1411567289.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-28042-1411567293-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-28042-1411567293-0001

Add missing reference for ADC node.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-7000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 772381fe07bb..fc90f47f9c03 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -64,7 +64,7 @@
 		interrupt-parent = <&intc>;
 		ranges;

-		adc@f8007100 {
+		adc: adc@f8007100 {
 			compatible = "xlnx,zynq-xadc-1.00.a";
 			reg = <0xf8007100 0x20>;
 			interrupts = <0 7 4>;
--
1.8.2.3


--=_mimegpg-monstr-desktop-28042-1411567293-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlQizr0ACgkQykllyylKDCFp0QCdFZ+74ZkETgs0NORQ01DA4Zn3
AL8An20pVag1Uojvx7A3/lHIgFZEeMZ6
=TqqK
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-28042-1411567293-0001--
