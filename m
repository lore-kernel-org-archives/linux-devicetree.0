From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 11:23:57 -0700
Message-ID: <5400C53D.70501@gmail.com>
References: <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com> <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl> <53F5D8D9.7040604@suse.de> <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl> <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com> <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com> <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl> <540099AF.4020005@suse.de> <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl> <20140829173102.GA30917@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140829173102.GA30917-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, =?UTF-8?B?U8O2cmVu?= =?UTF-8?B?IEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/29/2014 10:31 AM, Jason Gunthorpe wrote:
> On Fri, Aug 29, 2014 at 08:35:36AM -0700, S=C3=B6ren Brinkmann wrote:
>=20
>> The compatible string is listed as optional property for PHYs. So, n=
ot
>> having one is an option, I guess. But, I'd also prefer to at least k=
eep
>> the -c22 one, since I saw problems when I tried using -c45 (the Zed =
phy
>> should support it...).
>=20
> -c45 and -c22 use a completely different MDIO protocol, Zed doesn't
> have a 10GE port, so it certainly doesn't use -c45.

Most recent 1GbE PHYs should also implement clause 45. It is a nice
improvement if you are using lot of transactions, otherwise clause 45
over clause 22 is suitable and supported by the PHY library (for EEE in
particular).

>=20
> If there is no compatible string at all the defined default is to use
> -c22.

Absolutely, the current binding makes that property optional, but I
think we should make it mandatory instead.

>=20
>> Also, so far, we haven't had any phy nodes in our Zynq dts files and
>> Ethernet worked, so the auto-detection there works pretty well
>> apparently. But it may be problematic if more than a single PHY is o=
n
>> the MDIO bus, I'd assume.
>=20
> Phy autodetection has always worked in some cases, but for DT etherne=
t
> bindings it is expected that there is an option to specify an explici=
t
> MDIO bus, and a phy-handle phandle to point to the phy. The phy shoul=
d
> be explicitly called out with the fixed MDIO address specified to
> avoid sketchy MDIO address auto probing.
>=20
> This provides the framework to specify interrupts and register
> overrides for the phy in the DT.

Absolutely, on the plus side, avoiding auto-detection also allows you t=
o
have a shorter boot time (usually by a factor of few hundreds of msecs
depending on how the MDIO buses handle errors).
--
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
