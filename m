From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: Add Juno board device tree.
Date: Wed, 26 Nov 2014 10:59:18 +0000
Message-ID: <20141126105918.GB828@e106497-lin.cambridge.arm.com>
References: <1415727131-4572-1-git-send-email-Liviu.Dudau@arm.com>
 <1415727131-4572-3-git-send-email-Liviu.Dudau@arm.com>
 <5475ABC0.3090007@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5475ABC0.3090007-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 10:30:24AM +0000, Marc Zyngier wrote:
> Hi Liviu,
>=20
> On 11/11/14 17:32, Liviu Dudau wrote:
> > This adds support for ARM's Juno development board (rev 0).
> > It enables most of the board peripherals: UART, I2C, USB, MMC and
> > 100Mb ethernet. There is no support at the moment for clock setting
> > and HDLCD driver which depends on it.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/arm/Makefile              |   1 +
> >  arch/arm64/boot/dts/arm/juno-clocks.dtsi      |  45 ++++++
> >  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 129 ++++++++++++++=
+
> >  arch/arm64/boot/dts/arm/juno.dts              | 218 ++++++++++++++=
++++++++++++
> >  4 files changed, 393 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/arm/juno-clocks.dtsi
> >  create mode 100644 arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> >  create mode 100644 arch/arm64/boot/dts/arm/juno.dts
> >=20
>=20
> [...]
>=20
> > diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts=
/arm/juno.dts
> > new file mode 100644
> > index 0000000..097ecc4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/arm/juno.dts
>=20
> [...]
>=20
> > +       timer {
> > +               compatible =3D "arm,armv8-timer";
> > +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) =
| IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>,
> > +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | =
IRQ_TYPE_EDGE_RISING)>;
> > +       };
>=20
> Sorry, I should have spotted this earlier: all these interrupts are
> *level*, not edge. This happens to work because the GIC's config
> register is RO for PPIs on Juno, but still...

Yes, I've seen your other email to Suravee regarding interrupt triggeri=
ng and I was trying to
find the relevant bits in Juno to tell me why I've put the info in DT t=
his way. Maybe I *did*
copy-paste this part from FVP DT though.

I will send a patch to Olof to update.

Best regards,
Liviu

>=20
> Thanks,
>=20
> 	M.
> --=20
> Jazz is not dead. It just smells funny...
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
