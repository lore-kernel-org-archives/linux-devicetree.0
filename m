From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: renesas: h3ulcb: initial device tree
Date: Fri, 22 Jul 2016 10:54:11 +0900
Message-ID: <20160722015411.GG21943@verge.net.au>
References: <1469103962-20378-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1469104067-20451-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <20160721171458.GH20559@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160721171458.GH20559@leverpostej>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, Jul 21, 2016 at 06:14:58PM +0100, Mark Rutland wrote:
> On Thu, Jul 21, 2016 at 03:27:47PM +0300, Vladimir Barinov wrote:
> > Add the initial device tree for the R8A7795 SoC based H3ULCB low cost
> > board.
> > 
> > This commit supports the following peripherals:
> > - SCIF (console), Ethernet, SD, USB Host, Audio, GPIO LEDs
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile           |   2 +-
> >  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 326 +++++++++++++++++++++++++
> >  2 files changed, 327 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index 17139f7..eb72830 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -1,4 +1,4 @@
> > -dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb
> > +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
> >  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb
> >  
> >  always		:= $(dtb-y)
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> > new file mode 100644
> > index 0000000..e4400fb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> > @@ -0,0 +1,326 @@
> > +/*
> > + * Device Tree Source for the H3ULCB board
> > + *
> > + * Copyright (C) 2016 Renesas Electronics Corp.
> > + * Copyright (C) 2016 Cogent Embedded, Inc.
> > + *
> > + * This file is licensed under the terms of the GNU General Public License
> > + * version 2.  This program is licensed "as is" without any warranty of any
> > + * kind, whether express or implied.
> > + */
> > +
> > +/*
> > + * SSI-AK4613
> > + *
> > + * This command is required when Playback/Capture
> > + *
> > + *	amixer set "DVC Out" 10%
> > + *	amixer set "DVC In" 10%
> > + */
> 
> I don't think this comment belongs here. It has nothing to do with the
> DT as such.
> 
> Why is this necessary? Is this a bug?

For historical reasons the mixer settings required to get functional sound
have been documented in DT files. The above is in keeping with that.

Personally I find this quite helpful but I think it would be at least as
helpful documented on elinux.org or somewhere similar. So I would not
object to it being omitted from here and consideration given to removing it
from other Renesas DT files.
