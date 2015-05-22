From: Yann Droneaud <ydroneaud@opteya.com>
Subject: Re: Device Tree Blob (DTB) licence
Date: Fri, 22 May 2015 12:05:48 +0200
Message-ID: <1432289148.5304.58.camel@opteya.com>
References: <1430820315.19516.26.camel@opteya.com>
	 <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, licensing@fsf.org
List-Id: devicetree@vger.kernel.org

Hi,

Le mardi 05 mai 2015 =C3=A0 11:41 -0500, Rob Herring a =C3=A9crit :
> On Tue, May 5, 2015 at 5:05 AM, Yann Droneaud <ydroneaud@opteya.com>=20
> wrote:
> >=20
> > I believe Device Tree Blob (.dtb file) built from kernel's Device=20
> > Tree
> > Sources (.dts, which #include .dtsi, which #include .h) using=20
> > Device
> > Tree Compiler (dtc) are covered by GNU General Public Licence v2
> > (GPLv2), but cannot find any reference.
>=20
> By default yes, but we've been steering people to dual license them=20
> GPL/BSD.
>=20

Can you give me the rationale behind such dual licenses requirement ?

If a BSD .dts includes GPLv2 .h, the whole is covered by GPLv2,
so I cannot find a case where a BSD covered .dts file could be used
alone within BSD license rights.

> > As most .dtsi in arch/arm/boot/dts/ are covered by GPLv2, and,
> > as most .h in include/dt-bindings/ are also covered by GPLv2,
> > the source code is likely covered by GPLv2.
> >=20
> > Then this source code is translated in a different language=20
> > (flattened
> > device tree), so the resulting translation is also likely covered=20
> > by
> > GPLv2.
> >=20
> > So, when I'm proposed to download a .dtb file from a random vendor,
> > can I require to get the associated source code ?
>=20
> I believe so yes. However, you already have the "source" for the most
> part. Just run "dtc -I dtb -O dts <dtb file>". You loose the
> preprocessing and include structure though (not necessarily a bad
> thing IMO).
>=20
> Then the question is what is the license on that generated dts!
>=20

That's also a good question.

Is this a form a "reverse engineering" with all the legalese burden ?

Anyway without a clear information attached to the DTB, it's difficult
to tell which licence cover the "decompiled" version.

> > Anyway, for a .dtb file generated from kernel sources, it's rather
> > painful to look after all .dts, .dtsi, .h, to find what kind of
> > licences are applicables, as some are covered by BSD, dual licensed
> > (any combination of X11, MIT, BSD, GPLv2).
>=20
> I imagine the includes cause some licensing discrepancies if you dug=20
> into it.
>=20

It's a pity, and it's probably something to sort out.

DTB files produced as part of kernel compilation should have a well
known license attached by default.

Regards.

--=20
Yann Droneaud
OPTEYA
