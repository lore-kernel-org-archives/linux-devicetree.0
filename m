From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH V2] ARM: dts: imx6: correct anatop regulators range
Date: Mon, 02 Jul 2018 10:18:25 +0200
Message-ID: <1530519505.22468.77.camel@pengutronix.de>
References: <1530497076-15509-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530497076-15509-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Am Montag, den 02.07.2018, 10:04 +0800 schrieb Anson Huang:
> According to i.MX6 datasheet, the LDO_1P1's typical
> programming operating range is 1.0V to 1.2V, and
> the LDO_2P5's typical programming operating range
> is 2.25V to 2.75V, correct LDO_1P1 and LDO_2P5's
> regulator range settings for i.MX6 SoCs.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> changes since V1:
> 	Correct the regulator range according to datasheet's statement.
>  arch/arm/boot/dts/imx6sl.dtsi | 8 ++++----
>  arch/arm/boot/dts/imx6sx.dtsi | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> index 81f48116..c64bd90 100644
> --- a/arch/arm/boot/dts/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/imx6sl.dtsi
> @@ -524,8 +524,8 @@
> >  				regulator-1p1 {
> >  					compatible = "fsl,anatop-regulator";
> >  					regulator-name = "vdd1p1";
> > -					regulator-min-microvolt = <800000>;
> > -					regulator-max-microvolt = <1375000>;
> > +					regulator-min-microvolt = <1000000>;
> > +					regulator-max-microvolt = <1200000>;
> >  					regulator-always-on;
> >  					anatop-reg-offset = <0x110>;
> >  					anatop-vol-bit-shift = <8>;
> @@ -554,8 +554,8 @@
> >  				regulator-2p5 {
> >  					compatible = "fsl,anatop-regulator";
> >  					regulator-name = "vdd2p5";
> > -					regulator-min-microvolt = <2100000>;
> > -					regulator-max-microvolt = <2850000>;
> > +					regulator-min-microvolt = <2250000>;
> > +					regulator-max-microvolt = <2750000>;
> >  					regulator-always-on;
> >  					anatop-reg-offset = <0x130>;
> >  					anatop-vol-bit-shift = <8>;
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index 7130ab8..596763c 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -592,8 +592,8 @@
> >  				regulator-1p1 {
> >  					compatible = "fsl,anatop-regulator";
> >  					regulator-name = "vdd1p1";
> > -					regulator-min-microvolt = <800000>;
> > -					regulator-max-microvolt = <1375000>;
> > +					regulator-min-microvolt = <1000000>;
> > +					regulator-max-microvolt = <1200000>;
> >  					regulator-always-on;
> >  					anatop-reg-offset = <0x110>;
> >  					anatop-vol-bit-shift = <8>;
> @@ -622,8 +622,8 @@
> >  				regulator-2p5 {
> >  					compatible = "fsl,anatop-regulator";
> >  					regulator-name = "vdd2p5";
> > -					regulator-min-microvolt = <2100000>;
> > -					regulator-max-microvolt = <2875000>;
> > +					regulator-min-microvolt = <2250000>;
> > +					regulator-max-microvolt = <2750000>;
> >  					regulator-always-on;
> >  					anatop-reg-offset = <0x130>;
> >  					anatop-vol-bit-shift = <8>;
