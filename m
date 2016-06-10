From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
Date: Fri, 10 Jun 2016 10:02:45 +0900
Message-ID: <20160610010245.GA10152@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com>
 <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com>
 <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 11:58:45PM +0300, Sergei Shtylyov wrote:
> On 06/07/2016 10:13 AM, Geert Uytterhoeven wrote:
> 
> [...]
> 
> >>>And that the system behaves sanely on suspend/resume.
> >>
> >>   I'd be thankful if you told me how to test that. :-)
> >
> >System suspend:
> >
> >    echo mem > /sys/power/state
> 
>    Oh. I know that one! :-)
> 
> >System resume: You're gonna need a "wakeup-source" in your DTS, e.g. gpio-keys.
> >Serial should work too, echo "enabled" to the corresponding wakeup
> >file in /sys first.
> 
>    I'm afraid I couldn't find that file. All I saw were RPM controls...
> 
> >In case of issues, try "echo 0 > /sys/module/printk/parameters/console_suspend".
> 
>    There's no problems suspending, it's the resuming that's a problem for me.
> 
> >Good luck!
> 
>    As usual, there was no luck. :-)
> 
> WBR, Sergei

Does resume work for UP (i.e. without SMP)?

How did testing CPU hotplug go? Did it work for all CPUs?

If things work less well for SMP than UP I am inclined to ask
you to defer adding SMP support.
