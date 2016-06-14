From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
Date: Tue, 14 Jun 2016 09:43:17 +0900
Message-ID: <20160614004317.GC6456@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com>
 <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com>
 <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com>
 <20160610010245.GA10152@verge.net.au>
 <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8efb1c7e-5463-2556-744c-d327886d92d4-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 10:29:17PM +0300, Sergei Shtylyov wrote:
> On 06/10/2016 04:02 AM, Simon Horman wrote:
> 
> >>[...]
> >>
> >>>>>And that the system behaves sanely on suspend/resume.
> >>>>
> >>>>  I'd be thankful if you told me how to test that. :-)
> >>>
> >>>System suspend:
> >>>
> >>>   echo mem > /sys/power/state
> >>
> >>   Oh. I know that one! :-)
> >>
> >>>System resume: You're gonna need a "wakeup-source" in your DTS, e.g. gpio-keys.
> >>>Serial should work too, echo "enabled" to the corresponding wakeup
> >>>file in /sys first.
> >>
> >>   I'm afraid I couldn't find that file. All I saw were RPM controls...
> >>
> >>>In case of issues, try "echo 0 > /sys/module/printk/parameters/console_suspend".
> >>
> >>   There's no problems suspending, it's the resuming that's a problem for me.
> >>
> >>>Good luck!
> >>
> >>   As usual, there was no luck. :-)
> >>
> >>WBR, Sergei
> >
> >Does resume work for UP (i.e. without SMP)?
> 
>    No. My problem with resume is I can't wake up the remote system. I don't
> see the needed 'wakeup' file in
> /sys/devices/platform/soc/e6e60000.serial/...
>     However, if I enable CONFIG_PM_[ADVANCED_]DEBUG and do
> 
> $ echo -n core /sys/.power/pm_test
> 
> the system happily wakes up after a small delay (5 s), w/either SMP or UP kernel.

That seems promising but it seems curious that there is no wakeup file.

On Lager the following procedure works for me using
renesas-devel-20160613-v4.7-rc3 and shmobile defconfig.

0. Add wakeup-source property to serial@e6ce0000 node in DT
1. echo enabled > /sys/devices/platform/e6e60000.serial/tty/ttySC0/power/wakeup
2. echo mem > /sys/power/state
3. Provide input on serial console

* Success! *

> >How did testing CPU hotplug go? Did it work for all CPUs?
> 
>    Sure!

Great!

>    The only problem I'm seeing (again) is the RCAN clock failing to register:
> 
> rcar_gen2_cpg_clocks_init: failed to register cpg_clocks rcan clock (-12)
> 
>    I was going to look at it yesterday but (wrongly) thought it somehow
> cured itself... I'll look at it now.

Is this resolved? If not perhaps you could consider removing the node
in question for now.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
