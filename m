From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add entry for Mali-DP driver
Date: Mon, 25 Apr 2016 18:08:11 +0100
Message-ID: <20160425170811.GC28464@e106497-lin.cambridge.arm.com>
References: <1461593964-27722-1-git-send-email-Liviu.Dudau@arm.com>
 <1461593964-27722-4-git-send-email-Liviu.Dudau@arm.com>
 <CACvgo51obFzx05SWUPZYbEj-LcNGq_NaCvF_iYsg9gpyLPj48Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACvgo51obFzx05SWUPZYbEj-LcNGq_NaCvF_iYsg9gpyLPj48Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 05:00:02PM +0100, Emil Velikov wrote:
> On 25 April 2016 at 15:19, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> > Add MAINTAINERS entry for ARM Mali-DP driver and update the
> > HDLCD file matching pattern to cover only HDLCD rather than
> > the whole drivers/gpu/drm/arm directory.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  MAINTAINERS | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1d5b4be..a5a4346 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -850,9 +850,17 @@ F: include/uapi/linux/if_arcnet.h
> >  ARM HDLCD DRM DRIVER
> >  M:     Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> >  S:     Supported
> > -F:     drivers/gpu/drm/arm/
> > +F:     drivers/gpu/drm/arm/hdlcd_*
> >  F:     Documentation/devicetree/bindings/display/arm,hdlcd.txt
> >
> > +ARM MALI-DP DRM DRIVER
> > +M:     Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> > +M:     Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> > +M:     Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
> > +S:     Supported
> > +F:     drivers/gpu/drm/arm/
> Woohoo. Thanks Liviu !
>=20
> Note that having both drivers' sources in the same folder will cause
> some grief wrt getting the correct maintainer. If you want to avoid
> that the easiest way is to move things in subdirectories roughly like=
:
>=20
> drivers/gpu/arm/hdlcd/
> drivers/gpu/arm/mapidp/

I'm surprised to hear that there might be problems. All HDLCD files sta=
rt
with hdlcd_ and the rest will go to the Mali-DP DRM maintainers (which =
includes
me as well).

I understand your suggestion and I thank for it, but I really hate to h=
ave
to navigate too many directories (for now). Lets see how things evolve =
and then
we can move stuff around.

Best regards,
Liviu


>=20
> Regards,
> Emil
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
