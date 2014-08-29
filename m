From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 08:35:36 -0700
Message-ID: <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
 <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
 <53F5D8D9.7040604@suse.de>
 <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
 <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com>
 <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com>
 <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl>
 <540099AF.4020005@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <540099AF.4020005-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-08-29 at 05:18PM +0200, Andreas F=C3=A4rber wrote:
> Am 29.08.2014 16:08, schrieb Michal Simek:
> > On 08/25/2014 10:21 PM, Florian Fainelli wrote:
> >> On 08/25/2014 10:46 AM, Jason Gunthorpe wrote:
> >>> On Fri, Aug 22, 2014 at 01:47:09PM -0700, Florian Fainelli wrote:
> >>>
> >>>>>  - the ID based strings seem to be not needed since, IIUC, the =
core
> >>>>>    reads the ID from the PHY and uses it, so I just left it out=
 not
> >>>>>    trying to figure out how to obtain the correct ID
> >>>>
> >>>> It is not needed, but it is one way to specify a PHY device if y=
ou do
> >>>> not know what compatible string to use instead.
> >>>
> >>> No, it is a way to specify a PHY device if the kernel can't auto =
probe
> >>> the Phy ID.
> >>>
> >>> Last I checked, the kernel doesn't support plain text compatible
> >>> strings for phys - everything is driven on the phy id, either aut=
o
> >>> probed or specified in the DT.
> >>
> >> That's right. Some PHY drivers might be relying on specific compat=
ible
> >> strings though, but not the core PHY library that probes and maps =
a
> >> driver to a PHY node.
> >>
> >>>
> >>>>>  - the marvell compatible strings are used in our vendor tree. =
They
> >>>>>    aren't used anywhere but in our vendor tree. I though keepin=
g them is
> >>>>>    nice since it identifies the PHY fully. And in case that lev=
el of
> >>>>>    detail is needed at some point it is already there.
> >>>>
> >>>> And this is the recommended way to do it in case we ever need to=
 key a
> >>>> software decision based on the hardware.
> >>>
> >>> All compatible strings need to be documented.
> >>>
> >>> .. and they need to encode more information than you get from the=
 phy
> >>> id - die revsision, package option, functional options, voltage
> >>> codes. Etc.
> >>>
> >>> .. and they actually need to be *right*
> >>
> >> Agreed.
> >>
> >>>
> >>> An example: The kernel reports 88E1318S for all four chips in tha=
t
> >>> family, AFAIK you have to read the package marking to figure out =
which
> >>> you have (it is the same die, with options switched on/off at
> >>> packaging time). People have already posted patches trying to
> >>> helpfully add a 'marvell,88E1318S' compatible string based on ker=
nel
> >>> output. Except it is wrong, it isn't actually the '8S version in =
the
> >>> HW.
> >>>
> >>> Even worse, Marvell has a whole series of socket compatible phys.=
 Just
> >>> because the board the DT author looked at has a '318, doesn't mea=
n
> >>> that every board ever made will. We've actually already been swit=
ching
> >>> between the 318 and 318S for production depending on which has pa=
rt
> >>> availability.
> >>>
> >>> Basically: don't try to override self-discoverable hardware in DT
> >>> without a really good reason.
> >>
> >> I think that's a very good point, at the very least let's use a
> >> compatible string that contains the full 32-bits PHY OUI.
> >=20
> > I think resolution is:
> > 1. Do not use marvell,88e1518 because it is not listed anywhere
> > 2. Do not add ethernet-phy-idAAAA.BBBB because it breaks autodetect=
ion
> > if there is different phy on the board and we shouldn't restrict us=
 in this.
> > In spite of autodetection takes some time.
> > 3. "ethernet-phy-ieee802.3-c22" is optional that's why doesn't need=
 to be added
> > 4. Any listed compatible string has to be parsed which takes time
> >=20
> > That's why I think make sense not to use any compatible string.
> > This should give us all flexibility which we want to have.
>=20
> Sorry, but we do need some node that we can reference via phy-handle
> from the gem node, don't we?
>=20
> In that case, is not specifying any compatible string a valid option?
>=20
> If you don't want to specify the IDs, then I would've assumed we need=
 to
> specify the -c22 in order to have *some* compatible string in order t=
o
> trigger loading of the appropriate driver module.

The compatible string is listed as optional property for PHYs. So, not
having one is an option, I guess. But, I'd also prefer to at least keep
the -c22 one, since I saw problems when I tried using -c45 (the Zed phy
should support it...).
Also, so far, we haven't had any phy nodes in our Zynq dts files and
Ethernet worked, so the auto-detection there works pretty well
apparently. But it may be problematic if more than a single PHY is on
the MDIO bus, I'd assume.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
