From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [RFC 5/5] arm64: dts: imx8mq: Add the opp table and the
 cpu-supply nodes
Date: Thu, 14 Feb 2019 18:32:40 +0100
Message-ID: <1550165560.2546.50.camel@pengutronix.de>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
         <1550084693-9797-6-git-send-email-abel.vesa@nxp.com>
         <1550159428.2546.40.camel@pengutronix.de>
         <20190214171806.kufhw7ouguxt5jhq@fsr-ub1664-175>
         <1550165185.2546.48.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550165185.2546.48.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 14.02.2019, 18:26 +0100 schrieb Lucas Stach:
> Am Donnerstag, den 14.02.2019, 17:18 +0000 schrieb Abel Vesa:
> > On 19-02-14 16:50:28, Lucas Stach wrote:
> > > Hi Abel
> > > 
> > > Am Mittwoch, den 13.02.2019, 19:05 +0000 schrieb Abel Vesa:
> > > > Add the opp table containing only non over drive opps.
> > > > Also add the cpu-supply nodes for the A53 cores in the EVK
> > > > board.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17
> > > > +++++++++++++++++
> > > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 23
> > > > +++++++++++++++++++++++
> > > >  2 files changed, 40 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > index 54737bf..114359e 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > > > @@ -31,6 +31,23 @@
> > > >  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > > >  		enable-active-high;
> > > >  	};
> > > > +
> > > > +};
> > > > +
> > > > +&A53_0 {
> > > > +	cpu-supply = <&sw1a_reg>;
> > > > +};
> > > > +
> > > > +&A53_1 {
> > > > +	cpu-supply = <&sw1a_reg>;
> > > > +};
> > > > +
> > > > +&A53_2 {
> > > > +	cpu-supply = <&sw1a_reg>;
> > > > +};
> > > > +
> > > > +&A53_3 {
> > > > +	cpu-supply = <&sw1a_reg>;
> > > >  };
> > > 
> > > This should be a separate patch.
> > > 
> > 
> > OK, will send as separate patches in the next version.
> > 
> > > And AFAICS this is wrong, sw1a on the MX8M-EVK is the GPU supply,
> > > the
> > > CPU is supplied by a dedicated switcher that is controlled via a
> > > GPIO.
> > > 
> > 
> > Hmm, I think you're right. At least this is what the following
> > document says.
> > 
> > https://www.mouser.com/ds/2/302/IMX8MDQLQEVKHUG-1280333.pdf
> > 
> > So I guess this means there will not be any cpu-supply properties. 
> 
> There is a variable voltage CPU supply, but you need to model it as a
> gpio-regulator in the DT, it's not part of the PMIC provided rails.

In the schematics it's the line called PWM_LED (actually it's just
GPIO1_IO13) that controls the voltage. This changes the feedback of the
DCDC switcher, so it can toggle between 0.9V and 1.0V.

Regards,
Lucas
