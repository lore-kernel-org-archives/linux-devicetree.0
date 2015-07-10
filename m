From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add clk_null to be the dummy root of MT8173 clocks
Date: Fri, 10 Jul 2015 17:16:01 +0800
Message-ID: <1436519763-3195-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.2-rc1 and adds a dummy clock "clk_null"
to be the root clock of clocks whose parents are not contained in
CCF clock tree.

In previous patch [1], it seems not suitable to declare clk_null in
device tree because it's not a clock comes form outside of SoC. So we
move clk_null into clock driver.

[1] https://lkml.org/lkml/2015/6/18/24

James Liao (2):
  clk: mediatek: Add root clocks support for Mediatek SoC.
  clk: mediatek: Add clk_null to be the dummy root clock for MT8173

 drivers/clk/mediatek/clk-mt8173.c      |  5 +++++
 drivers/clk/mediatek/clk-mtk.c         | 23 +++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h         | 17 ++++++++++++++++-
 include/dt-bindings/clock/mt8173-clk.h |  1 +
 4 files changed, 45 insertions(+), 1 deletion(-)

--
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
