From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: dts: imx6qdl: add missing compatible and
 clock properties for EPIT
Date: Thu, 31 May 2018 10:41:47 +0200
Message-ID: <CAJiuCcefvMg6r=06O8m1TYa0hat_dHydcoJ7PN58qUru1K8zMQ@mail.gmail.com>
References: <20180530120327.27681-1-peron.clem@gmail.com> <20180530120327.27681-6-peron.clem@gmail.com>
 <a4042956-24e1-6132-4606-b5b8f4e30023@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a4042956-24e1-6132-4606-b5b8f4e30023@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, 31 May 2018 at 10:33, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
>
> On 05/30/2018 03:03 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Colin Didier <colin.didier@devialet.com>
> >
> > Add missing compatible and clock properties for EPIT node.
> >
> > Signed-off-by: Colin Didier <colin.didier@devialet.com>
> > Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> > Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx6qdl.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl=
.dtsi
> > index c003e62bf290..0feec516847a 100644
> > --- a/arch/arm/boot/dts/imx6qdl.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> > @@ -844,13 +844,23 @@
> >                       };
> >
> >                       epit1: epit@20d0000 { /* EPIT1 */
>
> epit1: timer@20d0000 { ...
>
> And /* EPIT1 */ comment can be removed, it is quite clear from the same
> line context.
>
> Formally it is a subject to another patch, but I think this can be
> accepted as a part of this one.

Should I also update other boards ?
I only did it for imx6qdl.dtsi, but the EPIT is present in other boards
but i can't test it myself.

>
> > +                             compatible =3D "fsl,imx6q-epit", "fsl,imx=
31-epit";
> >                               reg =3D <0x020d0000 0x4000>;
> >                               interrupts =3D <0 56 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                             clocks =3D <&clks IMX6QDL_CLK_IPG_PER>,
> > +                                      <&clks IMX6QDL_CLK_EPIT1>;
> > +                             clock-names =3D "ipg", "per";
> > +                             status =3D "disabled";
> >                       };
> >
> >                       epit2: epit@20d4000 { /* EPIT2 */
>
> Same as above.
>
> > +                             compatible =3D "fsl,imx6q-epit", "fsl,imx=
31-epit";
> >                               reg =3D <0x020d4000 0x4000>;
> >                               interrupts =3D <0 57 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                             clocks =3D <&clks IMX6QDL_CLK_IPG_PER>,
> > +                                      <&clks IMX6QDL_CLK_EPIT2>;
> > +                             clock-names =3D "ipg", "per";
> > +                             status =3D "disabled";
> >                       };
> >
> >                       src: src@20d8000 {
> >
>
> --
> With best wishes,
> Vladimir
