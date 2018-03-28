From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] clocksource/drivers/imx-tpm: correct some registers
 operation flow
Date: Wed, 28 Mar 2018 01:46:28 +0000
Message-ID: <AM3PR04MB1315C539A913E1185CF04E40F5A30@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1522050461-19043-1-git-send-email-Anson.Huang@nxp.com>
 <20180327150647.l3qyrngxehpdwm7e@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327150647.l3qyrngxehpdwm7e@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



Anson Huang
Best Regards!


> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, March 27, 2018 11:07 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: daniel.lezcano@linaro.org; tglx@linutronix.de; mark.rutland@arm.com; =
A.s.
> Dong <aisheng.dong@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH 1/2] clocksource/drivers/imx-tpm: correct some regist=
ers
> operation flow
>=20
> On Mon, Mar 26, 2018 at 03:47:40PM +0800, Anson Huang wrote:
> > According to i.MX7ULP reference manual, TPM_SC_CPWMS can ONLY be
> > written when counter is disabled, TPM_SC_TOF is write-1-clear,
> > TPM_C0SC_CHF is also write-1-clear, correct these registers
> > initialization flow;
> >
> > Replace incorret clock name igp with ipg.
>=20
> incorrect
>=20
> This looks like an unrelated change.
>=20
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt |  2 +-
>=20
> Though you have the same typo, this should be a separate change from the
> driver.
=20
Thanks, I will do separate patches to fix the typo.

Anson.

>=20
> >  drivers/clocksource/timer-imx-tpm.c                       | 10
> ++++++++--
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
> > b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
> > index b4aa7dd..f82087b 100644
> > --- a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
> > +++ b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.txt
> > @@ -15,7 +15,7 @@ Required properties:
> >  - interrupts :	Should be the clock event device interrupt.
> >  - clocks :	The clocks provided by the SoC to drive the timer, must con=
tain
> >  		an entry for each entry in clock-names.
> > -- clock-names : Must include the following entries: "igp" and "per".
> > +- clock-names : Must include the following entries: "ipg" and "per".
> >
> >  Example:
> >  tpm5: tpm@40260000 {
> > diff --git a/drivers/clocksource/timer-imx-tpm.c
> > b/drivers/clocksource/timer-imx-tpm.c
> > index 21bffdc..7403e49 100644
> > --- a/drivers/clocksource/timer-imx-tpm.c
> > +++ b/drivers/clocksource/timer-imx-tpm.c
> > @@ -20,6 +20,7 @@
> >  #define TPM_SC				0x10
> >  #define TPM_SC_CMOD_INC_PER_CNT		(0x1 << 3)
> >  #define TPM_SC_CMOD_DIV_DEFAULT		0x3
> > +#define TPM_SC_TOF_MASK			(0x1 << 7)
> >  #define TPM_CNT				0x14
> >  #define TPM_MOD				0x18
> >  #define TPM_STATUS			0x1c
> > @@ -29,6 +30,7 @@
> >  #define TPM_C0SC_MODE_SHIFT		2
> >  #define TPM_C0SC_MODE_MASK		0x3c
> >  #define TPM_C0SC_MODE_SW_COMPARE	0x4
> > +#define TPM_C0SC_CHF_MASK		(0x1 << 7)
> >  #define TPM_C0V				0x24
> >
> >  static void __iomem *timer_base;
> > @@ -179,7 +181,7 @@ static int __init tpm_timer_init(struct device_node
> *np)
> >  	ipg =3D of_clk_get_by_name(np, "ipg");
> >  	per =3D of_clk_get_by_name(np, "per");
> >  	if (IS_ERR(ipg) || IS_ERR(per)) {
> > -		pr_err("tpm: failed to get igp or per clk\n");
> > +		pr_err("tpm: failed to get ipg or per clk\n");
> >  		ret =3D -ENODEV;
> >  		goto err_clk_get;
> >  	}
> > @@ -205,9 +207,13 @@ static int __init tpm_timer_init(struct device_nod=
e
> *np)
> >  	 * 4) Channel0 disabled
> >  	 * 5) DMA transfers disabled
> >  	 */
> > +	/* make sure counter is disabled */
> >  	writel(0, timer_base + TPM_SC);
> > +	/* TOF is W1C */
> > +	writel(TPM_SC_TOF_MASK, timer_base + TPM_SC);
> >  	writel(0, timer_base + TPM_CNT);
> > -	writel(0, timer_base + TPM_C0SC);
> > +	/* CHF is W1C */
> > +	writel(TPM_C0SC_CHF_MASK, timer_base + TPM_C0SC);
> >
> >  	/* increase per cnt, div 8 by default */
> >  	writel(TPM_SC_CMOD_INC_PER_CNT | TPM_SC_CMOD_DIV_DEFAULT,
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvge=
r
> > .kernel.org%2Fmajordomo-info.html&data=3D02%7C01%7CAnson.Huang%40nx
> p.com
> > %7C9de93358525a4e55fd7e08d593f45e3b%7C686ea1d3bc2b4c6fa92cd99c5
> c301635
> > %7C0%7C0%7C636577600126807143&sdata=3DD1NrhkZ2nret5XXTDoszUslt3W
> FjS0pMGh
> > NA1Ws2mcM%3D&reserved=3D0
