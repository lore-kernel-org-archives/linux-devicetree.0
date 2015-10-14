From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges property
Date: Wed, 14 Oct 2015 16:13:39 +0200
Message-ID: <5357564.jvp0TcMCq9@wuerfel>
References: <1444694045-22000-1-git-send-email-vz@mleia.com> <7163229.YtgKU9kxxJ@wuerfel> <561E619E.9020504@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561E619E.9020504-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 14 October 2015 17:07:26 Vladimir Zapolskiy wrote:
> On 14.10.2015 16:52, Arnd Bergmann wrote:
> > On Wednesday 14 October 2015 02:13:49 Vladimir Zapolskiy wrote:
> >> Ok, practically it should work for my purposes, but the change must be
> >> done along with added EMC device node description.
> >>
> >> I'm not so confident that it is correct to add description of static
> >> memory banks to ahb node though, please give me a short confirmation,
> > 
> > The DT should reflect whichever memory ranges are accessible
> > on the bus. I've looked up the memory map in the data sheet, and
> > I think a reasonable representation would be
> > 
> > /ahb {
> >       ranges = <0x20000000 0x20000000 0x10000000>, /* AHB port 5 */
> >                <0x30000000 0x30000000 0x10000000>, /* AHB port 6 */
> >                <0x40000000 0x40000000 0x10000000>, /* AHB port 7 */
> >                <0x80000000 0x80000000 0x40000000>, /* EMC DYCS0/1 */
> >                <0xE0000000 0xE0000000 0x04000000>; /* EMC CS0-3 */
> > 
> >       apb {
> >               ranges = <0x20080000 0x20080000 0x00020000>;
> >       };
> > 
> > };
> 
> A simpler version of this change in /ahb I successfully tested with EMC
> yesterday:
> 
> -               ranges = <0x20000000 0x20000000 0x30000000>;
> +               ranges = <0x20000000 0x20000000 0x30000000
> +                         0xe0000000 0xe0000000 0x04000000>;

Ok, but please write this as

               ranges = <0x20000000 0x20000000 0x30000000>,
                        <0xe0000000 0xe0000000 0x04000000>;

The binary is identical, it's just more structured.

> >> then I'll send a change for inclusion of EMC description -- the one
> >> above excluding clocks and clock-names properties, work on CCF is in
> >> progress.
> > 
> > Ah, very nice! That should get us very close to multiplatform support!
> > I've just tried building lpc32xx without the headers to check for
> > other issues, and ended up with the patch below to get it building.
> > It's clearly wrong, but it highlights a number of issues.
> 
> Sure, I'll review the highlighted problems, thanks.

Thanks!

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
