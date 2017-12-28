From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
Date: Thu, 28 Dec 2017 14:57:20 +0100
Message-ID: <20171228135720.GL18255@piout.net>
References: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
 <20171222104028.GC18255@piout.net>
 <b41bc779-28e8-5a87-6f66-f5874dba8d1e@suse.de>
 <20171222105642.GD18255@piout.net>
 <CAL_JsqKKwDmq953x+0SnZ_u4T5kXyQza9rnEOzyyomSTmf7Hqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKKwDmq953x+0SnZ_u4T5kXyQza9rnEOzyyomSTmf7Hqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Philippe Ombredanne <pombredanne@nexb.com>, =?iso-8859-1?B?VPxyayw=?= Jan <Jan.Tuerk@emtrion.de>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, SZ Lin <sz.lin@moxa.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On 26/12/2017 at 11:16:34 -0600, Rob Herring wrote:
> On Fri, Dec 22, 2017 at 4:56 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > + Philippe
> >
> > On 22/12/2017 at 11:43:33 +0100, Andreas Färber wrote:
> >> >> I'll change it for v3 of this patch however it will end up like this:
> >> >> //SPDX-License...
> >> >
> >> > That should be /* SPDX-License */, // is for c files.
> >>
> >> Got any reference for that? Since we're using the C preprocessor before
> >> feeding them to dtc, we can use the same // style for both, builds fine.
> >>
> >> Only for my private DT overlay files that I use directly with dtc I
> >> couldn't adopt that style.
> 
> We are well past the point of being able to build most dts files with just dtc.
> 
> > The doc states:
> >
> > If a specific tool cannot handle the standard comment style, then the
> > appropriate comment mechanism which the tool accepts shall be used. This
> > is the reason for having the "/\* \*/" style comment in C header
> > files.
> >
> > I interpreted that as dtc doesn't handle // comments, use /**/
> 
> It's been so long, I'd forgotten that. Perhaps we should fix dtc to
> handle // comments.
> 

The would probably be the best solution so we get a somewhat consistent
style before people start moving the existing SDPX identifiers to the
top of their dtsi/dts files.

> >
> > But I agree it also states:
> > .dts{i}:          // SPDX-License-Identifier: <SPDX License Expression>
> 
> Or we could still change this. The guidelines aren't merged yet.
> 
> Rob

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
