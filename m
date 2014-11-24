From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 15/15] metag: tz1090: add TZ1090 clocks to device tree
Date: Tue, 25 Nov 2014 00:03:43 +0100
Message-ID: <5932816.ccTTaBqqIv@diego>
References: <1416438943-11429-1-git-send-email-james.hogan@imgtec.com> <2363265.Y6kZ4TuTy5@diego> <20141121100647.GF12456@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141121100647.GF12456-4bYivNCBEGTR3KXKvIWQxtm+Uo4AYnCiHZ5vskTnxNA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 21. November 2014, 10:06:47 schrieb James Hogan:
> On Thu, Nov 20, 2014 at 01:56:24PM +0100, Heiko St=FCbner wrote:
> > I don't know enough about your clock structure, but it looks quite =
a bit
> > like Mike's mail from May [0] may apply here too.
> >=20
> > The register layout also suggests that it is indeed one clock ip-bl=
ock:
> >=20
> > 0x02005908 0x4	CR_TOP_CLKSWITCH
> > 0x0200590c 0x4	CR_TOP_CLKENAB
> > 0x02005950 0x4	CR_TOP_SYSPLL_CTL0
> > 0x02005954 0x4	CR_TOP_SYSPLL_CTL1
> > 0x02005988 0x4	CR_TOP_CLKSWITCH2
> > 0x0200598c 0x4	CR_TOP_CLKENAB2
> > ...
> >=20
> >=20
> > [0] https://lkml.org/lkml/2014/5/14/715
>=20
> Thanks, that does make sense. It's probably more like 4 memory region=
s
> ("top" level, "perip" peripheral registers, "hep" high end peripheral
> registers, and "pdc" powerdown controller registers), but it could
> certainly still have a single binding with multiple memory regions to
> simplify the clock specifiers.

It could also make sense to have 4 clock controller nodes for those. I =
guess=20
it all depends on how the hardware is layed out.

=46or example on Rockchip SoCs, all of this is contained in the "APB CR=
U" (Clock=20
and Reset Unit) with a memory region of <0x20000000 0x4000> - so here o=
ne=20
hardware-block that contains all the clocks and also the reset controll=
er.

On the other hand it might very well be more than one ip-block on your=20
platform.=20

So I guess it comes down to looking at the memory map [or documentation=
 :-) ]=20
to determine how many ip blocks there really are.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
