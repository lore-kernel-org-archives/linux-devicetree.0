From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: Add Liviu Dudau as maintainer for
 ARM HDLCD driver.
Date: Mon, 7 Dec 2015 14:09:29 +0000
Message-ID: <20151207140929.GL972@e106497-lin.cambridge.arm.com>
References: <1449490265-6752-1-git-send-email-Liviu.Dudau@arm.com>
 <1449490265-6752-5-git-send-email-Liviu.Dudau@arm.com>
 <CACvgo537fFQJYA6vh1pnq+6GwdNC=cSnumar4kWHeFQpRqaBbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACvgo537fFQJYA6vh1pnq+6GwdNC=cSnumar4kWHeFQpRqaBbA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Punit Agrawal <punit.agrawal@arm.com>, LKML <linux-kernel@vger.kernel.org>, DRI devel <dri-devel@lists.freedesktop.org>, Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.com>, Andrew Morton <akpm@linux-foundation.org>, LAKML <linux-arm-kernel@lists.infradead.o>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 01:25:10PM +0000, Emil Velikov wrote:
> On 7 December 2015 at 12:11, Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> > Update MAINTAINERS file for HDLCD driver.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> > Cc: Greg KH <gregkh@linuxfoundation.org>
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Jiri Slaby <jslaby@suse.com>
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cba790b..8a637e3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -820,6 +820,12 @@ S: Maintained
> >  F:     drivers/net/arcnet/
> >  F:     include/uapi/linux/if_arcnet.h
> >
> > +ARM HDLCD DRM DRIVER
> > +M:     Liviu Dudau <liviu.dudau@arm.com>
> > +S:     Maintained
> You surely meant Supported, didn't you ?

Well .... it is a very fine line in corporate world, when a new
product comes the next year, to justify spending time (or money) on
last year's (or 5) product.

I am payed to do work now in the display drivers, so yes, is Supported.
As for the HDLCD, it could soon turn into a "legacy" device as the new
products come online having the Mali DP engine.

I'm not sure it makes a difference, but I can go with Supported for now=
=2E
Thanks for spotting it!

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
