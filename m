From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/3] dtc handling unreferenced nodes and an imx board dts
Date: Tue, 18 Feb 2014 15:15:36 +0100
Message-ID: <10555869.uLtJmrqZh3@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

After showcasing my dtc change as RFC before, this series shows essentially
where I want to go with the whole change - adding support for our ereaders
without duplicating the generic pinconfig nodes :-) . And also provides with
the dt change a user for the dtc flag addition.

That being said, the dtc change might need a bit more review and I also don't
know if it should go through the scripts/dtc variant like this or some
upstream and how the *_shipped files should be handled.

The patchset is done against linux-next from today, which includes both the
pingroups moved to the individual board files and the bindings for the zforce
touchscreen.

Heiko Stuebner (3):
  dtc: add ability to make nodes conditional on them being referenced
  ARM: dts: imx6sl: move pingroups back into soc dtsi
  ARM: dts: imx6sl: add board file for BQ Cervantes

 arch/arm/boot/dts/imx6sl-bq-cervantes.dts | 133 +++++++++++++++++++++
 arch/arm/boot/dts/imx6sl-evk.dts          | 181 -----------------------------
 arch/arm/boot/dts/imx6sl.dtsi             | 185 ++++++++++++++++++++++++++++++
 scripts/dtc/checks.c                      |   2 +
 scripts/dtc/dtc-lexer.l                   |   7 ++
 scripts/dtc/dtc-parser.y                  |   5 +
 scripts/dtc/dtc.h                         |   4 +
 scripts/dtc/flattree.c                    |   3 +
 scripts/dtc/livetree.c                    |  14 +++
 9 files changed, 353 insertions(+), 181 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6sl-bq-cervantes.dts

-- 
1.8.5.3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
