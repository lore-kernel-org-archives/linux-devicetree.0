From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: arm: Document RTD1296
Date: Tue, 9 Jul 2019 12:40:11 -0600
Message-ID: <CAL_JsqLsO2MBOXUj3HT6=08VNsH7Ak_iJnxzdSOK3YF5+R387w@mail.gmail.com>
References: <20190707132339.GF13340@arks.localdomain> <27a3468f-e7b4-e334-5956-8db87d04ff8c@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27a3468f-e7b4-e334-5956-8db87d04ff8c@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Aleix Roca Nonell <kernelrocks@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 7, 2019 at 7:31 AM Andreas F=C3=A4rber <afaerber@suse.de> wrote=
:
>
> Am 07.07.19 um 15:23 schrieb Aleix Roca Nonell:
> > Add bindings for Relatek RTD1296 SoC. And the Bannana Pi BPI-W2 board.
>
> "Realtek", "Banana"
>
> >
> > Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/realtek.txt | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Docume=
ntation/devicetree/bindings/arm/realtek.txt
> > index 95839e19ae92..78da1004d38c 100644
> > --- a/Documentation/devicetree/bindings/arm/realtek.txt
> > +++ b/Documentation/devicetree/bindings/arm/realtek.txt
> > @@ -20,3 +20,16 @@ Root node property compatible must contain, dependin=
g on board:
> >  Example:
> >
> >      compatible =3D "zidoo,x9s", "realtek,rtd1295";
> > +
> > +
> > +RTD1296 SoC
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Required root node properties:
> > +
> > + - compatible :  must contain "realtek,rtd1296"
>
> I'm pretty sure that I had such a patch on the list already, so this is
> lacking my authorship.
>
> Also, Rob has been working to convert these to YAML, so we should
> probably complete that first and then add RTD1296 properly.

I'm just waiting for you to either ack it or apply it.

Rob
