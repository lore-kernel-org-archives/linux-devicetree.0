From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Tue, 3 Feb 2015 09:36:10 +0900
Message-ID: <20150203003610.GA17629@verge.net.au>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
 <1608366.HtA9yBksdO@wasted.cogentembedded.com>
 <20150202110557.GC7459@leverpostej>
 <54CFE4CE.5090406@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54CFE4CE.5090406@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 02, 2015 at 11:57:50PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 02/02/2015 02:05 PM, Mark Rutland wrote:
> 
> >>Add the initial device tree for the R8A7794 SoC based SILK low cost board.
> >>SCIF2 serial port support is included, so that the serial console can work.
> 
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> [...]
> 
> >>Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
> >>===================================================================
> >>--- /dev/null
> >>+++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
> >>@@ -0,0 +1,41 @@
> >>+/*
> >>+ * Device Tree Source for the SILK board
> >>+ *
> >>+ * Copyright (C) 2014 Renesas Electronics Corporation
> >>+ * Copyright (C) 2014-2015 Renesas Solutions Corp.
> >>+ * Copyright (C) 2014-2015 Cogent Embedded, Inc.
> >>+ *
> >>+ * This file is licensed under the terms of the GNU General Public License
> >>+ * version 2.  This program is licensed "as is" without any warranty of any
> >>+ * kind, whether express or implied.
> >>+ */
> >>+
> >>+/dts-v1/;
> >>+#include "r8a7794.dtsi"
> >>+
> >>+/ {
> >>+	model = "SILK";
> 
> >Shouldn't that have a "Renesas" prefix or something like that?
> 
>    Historically. no SH-Mobile .dts has used the vendor name in the "model"
> prop. I defer the decision to Simon but I think we should be at least
> consistent.

They are also my thoughts (except the bit about deferring to myself).

If there is a good motivation for a Renesas prefix then that is fine by me.
But in that case it seems that it would be appropriate to update
the existing renesas boards too.

The only thing that stood out to me about "SILK" was that unlike
other renesas boards names in .dtsi files it is all-capitals.
Its not a bit deal but as we are on the topic: is that intentional?

> >It's unlikely that there will be another board called "SILK", but it
> >does make it hard for someone to get an idea of what the board is from
> >the model string alone.
> 
>    Tend to agree here.
> 
> >Mark.
> 
> WBR, Sergei
> 
