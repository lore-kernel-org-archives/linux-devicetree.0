From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/9] Add PMIC support to MediaTek MT7622 SoC
Date: Sat, 3 Jun 2017 01:55:41 +0800
Message-ID: <cover.1496425268.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

By default, the relevant board with MediaTek MT7622 SoC is equipped with
MediaTek MT6380 PMIC. So the series enables related driver allows the
MT6380 can be accessed and controlled through MediaTek PMIC wrapper by
those function drivers on MT7622 SoC.

Patch 1-2: Update dt-binding document for PMIC Wrapper and MT6380 regulator.
Patch 3:   Add a new driver for MT6380 regulator.
Patch 4-7: Update operations in PMIC Wrapper in order to adapt into MT6380.
Patch 8:   Add support of MT7622 platform for PMIC Wrapper
Patch 9:   Fix warning complained from checkpatch.pl.

Chenglin Xu (2):
  regulator: mt6380: Add support for MT6380
  soc: mediatek: pwrap: add support for MT7622 SoC

Sean Wang (7):
  dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
  dt-bindings: regulator: Add document for MediaTek MT6380 regulator
  soc: mediatek: pwrap: add pwrap_read32 for reading in 32-bit mode
  soc: mediatek: pwrap: add pwrap_write32 for writing in 32-bit mode
  soc: mediatek: pwrap: add pwrap_init pointer decided by the actual
    PMIC
  soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
  soc: mediatek: pwrap: fixup warnings from coding style

 .../bindings/regulator/mt6380-regulator.txt        |  90 +++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   4 +
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6380-regulator.c               | 395 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 373 +++++++++++++++++--
 include/linux/regulator/mt6380-regulator.h         |  32 ++
 7 files changed, 883 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
 create mode 100644 drivers/regulator/mt6380-regulator.c
 create mode 100644 include/linux/regulator/mt6380-regulator.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
