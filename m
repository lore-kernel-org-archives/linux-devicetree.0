From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] arm64: dts: Mediatek: MT8173 updtes
Date: Mon, 1 Jun 2015 21:08:25 +0800
Message-ID: <1433164107-26568-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add MT8173 watchdog and I2C device nodes. Both device nodes 
are based on 4.1-rc1, but I2C need two extra CCF patches from Sascha [1][2].

[1] clk: Add common clock support for Mediatek MT8135 and MT8173
    http://lists.infradead.org/pipermail/linux-arm-kernel/2015-April/338763.html
[2] ARM64: dts: mt8173: Add clock controller device nodes
    http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/344753.html

Change in v2:
Modify I2C device node accroding register address order.

Eddie Huang (2):
  arm64: dts: mt8173: Add watchdog device node
  arm64: dts: mt8173: Add I2C device node

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 125 +++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
