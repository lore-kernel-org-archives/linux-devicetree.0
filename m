From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 17:43:29 -0700
Message-ID: <54011E31.8060409@gmail.com>
References: <53F5D8D9.7040604@suse.de> <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl> <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com> <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com> <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl> <540099AF.4020005@suse.de> <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl> <20140829173102.GA30917@obsidianresearch.com> <5400C53D.70501@gmail.com> <20140829232203.GA17664@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140829232203.GA17664-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/29/2014 04:22 PM, Jason Gunthorpe wrote:
> On Fri, Aug 29, 2014 at 11:23:57AM -0700, Florian Fainelli wrote:
>> On 08/29/2014 10:31 AM, Jason Gunthorpe wrote:
>>> On Fri, Aug 29, 2014 at 08:35:36AM -0700, S=C3=B6ren Brinkmann wrot=
e:
>>>
>>>> The compatible string is listed as optional property for PHYs. So,=
 not
>>>> having one is an option, I guess. But, I'd also prefer to at least=
 keep
>>>> the -c22 one, since I saw problems when I tried using -c45 (the Ze=
d phy
>>>> should support it...).
>>>
>>> -c45 and -c22 use a completely different MDIO protocol, Zed doesn't
>>> have a 10GE port, so it certainly doesn't use -c45.
>>
>> Most recent 1GbE PHYs should also implement clause 45. It is a nice
>> improvement if you are using lot of transactions, otherwise clause 4=
5
>> over clause 22 is suitable and supported by the PHY library (for EEE=
 in
>> particular).
>=20
> Oh, that is interesting, I haven't actually seen one of those yet..
>=20
> Hum. So that is messy, even if the Zed phy supports the C45 format,
> the macb driver (and by my reading, the Zynq hardware) lacks the
> capability to generate C45 frames.

We should restrict ourselves to clause 45 over clause 22 compatibility
mode, which requires no MDIO bus driver changes.

>=20
> It could be supported, but you'd have to use the GPIO bitbang MDIO
> driver to talk to the phy.
>=20
> So... that makes the compatible string for the phy even more
> confusing. 'Describe The HW' says it should have both c22 and c45
> listed - however we don't have software support in Linux to negotiate
> c22 and c45 support between the phy bus driver and attached phy :(

Right now, if you set the c45 compatible string, the MDIO bus driver an=
d
the PHY must support native c45 transactions to set phydev->is_c45, if
one or the other, or neither of those work, we will fallback to c22.

The part that is not figured out properly yet is how do we want to
handle functions (e.g: EEE) that are only accessible using c45 (native
or in compatible mode), since the PHY library uses two pairs of
accessors, with the native accessors not falling back to the indirect
accessor...
--
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
