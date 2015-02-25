From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: r8a7794: add GPIO DT support
Date: Thu, 26 Feb 2015 00:10:38 +0200
Message-ID: <2384891.X25TSvzAnx@avalon>
References: <6954455.LyoCrfjM8R@wasted.cogentembedded.com> <2292882.LbM0mNWfOj@avalon> <CAMuHMdU9QD_4UOBPm850HtUPAOOEY4JA7cztpUyKSGog6VYUNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU9QD_4UOBPm850HtUPAOOEY4JA7cztpUyKSGog6VYUNA@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wednesday 25 February 2015 11:27:37 Geert Uytterhoeven wrote:
> On Wed, Feb 25, 2015 at 11:11 AM, Laurent Pinchart wrote:
> >> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
> >> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
> >> @@ -50,6 +50,90 @@
> >> 
> >> +     gpio1: gpio@e6051000 {
> >> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
> >> +             reg = <0 0xe6051000 0 0x50>;
> >> +             interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
> >> +             #gpio-cells = <2>;
> >> +             gpio-controller;
> >> +             gpio-ranges = <&pfc 0 32 32>;
> > 
> > This GPIO block has 26 GPIOs only.
> > 
> >> +     gpio5: gpio@e6055000 {
> >> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
> >> +             reg = <0 0xe6055000 0 0x50>;
> >> +             interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
> >> +             #gpio-cells = <2>;
> >> +             gpio-controller;
> >> +             gpio-ranges = <&pfc 0 160 32>;
> > 
> > This GPIO block has 28 GPIOs only.
> > 
> >> +     gpio6: gpio@e6055400 {
> >> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
> >> +             reg = <0 0xe6055400 0 0x50>;
> >> +             interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
> >> +             #gpio-cells = <2>;
> >> +             gpio-controller;
> >> +             gpio-ranges = <&pfc 0 192 32>;
> > 
> > This GPIO block has 26 GPIOs only.
> 
> I guess you hear me coming... r8a779[01].dtsi need to be fixed, too.

Yes. We're first investigating issues in the pfc driver and/or pinctrl core 
due to holes in GPIO banks pins though.

-- 
Regards,

Laurent Pinchart

