From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/7] Add PMIC support to MediaTek MT7622 SoC
Date: Mon, 16 Oct 2017 15:07:37 +0800
Message-ID: <cover.1508135937.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Changes since v4:
- for patch 1/7 and 5/7, add the description about how to bind pmic wrapper with MT6380.
- for patch 3/7, add more comments explaining why additional pwrap_read is 
required in the pwrap_write32.
- for patch 4/7 and 5/7, refactoring pwrap_init would help the driver to be more extensible 
when more various SoC and PMICs join.
- for patch 6/7, change pwrap_mt7622 into a const struct.

Changes since v3
- rebase into Linux 4.14-rc1
- removed those patches already applied

Changes since v2:
- for patch 1/2, enhance the document as the suggestions from v2.
- for patch 3, constify the table with struct regulator_ops, also fix that
regulator doesn't have modesetting facilities it just shouldn't have the ops
and finally fix copy+paste mistake in warranty disclaimer.
- for patch 7/8, sort the things added for MT7622/MT6380 alphabetically.

Chenglin Xu (1):
  soc: mediatek: pwrap: add support for MT7622 SoC

Sean Wang (6):
  dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
  soc: mediatek: pwrap: add pwrap_read32 for reading in 32-bit mode
  soc: mediatek: pwrap: add pwrap_write32 for writing in 32-bit mode
  soc: mediatek: pwrap: refactor pwrap_init for the various PMIC types
  soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
  soc: mediatek: pwrap: fixup warnings from coding style

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   6 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 461 ++++++++++++++++++---
 2 files changed, 407 insertions(+), 60 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
