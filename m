From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 13:55:15 +0000
Message-ID: <20190610135514.xd5myavjsloos2y3@fsr-ub1664-175>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610131921.GB14647@lakrids.cambridge.arm.com>
 <20190610132910.srd4j2gtidjeppdx@fsr-ub1664-175>
 <6f1052ea-623a-b2e8-9aa8-22aef5fab4ca@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6f1052ea-623a-b2e8-9aa8-22aef5fab4ca@arm.com>
Content-Language: en-US
Content-ID: <AFFA43130A95A345A0B17C6E6F4503EA@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 19-06-10 14:39:02, Marc Zyngier wrote:
> On 10/06/2019 14:29, Abel Vesa wrote:
> > On 19-06-10 14:19:21, Mark Rutland wrote:
> >> On Mon, Jun 10, 2019 at 03:13:44PM +0300, Abel Vesa wrote:
> >>> This is another alternative for the RFC:
> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
kml.org%2Flkml%2F2019%2F3%2F27%2F545&amp;data=3D02%7C01%7Cabel.vesa%40nxp.c=
om%7C7cb2bda286214541bd1e08d6eda903e0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C=
0%7C0%7C636957707535314247&amp;sdata=3DguYqyq5ND6HzW6doFyWrR1Ry4ffWpGwtm0xD=
Z2ufFSg%3D&amp;reserved=3D0
> >>>
> >>> This new workaround proposal is a little bit more hacky but more cont=
ained
> >>> since everything is done within the irq-imx-gpcv2 driver.
> >>>
> >>> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_=
call
> >>> handler and registers instead a wrapper which calls in the 'hijacked'=
=20
> >>> handler, after that calling into EL3 which will take care of the actu=
al
> >>> wake up. This time, instead of expanding the PSCI ABI, we use a new v=
endor SIP.
> >>
> >> IIUC from last time [1,2], this erratum affects all interrupts
> >> targetting teh idle CPU, not just IPIs, so even if the bodge is more
> >> self-contained, it doesn't really solve the issue, and there are still
> >> cases where a CPU will not be woken from idle when it should be (e.g.
> >> upon receipt of an LPI).
> >>
> >=20
> > Wrong, this erratum does not affect any other type of interrupts, other
> > than IPIs. That is because all the other interrupts go through GPC,
> > which means the cores will wake up on any other type (again, other than=
 IPI).
>=20
> Huh... Are you saying that LPIs and PPIs are going through the GPC, and
> will trigger the wake-up of the core? That's not the conclusion we
> reached last time.
>=20

Hmm, I don't think that was the conclusion. Yes, Lucas was saying (IIRC)
that if you terminate the IRQs at GIC then all the other interrupts will be
in the same situation. But the performance improvement given by terminating
them at GIC might not be worth it when compared to the cpuidle support.

> 	M.
> --=20
> Jazz is not dead. It just smells funny...=
