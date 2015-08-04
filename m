From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3] ARM: shmobile: silk: initial device tree
Date: Tue, 4 Aug 2015 09:53:41 +0900
Message-ID: <20150804005341.GB16257@verge.net.au>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
 <2360526.88foRQAOiM@wasted.cogentembedded.com>
 <CAMuHMdWT=nzsFuM-vfe5GoAtDE-AtW4LAZoEnBGGVZm54-mAzg@mail.gmail.com>
 <55BF8522.1010906@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55BF8522.1010906@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 03, 2015 at 06:13:38PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 08/03/2015 04:00 PM, Geert Uytterhoeven wrote:
> 
> >>--- /dev/null
> >>+++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
> >>@@ -0,0 +1,51 @@
> 
> >>+/ {
> >>+       model = "SILK";
> >>+       compatible = "renesas,silk", "renesas,r8a7794";
> 
> >WARNING: DT compatible string "renesas,silk" appears un-documented --
> >check ./Documentation/devicetree/bindings/
> 
> >Do you plan to update Documentation/devicetree/bindings/arm/shmobile.txt?
> 
>    No, I had no idea I should record the board names somewhere too...

Sergei, please submit a parch as suggested by Geert.
