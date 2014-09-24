From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM: zynq: DT: Add missing address for L2 pl310
Date: Wed, 24 Sep 2014 15:18:49 +0200
Message-ID: <178aa08adfcc161fbf902d6127202089e37e03dd.1411564723.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-5848-1411564730-0001";
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

--=_mimegpg-monstr-desktop-5848-1411564730-0001

By in sync with others node and add also baseaddr
to the node name.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-7000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 64caeb47bc0c..5020de584521 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -136,7 +136,7 @@
 			      <0xF8F00100 0x100>;
 		};

-		L2: cache-controller {
+		L2: cache-controller@f8f02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xF8F02000 0x1000>;
 			arm,data-latency = <3 2 2>;
--
1.8.2.3


--=_mimegpg-monstr-desktop-5848-1411564730-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlQixLoACgkQykllyylKDCHA9wCgkGpP3wesmI6hC6TDNeS4aGCj
Kg0Ani4sw83VkBfWhFCxmcxeWOrajSwT
=6pq6
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-5848-1411564730-0001--
