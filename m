From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3] arm64: new board - Emlid Neutis N5
Date: Thu, 11 Oct 2018 18:40:53 +0200
Message-ID: <20181011164053.zxoucudslmz3w2yn@flea>
References: <1538745949-13188-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539012044-29998-1-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539012044-29998-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <20181010144957.exrlupoph7ovsmdw@flea>
 <9398571539259289@myt4-929fb874f3f2.qloud-c.yandex.net>
 <2d09d6c0-0404-589d-2c34-da846cff4fb8@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d09d6c0-0404-589d-2c34-da846cff4fb8@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: aleksandr.aleksandrov@emlid.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 11, 2018 at 03:20:11PM +0200, Andreas Färber wrote:
> >> Also, I have a general comments, and it really depends on what your
> >> intention about the board ecosystem is. Do you expect the SOM to be
> >> swappable in multiple boards, or do you expect to send it as something
> >> that is just fixed into a daughter board?
> >>
> >> In the former case, you probably want to use overlays instead. In the
> >> latter, you're fine.
> >>
> > Right, we expect the SoM to be swappable. I agree, to use overlays is
> > more convenient, but
> > the devboard DT file will be a reference for the overlays and the future
> > boards based on Neutis.
> 
> What about just keeping the common nodes enabled in a SoM .dts, so that
> the average board doesn't need an Overlay for booting?

I guess the fundamental difference would be if the SoM can be run
free-standing or not. If it is, then overlays would be best. If not,
then I'm fine with using the include like Aleksandr has used.

> @Maxime/Rob, is it possible to merge .dtso files these days? If not,
> could that be considered in the big dts Makefile refactoring? :)

I don't really know what is that big dts Makefile refactoring you're
mentionning, but I don't think we can merge dtso before having the DT
connectors in place.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
