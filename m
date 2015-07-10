From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] Fixes for MT8173 PLLs
Date: Fri, 10 Jul 2015 16:39:31 +0800
Message-ID: <1436517574-17895-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Title changed. Previous title is "Add MT8173 MMPLL change rate support"
and can be found in [1].

This patchset contains some fixes for changing rate of PLLs, especially
for MMPLL.

The first 2 patches are common fixes for PLLs, and the last patch is a
fix to support MT8173 MMPLL changing rate because its frequency setting
is different from other PLLs.

changes since v2:
- Rebase to 4.2-rc1.
- Split fixes of PLL setting calculation to a separeted patch.

changes since v1:
- Add a separated patch for mtk_pll_set_rate_regs().
- Use a structure array to describe a div_table.
- Limit max frequency to div_table[0].
- Minor changes such as static and comments.

[1] https://lkml.org/lkml/2015/7/8/265

James Liao (3):
  clk: mediatek: Fix PLL registers setting flow
  clk: mediatek: Fix calculation of PLL rate settings
  clk: mediatek: Add MT8173 MMPLL change rate support

 drivers/clk/mediatek/clk-mt8173.c | 24 +++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h    |  6 ++++++
 drivers/clk/mediatek/clk-pll.c    | 39 +++++++++++++++++++++++++++------------
 3 files changed, 54 insertions(+), 15 deletions(-)

--
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
