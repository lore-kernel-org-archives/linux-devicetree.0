From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESEND PATCH v7 0/4] the fix for the USB HOST1 at rk3288 platform
Date: Tue, 13 Sep 2016 13:06:34 +0200
Message-ID: <2037551.pvMcfteTuT@phil>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1473447580-10369-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Randy,

could you check if the other host-only dwc2 are also affected by this (rk3188, 
rk3036) please? Because they also seem to act up in some strange way 
sometimes.

Thanks
Heiko

Am Samstag, 10. September 2016, 02:59:36 CEST schrieb Randy Li:
>   At this stage it is the only "full features" and well verified
> USB EHCI controller in this platform. More review is always necessary.
>
> Changelog:
>  - v7:
>     adding a wrapper for the reset operation for phy
>     using that wrapper
>  - v6:
>     move pwms pinctrl to pwms node
>     fix the order of the dtb file in Makefile
>  - v5:
>    - correct the mail format
>  - v4:
>    - re-order some nodes in alphabetical order
>    - fix some minor bugs
>    - add a entry in vendor list
>  - v3:
>    - fixing the rtc clock, using clock source from PMIC
>    - enable the tmu
>    - enable the fimc for elite board
>    - suuport the audio codec at elite board
>    - fixing minor bugs in the last commit
>  - v2:
>    - removing rtc node
>      the clock source driver is not done yet.
>    - adding exynos-bus
>    - fixing the MFC
> 
> Randy Li (4):
>   phy: Add reset callback
>   phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during
>     wakeup
>   usb: dwc2: assert phy reset when waking up in rk3288 platform
>   ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset
> 
>  .../devicetree/bindings/phy/rockchip-usb-phy.txt     |  3 +++
>  arch/arm/boot/dts/rk3288.dtsi                        |  4 ++++
>  drivers/phy/phy-core.c                               | 14 ++++++++++++++
>  drivers/phy/phy-rockchip-usb.c                       | 20
> ++++++++++++++++++++ drivers/usb/dwc2/core_intr.c                         |
> 11 +++++++++++ include/linux/phy/phy.h                              |  3
> +++
>  6 files changed, 55 insertions(+)
