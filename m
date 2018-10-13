From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: allwinner: new board - Emlid Neutis N5
Date: Sat, 13 Oct 2018 10:26:11 +0800
Message-ID: <CAGb2v67406+vo_eF6-UvA0hPSx50kyXWTtcaeiOoXaz8uM1TQA@mail.gmail.com>
References: <1539012044-29998-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539339841-22235-1-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539339841-22235-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <b47c5458-683e-3e96-0bbe-f9db84579c77@suse.de> <20181012133914.GA32670@imagebutcher>
 <20181012202330.tdwedsof2bsnxkxn@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012202330.tdwedsof2bsnxkxn@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: aleksandr.aleksandrov@emlid.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, david@lechnology.com, Thierry Reding <treding@nvidia.com>, Florian Fainelli <f.fainelli@gmail.com>, johan@kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 13, 2018 at 4:23 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Oct 12, 2018 at 04:39:14PM +0300, Aleksandr Aleksandrov wrote:
> > Hi Andreas,
> >
> > Thanks for your feedback!
> >
> > > > + *
> > > > + * Copyright (C) 2018 Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "sun50i-h5-emlid-neutis-n5.dtsi"
> > > > +
> > > > +/ {
> > > > + model = "Emlid Neutis N5 Developer board";
> > > > + compatible = "emlid,neutis-n5-devboard",
> > > > +              "emlid,neutis-n5",
> > >
> > > You are lacking bindings definitions for these new identifiers. The
> > > vendor prefix should be patch 1/3, the SoM/board compatibles 2/3 and
> > > this .dts[i] patch 3/3, so that only vendor prefixes and compatibles
> > > that are defined and don't result in checkpatch.pl warnings get used.
> >
> > Patch 2/3:
> >
> > commit 46dcb8632b36644cb20e6b35ede12ff0088a60eb
> > Author: Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>
> > Date:   Fri Oct 12 16:22:28 2018 +0300
> >
> >     dt-bindings: arm: sunxi: emlid,neutis-n5(-devboard)
> >
> >     sunxi: add new compatibles for Emlid Neutis Dev board and SoM module
> >
> >     Signed-off-by: Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>
> >
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
> > index e4beec3..a907e52 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> > @@ -19,3 +19,5 @@ using one of the following compatible strings:
> >    allwinner,sun9i-a80
> >    allwinner,sun50i-a64
> >    nextthing,gr8
> > +  emlid,neutis-n5
> > +  emlid,neutis-n5-devboard
> >
> > Is this right place for the neutis compatibles?
>
> No, those are for SoCs compatible. I'm not sure we ever created a
> board compatible files.

We never did. We don't even have all vendor prefixes in, only the ones
that seem more popular, and actually have an identifiable website.

ChenYu
