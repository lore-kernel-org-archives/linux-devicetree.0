From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: Add Liviu Dudau as maintainer for
 ARM HDLCD driver.
Date: Mon, 7 Dec 2015 12:41:23 +0000
Message-ID: <20151207124123.GK972@e106497-lin.cambridge.arm.com>
References: <1449490265-6752-1-git-send-email-Liviu.Dudau@arm.com>
 <1449490265-6752-5-git-send-email-Liviu.Dudau@arm.com>
 <56657957.3010202@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56657957.3010202-AlSwsSmVLrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 01:19:35PM +0100, Jiri Slaby wrote:
> On 12/07/2015, 01:11 PM, Liviu Dudau wrote:
> > Update MAINTAINERS file for HDLCD driver.
> >=20
> > Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> > Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> > Cc: Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>

Hi Jiri,

>=20
> Please drop all of us who edited MAINTAINERS in the last decade from
> your CC list in next submissions. Naturally, we do not care about you=
r
> changes in MAINTAINERS at all.

Sorry for the noise, but as you have guess, I've used the list generate=
d
by get_maintainers.pl. Hopefully this is the last iteration of the seri=
es,
but if there will be further ones I will make sure that I remove you fr=
om
the Cc: list and keep only the commit_signers.

Best regards,
Liviu

>=20
> get_maintainers perhaps should not return 'git log' people for the
> MAINTAINERS file?
>=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cba790b..8a637e3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -820,6 +820,12 @@ S:	Maintained
> >  F:	drivers/net/arcnet/
> >  F:	include/uapi/linux/if_arcnet.h
> > =20
> > +ARM HDLCD DRM DRIVER
> > +M:	Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> > +S:	Maintained
> > +F:	drivers/gpu/drm/arm/
> > +F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
> > +
> >  ARM MFM AND FLOPPY DRIVERS
> >  M:	Ian Molton <spyro-pTmfFsKkaRw@public.gmane.org>
> >  S:	Maintained
> >=20
>=20
> thanks,
> --=20
> js
> suse labs
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
