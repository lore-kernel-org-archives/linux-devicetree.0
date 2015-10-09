From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: Juno: Add support for the PCIe host bridge on
 Juno R1
Date: Fri, 9 Oct 2015 17:09:10 +0100
Message-ID: <20151009160910.GF3394@e106497-lin.cambridge.arm.com>
References: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
 <20151009141107.GD3394@e106497-lin.cambridge.arm.com>
 <20151009154408.GD21629@leverpostej>
 <40550712.xdsq5nNSTG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <40550712.xdsq5nNSTG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, device-tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 05:49:18PM +0200, Arnd Bergmann wrote:
> On Friday 09 October 2015 16:44:08 Mark Rutland wrote:
> > On Fri, Oct 09, 2015 at 03:11:07PM +0100, Liviu Dudau wrote:
> > > On Fri, Oct 09, 2015 at 08:54:33AM -0500, Rob Herring wrote:
> > > Or maybe I can claim the use of the string on account on being th=
e first on arm64=20
> > >=20
> > > I can add a vendor prefix if you want, but pci-host-generic is go=
ing to ignore it=20
> > > *because* it is trying to be a generic driver.
> >=20
> > The point here is to have the string ready if we need it later, so =
it's
> > fine that it's not used currently.
> >=20
> > Rob's suggestion is that the compatible list should look something =
like:
> >=20
> > compatible =3D "arm,juno-r1-pcie", "plda,xpressrich3", "pci-host-ec=
am-generic";
> >=20
> > We can match on "pci-host-ecam-generic" for now (and hopefully fore=
ver),
> > but if for some reason we need to special-case this host controller=
 (or
> > Juno's integration thereof), we can do that based on the compatible
> > string.
>=20
> Sounds good to me, it certainly can't hurt.
>=20
> 	Arnd

Hmm, I'm sorry, but this time I'm going to disagree.

I understand the principle that the DTS is a description of the hardwar=
e and it should
not have any built in knowledge of how a driver works but describe the =
physical properties
of the device (where such description makes sense, in this case it does=
).

However, when ARM has created the Juno platform it has also created a s=
tandard called
SBSA and has claimed that Juno is compliant with that standard. My curr=
ent position (and
it used to be MarkR's as well when we have argued internally the pros a=
nd cons of having
a bespoke driver for PLDA's XpressRICH3) is that SBSA compliant behavio=
ur *is* the expected
behaviour and if the device doesn't conform it needs to be fixed in fir=
mware.

Otherwise, I could've posted months ago the other public driver[1] that=
 I've wrote that
doesn't depend on firmware and could have been done with this long time=
 ago.

Best regards,
Liviu

1. https://github.com/ARM-software/linux/commit/ca9d82679916c3b6bdb8463=
19e343a43a6bbb31c


> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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
