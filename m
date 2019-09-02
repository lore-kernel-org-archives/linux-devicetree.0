From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH] ARM: dts: stm32: move ltdc pinctrl on stm32mp157a dk1 board
Date: Mon, 2 Sep 2019 11:35:22 +0200
Message-ID: <CA+M3ks5GaN2-jEHO5-QGGkhYG2U-ExQR4=kNuk0jBxH2BkRGYQ@mail.gmail.com>
References: <1564754931-13861-1-git-send-email-yannick.fertre@st.com> <50695b37-df51-08d6-a11e-99f9349aa481@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50695b37-df51-08d6-a11e-99f9349aa481@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Yannick FERTRE <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Fabrice GASNIER <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

+ dri-devel mailing list

Le lun. 2 sept. 2019 =C3=A0 10:45, Philippe CORNU <philippe.cornu@st.com> a=
 =C3=A9crit :
>
> Hi Yannick,
>
> On 8/2/19 4:08 PM, Yannick Fertr=C3=A9 wrote:
> > The ltdc pinctrl must be in the display controller node and
> > not in the peripheral node (hdmi bridge).
> >
> > Signed-off-by: Yannick Fertr=C3=A9 <yannick.fertre@st.com>
> > ---
> >   arch/arm/boot/dts/stm32mp157a-dk1.dts | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/=
stm32mp157a-dk1.dts
> > index f3f0e37..1285cfc 100644
> > --- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
> > +++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> > @@ -99,9 +99,6 @@
> >               reset-gpios =3D <&gpioa 10 GPIO_ACTIVE_LOW>;
> >               interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> >               interrupt-parent =3D <&gpiog>;
> > -             pinctrl-names =3D "default", "sleep";
> > -             pinctrl-0 =3D <&ltdc_pins_a>;
> > -             pinctrl-1 =3D <&ltdc_pins_sleep_a>;
> >               status =3D "okay";
> >
> >               ports {
> > @@ -276,6 +273,9 @@
> >   };
> >
> >   &ltdc {
> > +     pinctrl-names =3D "default", "sleep";
> > +     pinctrl-0 =3D <&ltdc_pins_a>;
> > +     pinctrl-1 =3D <&ltdc_pins_sleep_a>;
>
> Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
>
> Thanks
> Philippe :)
>
> >       status =3D "okay";
> >
> >       port {
> >
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
