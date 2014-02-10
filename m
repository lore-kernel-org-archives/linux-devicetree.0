From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/3] Syscon early initialization
Date: Mon, 10 Feb 2014 16:22:32 +0100
Message-ID: <cover.1392045742.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-27070-1392045755-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Felipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-27070-1392045755-0001

Hi,

this series come from my discussion with Arnd at KS and then
on some other threads/IRCs(Arnd and Mark) that SoC vendors
are more and more try to add misc functionality to
one memory region. For this purpose syscon driver is in the kernel.
But regular syscon driver is initialized too late
and platforms are trying to create specific code to handle it.

For this purpose the series have been created to provide
early syscon initialization and regmap creation first
and then attaching device.

The last patch is zynq specific patch to clear slcr driver
and clock driver can profit from it too when clk regmap is ready.

Also moving syscon driver from mfs should be consider.

Thanks for your comments,
Michal


Michal Simek (3):
  regmap: Separate regmap dev initialization
  mfd: syscon: Support early initialization
  ARM: zynq: Use early syscon initialization

 arch/arm/boot/dts/zynq-7000.dtsi |   1 +
 arch/arm/mach-zynq/common.c      |   6 +-
 arch/arm/mach-zynq/slcr.c        |  42 +------------
 drivers/base/regmap/regmap.c     |  41 +++++++++----
 drivers/clk/zynq/clkc.c          |  57 ++++++------------
 drivers/mfd/syscon.c             | 126 +++++++++++++++++++++++++++++++++------
 include/linux/mfd/syscon.h       |  11 ++++
 include/linux/regmap.h           |   2 +
 8 files changed, 173 insertions(+), 113 deletions(-)

--
1.8.2.3


--=_mimegpg-monstr-desktop-27070-1392045755-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlL47rsACgkQykllyylKDCHNlwCeJZDKdIvWVtpIym3PobzdOuut
X+gAn0QxMBEPBpjidSLTCINWWPWAmdka
=Vq2x
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-27070-1392045755-0001--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
