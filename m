From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Mon, 13 Mar 2017 23:33:14 +0100
Message-ID: <20170313223314.GB14183@lunn.ch>
References: <20170311121453.18534-1-zajec5@gmail.com>
 <20170312171032.GK15842@lunn.ch>
 <437d898d-b0f4-a4b5-cb51-8ea88ba7a35a@milecki.pl>
 <20170313191416.GB10397@lunn.ch>
 <89081716-c0e3-236f-4291-e700dbedbd34@milecki.pl>
 <CAC3K-4oVhvZbeUFnBWRjc8rLHyipS1KDHX+r_2-AkkY0qZETvA@mail.gmail.com>
 <ef756112-d8a0-b7c0-1e13-29ea49ceb4c9@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ef756112-d8a0-b7c0-1e13-29ea49ceb4c9-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Cc: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 10:37:11PM +0100, Rafa?? Mi??ecki wrote:
> On 03/13/2017 08:27 PM, Jon Mason wrote:
> >On Mon, Mar 13, 2017 at 3:15 PM, Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org> wrote:
> >>On 03/13/2017 08:14 PM, Andrew Lunn wrote:
> >>>
> >>>On Mon, Mar 13, 2017 at 07:48:26PM +0100, Rafa?? Mi??ecki wrote:
> >>>>
> >>>>On 03/12/2017 06:10 PM, Andrew Lunn wrote:
> >>>>>>
> >>>>>>+       chosen {
> >>>>>>+               bootargs = "console=ttyS0,115200 earlycon";
> >>>>>
> >>>>>
> >>>>>Using bootargs to pass the serial settings has been deprecated for a
> >>>>>while. Please use stdout-path instead.
> >>>>
> >>>>
> >>>>I tried following patch with my SR400ac (I put Archer C5 aside for now).
> >>>
> >>>
> >>>Hi Rafael
> >>>
> >>>Take a look at for example the bcm911360k.dts
> >>>
> >>>        aliases {
> >>>                serial0 = &uart3;
> >>>        };
> >>>
> >>>        chosen {
> >>>                stdout-path = "serial0:115200n8";
> >>>        };
> >>>
> >>>You need an alias to the serial device you want to us, and you should
> >>>list the speed, parity, bits etc.
> >>
> >>
> >>That was actually my first try (just with s/uart3/uart0) and I got the same
> >>problem.
> >
> >I have a similar line in the bcm953012k.dts, and the serial there works for me.
> 
> Well, the serial seems to work OK (I'm getting boot log & I can see my chars
> being echoed back). I just can't log in. Can this kernel change somehow affect
> user space?

Yes, it can. You probably don't have a getty running on ttyS0. But you
do have on /dev/console? Look in /etc/inittab.

   Andrew 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
