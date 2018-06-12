From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: timer: add i.MX EPIT timer binding
Date: Tue, 12 Jun 2018 10:06:38 +0200
Message-ID: <CAJiuCce46jEnCy0z8=uqZMV=pgJZBd9vX0hjrTBuejMBJ5hxhg@mail.gmail.com>
References: <20180607140544.22268-1-peron.clem@gmail.com> <20180607140544.22268-4-peron.clem@gmail.com>
 <20180611181042.GA30888@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611181042.GA30888@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, 11 Jun 2018 at 20:10, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jun 07, 2018 at 04:05:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> >
> > Add devicetree binding document for NXP's i.MX SoC specific
> > EPIT timer driver.
> >
> > Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> > ---
> >  .../devicetree/bindings/timer/fsl,imxepit.txt | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/fsl,imxepit=
.txt
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, I posted the v7 yesterday, could you add your tag to the new releas=
e ?

Regards,
Clement
