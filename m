From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: Juno: Add support for the PCIe host bridge on
 Juno R1
Date: Fri, 9 Oct 2015 17:41:29 +0100
Message-ID: <20151009164129.GG3394@e106497-lin.cambridge.arm.com>
References: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
 <20151009141107.GD3394@e106497-lin.cambridge.arm.com>
 <20151009154408.GD21629@leverpostej>
 <40550712.xdsq5nNSTG@wuerfel>
 <20151009160910.GF3394@e106497-lin.cambridge.arm.com>
 <20151009163252.GE21629@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151009163252.GE21629@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, device-tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 05:32:52PM +0100, Mark Rutland wrote:
> On Fri, Oct 09, 2015 at 05:09:10PM +0100, Liviu Dudau wrote:
> > On Fri, Oct 09, 2015 at 05:49:18PM +0200, Arnd Bergmann wrote:
> > > On Friday 09 October 2015 16:44:08 Mark Rutland wrote:
> > > > On Fri, Oct 09, 2015 at 03:11:07PM +0100, Liviu Dudau wrote:
> > > > > On Fri, Oct 09, 2015 at 08:54:33AM -0500, Rob Herring wrote:
> > > > > Or maybe I can claim the use of the string on account on bein=
g the first on arm64=20
> > > > >=20
> > > > > I can add a vendor prefix if you want, but pci-host-generic i=
s going to ignore it=20
> > > > > *because* it is trying to be a generic driver.
> > > >=20
> > > > The point here is to have the string ready if we need it later,=
 so it's
> > > > fine that it's not used currently.
> > > >=20
> > > > Rob's suggestion is that the compatible list should look someth=
ing like:
> > > >=20
> > > > compatible =3D "arm,juno-r1-pcie", "plda,xpressrich3", "pci-hos=
t-ecam-generic";
> > > >=20
> > > > We can match on "pci-host-ecam-generic" for now (and hopefully =
forever),
> > > > but if for some reason we need to special-case this host contro=
ller (or
> > > > Juno's integration thereof), we can do that based on the compat=
ible
> > > > string.
> > >=20
> > > Sounds good to me, it certainly can't hurt.
> > >=20
> > > 	Arnd
> >=20
> > Hmm, I'm sorry, but this time I'm going to disagree.
> >=20
> > I understand the principle that the DTS is a description of the
> > hardware and it should not have any built in knowledge of how a dri=
ver
> > works but describe the physical properties of the device (where suc=
h
> > description makes sense, in this case it does).
> >=20
> > However, when ARM has created the Juno platform it has also created=
 a
> > standard called SBSA and has claimed that Juno is compliant with th=
at
> > standard. My current position (and it used to be MarkR's as well wh=
en
> > we have argued internally the pros and cons of having a bespoke dri=
ver
> > for PLDA's XpressRICH3) is that SBSA compliant behaviour *is* the
> > expected behaviour and if the device doesn't conform it needs to be
> > fixed in firmware.
>=20
> We are not arguing for a bespoke driver, and in fact we hope to never
> have to use the addition strings.
>=20
> However, experience shows that we might not be lucky, and if we
> encounter some bizarre quirk in future we might need to handle that b=
y
> knowing what the hardware is.
>=20
> > Otherwise, I could've posted months ago the other public driver[1]
> > that I've wrote that doesn't depend on firmware and could have been
> > done with this long time ago.
>=20
> We're not arguing for kernel support code. What we're arguing for is
> data in the DTB that ideally turns out to be irrelevant.
>=20
> I can't see why you object to that.

It is not a strong objection but I don't want to ever have to add bespo=
ke
code to the pci-host-generic.c driver so adding a compatible property t=
hat
is going to be ignored is kind of pointless. Yes, one will have a bette=
r
idea on what the hardware actually is, but so what?

I will send a v2 with the added values.

Best regards,
Liviu

>=20
> Mark.
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
