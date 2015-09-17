From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/9] Build and support rk3036 SoC platform
Date: Thu, 17 Sep 2015 16:28:51 +0800
Message-ID: <1442478540-15068-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,
we need to support rk3036 soc platform via upstream, there are
3 primary parts for the initial release of minimum system: dts,
pinctrl, and clock tree for rk3036, and additional, add a rtc
hym8563 patch to fix initial invaild, we can use these startup
and run to init processs.

Thanks.

changed in v2:
- based on v1, add clock controller documentation
- enable timer5 startup
- add smp for cpu1
- initial set time for rtc-hym8563

changes since v1:
- add dts, pinctrl and clock tree for rk3036 soc platform

The patchset (9):
9) rtc: hym8563: make sure hym8563 can be normal work
8) ARM: rockchip: add support smp for rk3036
7) rockchip: make sure timer5 is enabled on rk3036 platforms
6) pinctrl: rockchip: add support for the rk3036
5) dt-bindings: add documentation of rk3036 clock controller
4) clk: rockchip: add new clock type and controller for rk3036
3) clk: rockchip: add clock controller for rk3036
2) clk: rockchip: add dt-binding header for rk3036
1) ARM: dts: rockchip: add core rk3036 dts


Changes in v2:
Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Xing Zheng (9):
  ARM: dts: rockchip: add core rk3036 dts
  clk: rockchip: add dt-binding header for rk3036
  clk: rockchip: add clock controller for rk3036
  clk: rockchip: add new clock type and controller for rk3036
  dt-bindings: add documentation of rk3036 clock controller
  pinctrl: rockchip: add support for the rk3036
  rockchip: make sure timer5 is enabled on rk3036 platforms
  ARM: rockchip: add support smp for rk3036
  rtc: hym8563: make sure hym8563 can be normal work

 .../bindings/clock/rockchip,rk3036-cru.txt         |   60 +++
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/rk3036-sdk.dts                   |   62 +++
 arch/arm/boot/dts/rk3036.dtsi                      |  381 +++++++++++++++
 arch/arm/mach-rockchip/platsmp.c                   |  121 +++++
 arch/arm/mach-rockchip/rockchip.c                  |   22 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-pll.c                     |  262 +++++++++-
 drivers/clk/rockchip/clk-rk3036.c                  |  504 ++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |   30 ++
 drivers/pinctrl/pinctrl-rockchip.c                 |   17 +
 drivers/rtc/rtc-hym8563.c                          |   93 ++++
 include/dt-bindings/clock/rk3036-cru.h             |  198 ++++++++
 14 files changed, 1752 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
 create mode 100644 arch/arm/boot/dts/rk3036-sdk.dts
 create mode 100644 arch/arm/boot/dts/rk3036.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rk3036.c
 create mode 100644 include/dt-bindings/clock/rk3036-cru.h

-- 
1.7.9.5
