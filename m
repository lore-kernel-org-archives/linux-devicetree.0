From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFC 1/2] irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ
 ERR11171
Date: Mon, 10 Jun 2019 12:38:52 +0000
Message-ID: <VI1PR04MB5055FD984F9BBA733B4D3503EE130@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610121346.15779-2-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abelvesa@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 6/10/2019 3:15 PM, Abel Vesa wrote:=0A=
> i.MX8MQ is missing the wake_request signals from GIC to GPCv2. This indir=
ectly=0A=
> breaks cpuidle support due to inability to wake target cores on IPIs.=0A=
> =0A=
> Now, in order to fix this, we can trigger IRQ 32 (hwirq 0) to all the cor=
es by=0A=
> setting 12th bit in IOMUX_GPR1 register. In order to control the target c=
ores=0A=
> only, that is, not waking up all the cores every time, we can unmask/mask=
 the=0A=
> IRQ 32 in the first GPC IMR register.=0A=
> =0A=
> Since EL3 is the one that deals with powering down/up the cores, and sinc=
e the=0A=
> cores wake up in EL3, EL3 should be the one to control the IMRs in this c=
ase.=0A=
> This implies we need to get into EL3 on every IPI to do the unmasking, le=
aving=0A=
> the masking to be done on the power-up sequence by the core itself.=0A=
=0A=
Manipulating same IMR registers in TF-A and Linux is racy so all IMR =0A=
manipulation (set_wake etc) needs to be done through SIP calls with =0A=
locking inside TF-A.=0A=
=0A=
It would make sense to have an entirely separate SIP-based =0A=
irq-imx8mq-gpc.c driver based on what is used in NXP tree.=0A=
=0A=
> +	iomux_gpr =3D syscon_regmap_lookup_by_compatible("fsl,imx6q-iomuxc-gpr"=
);=0A=
> +	if (!IS_ERR(iomux_gpr))=0A=
> +		regmap_update_bits(iomux_gpr, IOMUXC_GPR1, IMX6Q_GPR1_GINT,=0A=
> +					IMX6Q_GPR1_GINT);=0A=
=0A=
Doesn't this initialization belong in TF-A? On boot enable the irq and =0A=
keep it masked until somebody calls "wake".=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
