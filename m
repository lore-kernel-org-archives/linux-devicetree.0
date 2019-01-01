From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add ROCK Pi 4 DTS support
Date: Tue, 01 Jan 2019 13:20:26 +0100
Message-ID: <5662913.pS8bTmJHpa@phil>
References: <Pragnesh_Patel@mentor.com>
 <20190101080848.5697-1-Pragnesh_Patel@mentor.com>
 <6B09C29B-CACB-4F71-A812-BE538AE6D996@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <6B09C29B-CACB-4F71-A812-BE538AE6D996-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shohei Maruyama <cheat.sc.linux-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Akash Gajjar <Akash_Gajjar-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pragnesh_Patel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Oskari Lemmela <oskari-fV/XPr6JiiHR7s880joybQ@public.gmane.org>, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pragnesh, Klaus,

Am Dienstag, 1. Januar 2019, 10:54:55 CET schrieb klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org:
> > On 01.01.2019, at 09:08, <Pragnesh_Patel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> <Pragnesh_Patel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> > 
> > From: Akash Gajjar <Akash_Gajjar-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > 
> > ROCK Pi 4 is RK3399 based SBC from radxa.com. board has a 1G/2G/4G lpddr4, CSI,
> > DSI, HDMI, OTG, USB 2.0, USB 3.0, 10/100/1000 RGMII Ethernet Phy, es8316 codec,
> > POE, WIFI (for Model B only), PCIE M.2 support on board.
> > 
> > This patch enables
> > - HDMI Display
> > - Console
> > - MMC, EMMC
> > - USB 2.0, USB-3.0
> > - Ethernet
> > 
> > Signed-off-by: Akash Gajjar <Akash_Gajjar-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Pragnesh Patel <Pragnesh_Patel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index de0c406c20cc..3fab0a3e4eeb 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-inx.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-kd.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4.dtb
> 
> sort(1) would put it before roc-pc

I'd keep it were it is right now, aka after roc- and before roc960.
Otherwise we would need to resort the whole list to keep it consistent ;-)

And I really want to minimize resorts, so just keep it were it is now
and looks sorted :-D

[...]

> > +	usb2 {
> > +		vcc5v0_host_en: vcc5v0-host-en {
> > +			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +	};
> 
> Maybe use the GPIO bank macros here?
> 1 = RK_GPIO1, 2 = RK_GPIO2 and so forth.

Actually the other way around please :-)
Aka just use numbers for the gpio bank in new files
and the pin defines RK_PD1 for the pins.

The RK_GPIO1 -> 1, etc... defines don't really bring additional
usefulnes, so I encourage not using them in new boards.


> > +&sdmmc {
> > +	bus-width = <4>;
> > +	cap-mmc-highspeed;
> > +	cap-sd-highspeed;
> > +	cd-gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
> 
> RK_PA7 for consistency.

yep, here the mapping iomux 4*8 pins <-> gpio controllers (32 pins)
is non intuitive and makes it more difficult, so the defines actually help
in following schematics.


Heiko
