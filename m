From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH RESEND v6 0/6] provide power off support for iMX6 with external PMIC
Date: Wed,  6 Dec 2017 08:23:56 +0100
Message-ID: <20171206072402.11694-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonard Crestez <leonard.crestez-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017.12.06:
Adding Linus. Probably there is no maintainer for this patch set.
No changes are made, tested on v4.15-rc1.

2017.10.27:
Last version of this patch set was send at 20 Jun 2017, this is a rebase against
kernel v4.14-rc6. Probably this set got lost. If I forgot to address some comments,
please point me.

This patch series is providing power off support for Freescale/NXP iMX6 based
boards with external power management integrated circuit (PMIC).

changes:
v6:
 - rename imx6_pm_poweroff to imx6_pm_stby_poweroff
 - fix "MPIC_STBY_REQ" typo in the comment.

v5:
 - remove useless includes from pm-imx6.c patch
 - add Acked-by to "regulator: pfuze100: add fsl,pmic-stby-poweroff property"
   patch

v4:
 - update comment in "regulator: pfuze100: add fsl,pmic-stby-poweroff ..."
   patch
 - add Acked-by to "ARM: imx6q: provide documentation for new ..."
   patch

v3:
 - set pm_power_off_prepare = NULL on .remove.
 - documentation and spelling fixes.
 - use %pf instead of lookup_symbol_name.

Oleksij Rempel (6):
  ARM: imx6q: provide documentation for new fsl,pmic-stby-poweroff
    property
  ARM: imx6: register pm_power_off handler if "fsl,pmic-stby-poweroff"
    is set
  kernel/reboot.c: export pm_power_off_prepare
  regulator: pfuze100: add fsl,pmic-stby-poweroff property
  regulator: pfuze100-regulator: provide pm_power_off_prepare handler
  ARM: dts: imx6: RIoTboard provide standby on power off option

 .../devicetree/bindings/clock/imx6q-clock.txt      |  8 ++
 .../devicetree/bindings/regulator/pfuze100.txt     |  7 ++
 arch/arm/boot/dts/imx6dl-riotboard.dts             |  5 ++
 arch/arm/mach-imx/pm-imx6.c                        | 25 ++++++
 drivers/regulator/pfuze100-regulator.c             | 92 ++++++++++++++++++++++
 kernel/reboot.c                                    |  1 +
 6 files changed, 138 insertions(+)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
