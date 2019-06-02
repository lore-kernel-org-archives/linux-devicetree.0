From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add missing configuration pwr
 amd rst for PCIe
Date: Sun, 2 Jun 2019 10:05:06 +0530
Message-ID: <CANAwSgQXrp5+UOdBEjq9PvBHw9KmgxpkVsENc05MoBMDBOoczg@mail.gmail.com>
References: <20190531201913.1122-1-linux.amoon@gmail.com> <20190601095106.GA2213@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190601095106.GA2213@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia <ezequiel@collabora.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Vicente Bergas <vicencb@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

Thanks for your review comment.

On Sat, 1 Jun 2019 at 15:21, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi,
>
> On Fri, May 31, 2019 at 08:19:13PM +0000, Anand Moon wrote:
> > This patch add missing PCIe gpio pin (#PCIE_PWR) for vcc3v3_pcie power
> > regulator node also add missing reset pinctrl (#PCIE_PERST_L) for PCIe node.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > using schematics: thanks for suggested by Manivannan
> > [1] https://dl.vamrs.com/products/rock960/docs/hw/rock960_sch_v12_20180314.pdf
> >
> > Changes from prevoius patch:
> > [2] https://patchwork.kernel.org/patch/10968695/
> >
> > Fix the suject and commit message and corrected the PWR and PERST configuration
> > as per shematics and dts nodes.
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-ficus.dts    | 7 +++++++
> >  arch/arm64/boot/dts/rockchip/rk3399-rock960.dts  | 7 +++++++
> >  arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 3 +--
> >  3 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
> > index 6b059bd7a04f..94e2a59bc1c7 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
> > @@ -89,6 +89,8 @@
> >
> >  &pcie0 {
> >       ep-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
>
> Looks like ep-gpio is wrong here :/ I probably referred old schematics
> at that time. Correct pin mapping is,
>
> ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
>
> And this should be fixed in a separate patch with "Fixes" tag!
>

Ok I will changes per the above. I have also check this with the
u-boot changes .

> >  };
> >
> >  &pinctrl {
> > @@ -104,6 +106,11 @@
> >                       rockchip,pins =
> >                               <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
> >                       };
> > +
> > +             pcie_perst_l: pcie-perst-l {
> > +                     rockchip,pins =
> > +                             <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> >       };
> >
> >       usb2 {
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
> > index 12285c51cceb..665fe09c7c74 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
> > @@ -64,6 +64,8 @@
> >
> >  &pcie0 {
> >       ep-gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
> >  };
> >
> >  &pinctrl {
> > @@ -104,6 +106,11 @@
> >                       rockchip,pins =
> >                               <2 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> >                       };
> > +
> > +             pcie_perst_l: pcie-perst-l {
> > +                     rockchip,pins =
> > +                             <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> >       };
> >
> >       usb2 {
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > index c7d48d41e184..3df0cd67b4b2 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > @@ -55,6 +55,7 @@
> >
> >       vcc3v3_pcie: vcc3v3-pcie-regulator {
> >               compatible = "regulator-fixed";
> > +             gpio = <&gpio2 RK_PA5 GPIO_ACTIVE_HIGH>;
>
> Actually the PWR pin mapping is defined in a separate node for both Rock960
> and Ficus in respective dts. So defining it here would be wrong as the PWR
> pin mapping is different for both boards.
>

Ok Thanks, so I will move the PWR pin nodes the respective dts files.

                  PCIE_PERST     PCIE_PWR
Rock960     GPIO2_A2          GPIO2_A5
Ficus          GPIO2_D4          GPIO1_D0   /* reference u-boot */

Pls confirm this is correct.

Best Regards
-Anand

> Thanks,
> Mani
