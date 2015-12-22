From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v4 0/4] drm: Add support for the ARM HDLCD display
 controller
Date: Tue, 22 Dec 2015 17:30:09 +0000
Message-ID: <20151222173009.GT960@e106497-lin.cambridge.arm.com>
References: <1449139249-9171-1-git-send-email-Liviu.Dudau@arm.com>
 <20151203165606.GS8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151203165606.GS8644@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Punit Agrawal <punit.agrawal@arm.com>, DRI devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 03, 2015 at 04:56:07PM +0000, Russell King - ARM Linux wrot=
e:
> On Thu, Dec 03, 2015 at 10:40:45AM +0000, Liviu Dudau wrote:
> > This series depends on Sudeep Holla's SCPI driver (now in mainline)=
 and on
> > the tda998x patches that have been queued on Russell's patch system=
 here [1].
>=20
> Now merged into my tree.

Hi Russell,

Can I ask about the faith of the patches that I have queued here:

http://www.arm.linux.org.uk/developer/patches/search.php?uid=3D2895

I can't find them in any of your public git branches (or I failed at gi=
t 101).

Best regards,
Liviu

>=20
> Can I ask a fairly obvious question...
>=20
> >  drivers/gpu/drm/Kconfig                            |   2 +
> >  drivers/gpu/drm/Makefile                           |   1 +
> >  drivers/gpu/drm/arm/Kconfig                        |  29 ++
> >  drivers/gpu/drm/arm/Makefile                       |   2 +
> >  drivers/gpu/drm/arm/hdlcd_crtc.c                   | 327 +++++++++=
+++
> >  drivers/gpu/drm/arm/hdlcd_drv.c                    | 555 +++++++++=
++++++++++++
> >  drivers/gpu/drm/arm/hdlcd_drv.h                    |  42 ++
> >  drivers/gpu/drm/arm/hdlcd_regs.h                   |  87 ++++
>=20
> Why is the subdirectory called "arm" and not "hdlcd" ?
>=20
> ARM Ltd have more than one display controller (they have the AMBA PL1=
10
> and PL111 in addition to this), and (afaics) this doesn't drive these=
=2E
> HDLCD probably won't be the last display hardware which ARM Ltd comes
> out with either.
>=20
> So, I think naming the subdirectory after the vendor is probably a
> mistake.
>=20
> --=20
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.
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
