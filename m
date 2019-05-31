From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add missing PCIe pwr amd rst
 configuration
Date: Fri, 31 May 2019 11:38:34 +0530
Message-ID: <20190531060834.GA23771@Mani-XPS-13-9360>
References: <20190530125837.730-1-linux.amoon@gmail.com>
 <20190531040222.GB9641@Mani-XPS-13-9360>
 <CANAwSgQ13PizDuNEVF5JMM=byt-HELCmZFhLAa3RS6kvxmXuhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANAwSgQ13PizDuNEVF5JMM=byt-HELCmZFhLAa3RS6kvxmXuhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia <ezequiel@collabora.com>, Jagan Teki <jagan@amarulasolutions.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 10:27:22AM +0530, Anand Moon wrote:
> Hi Manivannan,
> 
> On Fri, 31 May 2019 at 09:32, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hi,
> >
> > On Thu, May 30, 2019 at 12:58:37PM +0000, Anand Moon wrote:
> > > This patch add missing PCIe gpio and pinctrl for power (#PCIE_PWR)
> > > also add PCIe gpio and pinctrl for reset (#PCIE_PERST_L).
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > Tested on Rock960 Model A
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > > index c7d48d41e184..f5bef6b0fe89 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> > > @@ -55,9 +55,10 @@
> > >
> > >       vcc3v3_pcie: vcc3v3-pcie-regulator {
> > >               compatible = "regulator-fixed";
> > > +             gpio = <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
> > >               enable-active-high;
> > >               pinctrl-names = "default";
> > > -             pinctrl-0 = <&pcie_drv>;
> > > +             pinctrl-0 = <&pcie_drv &pcie_pwr>;
> > >               regulator-boot-on;
> > >               regulator-name = "vcc3v3_pcie";
> > >               regulator-min-microvolt = <3300000>;
> > > @@ -381,9 +382,10 @@
> > >  };
> > >
> > >  &pcie0 {
> > > +     ep-gpio = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
> > >       num-lanes = <4>;
> > >       pinctrl-names = "default";
> > > -     pinctrl-0 = <&pcie_clkreqn_cpm>;
> > > +     pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
> > >       vpcie3v3-supply = <&vcc3v3_pcie>;
> > >       status = "okay";
> > >  };
> > > @@ -408,6 +410,16 @@
> > >               };
> > >       };
> > >
> > > +     pcie {
> > > +             pcie_pwr: pcie-pwr {
> > > +                     rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> > > +             };
> > > +
> > > +             pcie_perst_l:pcie-perst-l {
> > > +                     rockchip,pins = <2 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> > > +             };
> >
> > Which schematics did you refer? According to Rock960 v2.1 schematics [1], below
> > is the pin mapping for PCI-E PWR and PERST:
> >
> > PCIE_PERST - GPIO2_A2
> > PCIE_PWR - GPIO2_A5
> >
> 
> Opps, I have referred the wrong schematics *RK3399_Rock960_V1.0.pdf*
> may be old version.
> Thanks for pointing out the correct schematics.
> 
> > Above mapping holds true for Rock960 version 1.1, 1.2 and 1.3. Also,
> > rk3399-rock960.dtsi is common for both Rock960 and Ficus boards, so the board
> > specific parts should go to rk3399-rock960.dts and rk3399-ficus.dts.
> >
> > Thanks,
> > Mani
> 
> I have ROCK960-V 1.2 (Model A) for testing so. I will be sending patch
> v2 the relevant
> node update in rk3399-rock960.dts and rk3399-ficus.dts if below common
> for both the boards.

Both boards are different in terms of pin mapping!

-Mani

> 
> PCIE_PERST - GPIO2_A2
> PCIE_PWR - GPIO2_A5
> 
> >
> > [1] https://dl.vamrs.com/products/rock960/docs/hw/rock960_sch_v12_20180314.pdf
> 
> Best Regards
> -Anand
