From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from
 bcm283x.dtsi
Date: Thu, 18 Aug 2016 11:23:49 +0100
Message-ID: <20160818102349.GC27045@leverpostej>
References: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
 <20160803144858.GA29054@leverpostej>
 <1470739709.4745.23.camel@hellion.org.uk>
 <1471504916.6295.32.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471504916.6295.32.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2016 at 08:21:56AM +0100, Ian Campbell wrote:
> On Tue, 2016-08-09 at 11:48 +0100, Ian Campbell wrote:
> > On Wed, 2016-08-03 at 15:48 +0100, Mark Rutland wrote:
> > > 
> > > > [...]Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > 
> > > I also don't have the relevant hardware to test with, but this
> > looks
> > > generally like the right thing. So FWIW:
> > > 
> > > Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > 
> > Thanks (and Stefan too).
> > 
> > I think these things generally go via the arm-soc tree? Arnd & Olaf,
> > would it be possible to get this fix in for rc2 please (or in any event
> > for 4.8). Although it's an external tree I believe build breakage in
> > the split-out DT git repo is worth addressing.
> 
> This change doesn't appear to be in either v4.8-rc2, Linus' tree nor in
> the arm-soc tree that I can see. So, ping?
> 
> Or am I barking up the wrong tree pointing this patch towards arm-soc
> (via arm@k.o)?

That's the right place.

The best thing to do would be to resend the patch, with all tags
accumulated, with arm-soc, Arnd, and Olof in the To line (rather than
Cc'd), so it's clear they need to action it.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
