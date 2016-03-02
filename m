From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 RESEND 0/4] regulator: Add support for configuration of active-discharge
Date: Wed, 2 Mar 2016 16:24:44 +0530
Message-ID: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add the common regulator DT property  for configuration
of active discharge and implementing this in regulator core.
Also implementing the regulator ops for MAX77620 to configure
active discharge.

This is based on discussion on patch and comment from Mark Brown:
[PATCH V6 7/8] DT: regulator: add DT binding doc for regulator of PMIC max77620/max20024

> +- maxim,disable-active-discharge:    boolean, Disable active discharge.

That's something I've seen other regulators do, can we make it a standard property with an op?

---
Changes from V1: 
 Make the interface like 0 (non-init member) will be treated as default,
 1 for disable and 2 for enable. Created enum for active discharge
 default/enable/disable

Resending as earlier sequence was messed up.


Laxman Dewangan (4):
  regulator: DT: Add DT property for active-discharge configuration
  regulator: core: Add support for active-discharge configuration
  regulator: helper: Add helper to configure active-discharge using
    regmap
  regulator: max77620: Add support to configure active-discharge

 .../devicetree/bindings/regulator/regulator.txt    |  5 +++++
 drivers/regulator/core.c                           | 10 ++++++++++
 drivers/regulator/helpers.c                        | 23 ++++++++++++++++++++++
 drivers/regulator/max77620-regulator.c             |  9 +++++++++
 drivers/regulator/of_regulator.c                   |  5 +++++
 include/linux/regulator/driver.h                   | 17 ++++++++++++++++
 include/linux/regulator/machine.h                  |  4 ++++
 7 files changed, 73 insertions(+)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
