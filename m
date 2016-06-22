From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH v2 0/4] Add support i2s/spdif/gmac features for RK322x
 SoCs
Date: Wed, 22 Jun 2016 11:16:49 +0800
Message-ID: <1466565413-31027-1-git-send-email-zhengxing@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,
  We have the brother chipset product that RK3228 and RK3229,
They have many common configuration, but there are a number
of different features. In order to develop the future when they
are easy to distinguish, we need them to be independent.
  And, these patchset add i2s/gmac dts nodes for RK322x SoCs,
and add the new dts file of the rk3229 evb board.

Thanks.

Changes in v2:
- rename rk3228.dtsi to rk322x.dtsi

Xing Zheng (4):
  ARM: dts: rockchip: rename rk3228.dtsi to rk322x.dtsi
  ARM: dts: rockchip: add i2s nodes for RK322x SoCs
  ARM: dts: rockchip: add GMAC nodes for RK322x SoCs
  ARM: dts: rockchip: add support rk3229 evb board

 arch/arm/boot/dts/Makefile       |    1 +
 arch/arm/boot/dts/rk3228.dtsi    |  548 +----------------------------
 arch/arm/boot/dts/rk3229-evb.dts |   90 +++++
 arch/arm/boot/dts/rk3229.dtsi    |   45 +++
 arch/arm/boot/dts/rk322x.dtsi    |  708 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 845 insertions(+), 547 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3229-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3229.dtsi
 create mode 100644 arch/arm/boot/dts/rk322x.dtsi

-- 
1.7.9.5
