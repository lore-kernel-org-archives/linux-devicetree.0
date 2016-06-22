From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/4] Add the eDP/VOP device node for rk3399
Date: Wed, 22 Jun 2016 10:53:58 +0800
Message-ID: <1466564038-18021-1-git-send-email-ykk@rock-chips.com>
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
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This thread is rely on Mark's VOP thread[1] and Yakir's eDP thread[2].

[1]: https://lkml.org/lkml/2016/4/20/36
[2]: https://patchwork.kernel.org/patch/9175613/

Changes in v3:
- Add this patch in v3, due to another patch[0] need.
  [0]: https://patchwork.kernel.org/patch/9191737/

Changes in v2:
- provide some minimal patch description (Heiko)
- provide some minimal patch description (Heiko)
- provide some minimal patch description (Heiko)

Mark Yao (1):
  arm64: dts: rockchip: add VOP and VOP iommu node for rk3399

Yakir Yang (3):
  arm64: dts: rockchip: add eDP device node for rk3399
  arm64: dts: rockchip: add backlight support for rk3399 evb board
  arm64: dtsi: rockchip: introduce pclk_vio_grf in eDP device node

 arch/arm64/boot/dts/rockchip/rk3399-evb.dts |  40 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi    | 110 ++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

-- 
1.9.1
