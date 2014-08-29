From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 17:46:18 +0200
Message-ID: <5400A04A.9000208@suse.de>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com> <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com> <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl> <53F5D8D9.7040604@suse.de> <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl> <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com> <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com> <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl> <540099AF.4020005@suse.de> <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e52ebd6c-2f0d-4ea9-a01f-882212956ace-xjCwUguQ55/ZIcVUQlG5kGYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 29.08.2014 17:35, schrieb S=C3=B6ren Brinkmann:
> On Fri, 2014-08-29 at 05:18PM +0200, Andreas F=C3=A4rber wrote:
>> Am 29.08.2014 16:08, schrieb Michal Simek:
>>> I think resolution is:
>>> 1. Do not use marvell,88e1518 because it is not listed anywhere
>>> 2. Do not add ethernet-phy-idAAAA.BBBB because it breaks autodetect=
ion
>>> if there is different phy on the board and we shouldn't restrict us=
 in this.
>>> In spite of autodetection takes some time.
>>> 3. "ethernet-phy-ieee802.3-c22" is optional that's why doesn't need=
 to be added
>>> 4. Any listed compatible string has to be parsed which takes time
>>>
>>> That's why I think make sense not to use any compatible string.
>>> This should give us all flexibility which we want to have.
>>
>> Sorry, but we do need some node that we can reference via phy-handle
>> from the gem node, don't we?
>>
>> In that case, is not specifying any compatible string a valid option=
?
>>
>> If you don't want to specify the IDs, then I would've assumed we nee=
d to
>> specify the -c22 in order to have *some* compatible string in order =
to
>> trigger loading of the appropriate driver module.
>=20
> The compatible string is listed as optional property for PHYs. So, no=
t
> having one is an option, I guess. But, I'd also prefer to at least ke=
ep
> the -c22 one, since I saw problems when I tried using -c45 (the Zed p=
hy
> should support it...).
> Also, so far, we haven't had any phy nodes in our Zynq dts files and
> Ethernet worked, so the auto-detection there works pretty well
> apparently. But it may be problematic if more than a single PHY is on
> the MDIO bus, I'd assume.

Hm, it didn't work for me initially, but maybe some config option was
missing in multi_v7 or something else. I'll re-test next week.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
