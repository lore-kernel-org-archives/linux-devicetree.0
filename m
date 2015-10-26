From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/8] Build and support rk3036 SoC platform
Date: Mon, 26 Oct 2015 12:25:31 +0800
Message-ID: <1445833539-6484-1-git-send-email-zhengxing@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,
  We need to support rk3036 soc platform via upstream, there are
3 primary parts for the initial release of minimum system: dts,
pinctrl, and clock tree for rk3036, and additional, we can use
these startup and run to init processs.

Thanks.

Changed in v5:
- don't use clk_ APIs in the pll init-callback

Changed in v4:
- add some basic IP modules on rk3036.dtsi
- optimized supporting smp codes

Changed in v3:
- optimized some codes based on v2
- removed the patch "initial set time for rtc-hym8563" (useless)
- removed the patch "pinctrl" (approved)

Changed in v2:
- based on v1, add clock controller documentation
- enable timer5 startup
- add smp for cpu1
- initial set time for rtc-hym8563

Changes in v1:
- add dts, pinctrl and clock tree for rk3036 soc platform

The patchset (8):
8) rockchip: make sure timer5 is enabled on rk3036 platforms
7) ARM: dts: enable smp for rk3036
6) ARM: rockchip: add support smp for rk3036
5) ARM: dts: rockchip: add core rk3036 dts
4) clk: rockchip: add new pll-type for rk3036 and similar socs
3) clk: rockchip: add clock controller for rk3036
2) clk: rockchip: add dt-binding header for rk3036
1) dt-bindings: add documentation of rk3036 clock controller


Changes in v5:
Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Heiko Stuebner (1):
  ARM: rockchip: add support smp for rk3036

Xing Zheng (7):
  dt-bindings: add documentation of rk3036 clock controller
  clk: rockchip: add dt-binding header for rk3036
  clk: rockchip: add clock controller for rk3036
  clk: rockchip: add new pll-type for rk3036 and similar socs
  ARM: dts: rockchip: add core rk3036 dts
  ARM: dts: enable smp for rk3036
  rockchip: make sure timer5 is enabled on rk3036 platforms

 Documentation/devicetree/bindings/arm/cpus.txt     |    1 +
 .../bindings/clock/rockchip,rk3036-cru.txt         |   56 ++
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/rk3036-evb.dts                   |   64 +++
 arch/arm/boot/dts/rk3036.dtsi                      |  541 ++++++++++++++++++++
 arch/arm/mach-rockchip/platsmp.c                   |   45 +-
 arch/arm/mach-rockchip/rockchip.c                  |   44 +-
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-pll.c                     |  249 ++++++++-
 drivers/clk/rockchip/clk-rk3036.c                  |  500 ++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |   30 ++
 include/dt-bindings/clock/rk3036-cru.h             |  195 +++++++
 12 files changed, 1697 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
 create mode 100644 arch/arm/boot/dts/rk3036-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3036.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rk3036.c
 create mode 100644 include/dt-bindings/clock/rk3036-cru.h

-- 
1.7.9.5
