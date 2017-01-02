From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: armada388: rework clearfog's .dtsi references
Date: Mon, 02 Jan 2017 15:25:25 +0000
Message-ID: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
References: <E1cO454-00083C-Tj@rmk-PC.armlinux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series, based upon the previous series adding Clearfog Base
support, reworks the clearfog .dtsi file to reference nodes by label
rather than by path.

Not everything is moved - just those which had labels at the time the
patches were created.

 arch/arm/boot/dts/armada-388-clearfog-base.dts     |  15 +
 arch/arm/boot/dts/armada-388-clearfog.dtsi         | 353 ++++++++++-----------
 .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 113 ++++---
 3 files changed, 245 insertions(+), 236 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
