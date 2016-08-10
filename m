From: Finlye Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 0/4] nvmem: rockchip-efuse: support more rockchip SoCs
Date: Wed, 10 Aug 2016 14:50:39 +0800
Message-ID: <1470811843-42668-1-git-send-email-finley.xiao@rock-chips.com>
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
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, wbriannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

As the timing and organization of efuse may be different
between rockchip SoCs, so their read function mya be different.
We add different device tree compatible string for rockchip SoCs
to match their own read function.

Finley Xiao (4):
  nvmem: rockchip-efuse: update compatible strings for Rockchip efuse
  ARM: dts: rockchip: update compatible strings for Rockchip efuse
  arm64: dts: rockchip: add efuse0 device node for rk3399
  nvmem: rockchip-efuse: add rk3399-efuse support

 .../devicetree/bindings/nvmem/rockchip-efuse.txt   |   8 +-
 arch/arm/boot/dts/rk3066a.dtsi                     |   2 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   2 +-
 arch/arm/boot/dts/rk3288.dtsi                      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  29 +++++
 drivers/nvmem/rockchip-efuse.c                     | 132 +++++++++++++++++----
 6 files changed, 150 insertions(+), 25 deletions(-)

-- 
1.9.1
