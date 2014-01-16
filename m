From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 0/2] DT updates for Hummingboard and new Cubox-i
Date: Thu, 16 Jan 2014 18:22:12 +0000
Message-ID: <20140116182211.GX15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the Cubox-i has been released, and I have one, I've been able to
update things a little.  Out of the following two patches, the first one
I think is critical to be merged before the microsom support hits
mainline, since it drops the flexcan support from the microsom level,
moving it to the Hummingboard level.

That doesn't have _too_ much visible effect, but it's something which
should not be there (since as far as the microsom is concerned, there's
nothing special about these pads.)

The second adds basic support for the Cubox-i - as I have only the i4,
this is the platform which this has been tested against, but I've
generated the solo/dual-lite version as well since the only difference
at this basic level is the eSATA.

 arch/arm/boot/dts/Makefile                |  2 +
 arch/arm/boot/dts/imx6dl-cubox-i.dts      | 12 +++++
 arch/arm/boot/dts/imx6dl-hummingboard.dts | 13 ++++++
 arch/arm/boot/dts/imx6q-cubox-i.dts       | 16 +++++++
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 78 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-microsom.dtsi   | 13 ------
 6 files changed, 121 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-cubox-i.dts
 create mode 100644 arch/arm/boot/dts/imx6q-cubox-i.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
