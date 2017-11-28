From: Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 0/6] Mediatek MT2712 clock and scpsys support
Date: Tue, 28 Nov 2017 15:28:16 +0800
Message-ID: <1511854102-23195-2-git-send-email-weiyi.lu@mediatek.com>
References: <1511854102-23195-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1511854102-23195-1-git-send-email-weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series is based on v4.15-rc1 and composed of
scpsys control (PATCH 1-4) and device tree (PATCH 5-6)

changes since v6:
- Rebase to v4.15-rc1.

changes since v5:
- Refine bus protection with proper variable name
  and better implementation for the if statement.

changes since v4:
- Refine scpsys and infracfg for bus protection by passing
  a boolean flag to determine the register update method

changes since v3:
- Rebase to v4.14-rc1.

changes since v2:
- ensure the clocks used by clocksource driver are registered
  before clocksource init() by using CLK_OF_DECLARE()
- correct the frequency of clk32k/clkrtc_ext/clkrtc_int

changes since v1:
- Rebase to v4.13-next-soc.
- Refine scpsys and infracfg for bus protection.

*** BLURB HERE ***

Weiyi Lu (6):
  dt-bindings: soc: add MT2712 power dt-bindings
  soc: mediatek: extend bus protection API
  soc: mediatek: add dependent clock jpgdec/audio for scpsys
  soc: mediatek: add MT2712 scpsys support
  arm: dts: mt2712: Add clock controller device nodes
  arm: dts: Add power controller device node of MT2712

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   3 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          | 131 +++++++++++++++++++
 drivers/soc/mediatek/mtk-infracfg.c                |  26 +++-
 drivers/soc/mediatek/mtk-scpsys.c                  | 140 ++++++++++++++++++---
 include/dt-bindings/power/mt2712-power.h           |  26 ++++
 include/linux/soc/mediatek/infracfg.h              |   7 +-
 6 files changed, 311 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/power/mt2712-power.h

-- 
1.9.1
