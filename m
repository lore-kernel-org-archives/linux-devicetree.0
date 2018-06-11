From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v6 0/5] Reintroduce i.MX EPIT Timer
Date: Mon, 11 Jun 2018 16:46:25 +0200
Message-ID: <CAJiuCcdfV4_zqD-DdepkE9hoHSHih66dSJciX2EwBViWM=cu=g@mail.gmail.com>
References: <20180607140544.22268-1-peron.clem@gmail.com> <74959a6a-60bb-f854-6ef2-21c3c60d3451@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74959a6a-60bb-f854-6ef2-21c3c60d3451@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vz@mleia.com
Cc: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,
On Mon, 11 Jun 2018 at 16:39, Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On 06/07/2018 05:05 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> >
> > As suggested in the commit message we have added the device tree suppor=
t,
> > proper bindings and we moved the driver into the correct folder.
> >
> > Moreover we made some changes like use of relaxed IO accesor,
> > implement sched_clock, delay_timer and reduce the clockevents min_delta=
.
> >
>
> I reviewed and tested the driver on i.MX31, as expected it works fine,
> and I'll give my tags per a commit, please add them to v7 changes.

Thanks, i will

>
> --
> Best wishes,
> Vladimir
