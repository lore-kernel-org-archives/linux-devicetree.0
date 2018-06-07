From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: cygnus: enable iproc-hwrng
Date: Thu, 7 Jun 2018 18:52:42 +0200
Message-ID: <CAJiuCcefDycphDfTM1a=Dz7vaHMQy4Bq=b4mKTiVZhRTKmWhoQ@mail.gmail.com>
References: <1528309291-25579-1-git-send-email-scott.branden@broadcom.com> <c0b4d69d-2826-320e-974e-c7cdbf341747@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c0b4d69d-2826-320e-974e-c7cdbf341747@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: scott.branden@broadcom.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mohamed-ismail.abdul@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Florian,

On Thu, 7 Jun 2018 at 18:35, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 06/06/2018 11:21 AM, Scott Branden wrote:
> > From: Mohamed Ismail Abdul Packir Mohamed <mohamed-ismail.abdul@broadco=
m.com>
> >
> > Enable the HW rng driver "iproc-rng200" for all cygnus platforms.
> >
> > Signed-off-by: Mohamed Ismail Abdul Packir Mohamed <mohamed-ismail.abdu=
l@broadcom.com>
> > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>
> Clement, do you want to test this and reported back?

Tested v1 and works fine on bcm58305

Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

>
> > ---
> >  arch/arm/boot/dts/bcm-cygnus.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-=
cygnus.dtsi
> > index 9fe4f5a..b0e38fa 100644
> > --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> > +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> > @@ -417,6 +417,11 @@
> >                       status =3D "disabled";
> >               };
> >
> > +             rng: rng@18032000 {
> > +                     compatible =3D "brcm,iproc-rng200";
> > +                     reg =3D <0x18032000 0x28>;
> > +             };
> > +
> >               sdhci0: sdhci@18041000 {
> >                       compatible =3D "brcm,sdhci-iproc-cygnus";
> >                       reg =3D <0x18041000 0x100>;
> >
>
>
> --
> Florian
