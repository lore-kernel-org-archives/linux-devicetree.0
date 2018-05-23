From: M P <buserror@gmail.com>
Subject: Re: [PATCH v6 4/6] ARM: dts: Renesas RZ/N1 SoC base device tree file
Date: Wed, 23 May 2018 12:53:36 +0100
Message-ID: <CAMMfpEwyLh+1hxCE-Ka0f5hoCi8QfO5an9zvZ3nH6j0=aJ6K=A@mail.gmail.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com>
 <1526983321-41949-5-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdXETt75rGyYRsNEK0O5CO3A-bG70g=-f23y6PO_uK6rWg@mail.gmail.com>
 <CAMMfpEw=6POaZBU9HduKBb8Wk2mH0oAXhCdQo7c+hQWgxka3vA@mail.gmail.com> <CAMuHMdXumeXLw_MAz5MVOKZYO3-F5samUGLSZN7bHSnmD6sfnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXumeXLw_MAz5MVOKZYO3-F5samUGLSZN7bHSnmD6sfnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: michel.pollet@bp.renesas.com, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, buserror+upstream@gmail.com, Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wed, 23 May 2018 at 12:18, Geert Uytterhoeven <geert@linux-m68k.org>
wrote:

> Hi Michel,

> On Wed, May 23, 2018 at 11:20 AM, M P <buserror@gmail.com> wrote:
> > On Wed, 23 May 2018 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org>
> > wrote:
> >> On Tue, May 22, 2018 at 12:01 PM, Michel Pollet
> >> <michel.pollet@bp.renesas.com> wrote:
> >> > +       #address-cells = <1>;
> >> > +       #size-cells = <1>;
> >> > +
> >> > +       cpus {
> >> > +               #address-cells = <1>;
> >> > +               #size-cells = <0>;
> >> > +               clocks = <&clock RZN1_DIV_CA7>;
> >
> >> I think the clocks property should be moved to the individual CPU
nodes.
> >
> > Ah, I had a look around, and I found some instances that are in the cpu
> > sub-node, and others that are not -- it seems that having it in the cpu
> > sub-node would implies it's core specific... here if that clock is
changed
> > both cores would change speed...

> Assumed the driver code knows to look in the parent node, which I doubt
> the cpufreq code does.

> > Either way, it's not used by the kernel in any way at the moment -- I
had
> > hoped cpufreq or something would claim it, but it's not the case.

> I guess you have to add your main SoC compatible value to the whitelist
> in drivers/cpufreq/cpufreq-dt-platdev.c first.

Most excellent tip here -- I'll add a further patch to enable this, after
this series eventually gets merged...

Cheers,
Michel
