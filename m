From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Don't send to devicetree list for
 "arch/*/boot/dts"
Date: Wed, 23 Oct 2013 23:54:48 +0100
Message-ID: <20131023235448.4de21b8d.m.chehab@samsung.com>
References: <1382534520-15688-1-git-send-email-dianders@chromium.org>
 <52680380.7020204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <52680380.7020204@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Cesar Eduardo Barros <cesarb@cesarb.net>, Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Em Wed, 23 Oct 2013 12:12:32 -0500
Rob Herring <robherring2@gmail.com> escreveu:

> On 10/23/2013 08:22 AM, Doug Anderson wrote:
> > As discussed in the ARM kernel summit, people on the devicetree lis=
t
> > would no longer like to receive emails about all dts changes.  Remo=
ve
> > from MAINTAINERS.
>=20
> We need to make sure platform maintainers are copied though. That may=
 be
> hard since we don't have standard layout/naming of dts files.
>=20
> We might also want to drop these:
> K:      of_get_property
> K:      of_match_table
>=20
> They are at least on the wrong maintainer list now as they should be
> associated with the binding maintainers and not DT core code if we do
> keep them.
>=20
> Also based on the discussion, we need to add
> Documentation/devicetree/bindings/* to appropriate subsystem
> maintainers, but that should probably wait until after Friday at leas=
t.

/me is confused. What's the procedure for the DT patches for the device=
s
supported by the subsystem I maintain, e. g. patches for
/drivers/media/platform?=20

Should I just apply them, if I think that it is needed by the hardware?=
=20
Are there any criteria to be followed? If so, what criteria?

/me hopes that all those questions will be discussed/answered at KS on
=46riday's discussions ;)

In any case, my suggestion is that this patch should be a way more verb=
ose,
and should come together with a patch adding something at Documentation
(SubmittingPatches, or maybe SubmitingDTPatches) in order to be sure th=
at
both developers and subsystem maintainers will do the right thing.

Thanks,
Mauro
>=20
> Rob
>=20
> >=20
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> > ---
> >  MAINTAINERS | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ebaf8bd..0166e8e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5987,7 +5987,6 @@ OMAP DEVICE TREE SUPPORT
> >  M:	Beno=C3=AEt Cousson <bcousson@baylibre.com>
> >  M:	Tony Lindgren <tony@atomide.com>
> >  L:	linux-omap@vger.kernel.org
> > -L:	devicetree@vger.kernel.org
> >  S:	Maintained
> >  F:	arch/arm/boot/dts/*omap*
> >  F:	arch/arm/boot/dts/*am3*
> > @@ -6167,7 +6166,6 @@ M:	Ian Campbell <ijc+devicetree@hellion.org.u=
k>
> >  L:	devicetree@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/
> > -F:	arch/*/boot/dts/
> >  F:	include/dt-bindings/
> > =20
> >  OPENRISC ARCHITECTURE
> >=20
>=20


--=20

Cheers,
Mauro
