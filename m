From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from bcm283x.dtsi
Date: Fri, 09 Sep 2016 17:47:56 +0200
Message-ID: <5852905.snAkjWmlVZ@wuerfel>
References: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk> <7746678.0mZLVD2k0J@wuerfel> <1473432356.28111.60.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473432356.28111.60.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, September 9, 2016 3:45:56 PM CEST Ian Campbell wrote:
> On Tue, 2016-08-23 at 12:09 +0200, Arnd Bergmann wrote:
> > I had skipped the new message as well while sorting through 5000
> > messages after my vacation, but I've now put it into my TODO folder
> > and will get to it eventually.
> 
> Is it still on your TODO or should I do...
>
> > We sometimes miss stuff that is meant for arm-soc when it comes
> > from people that don't normally send us patches. If you want to
> > be sure to catch the attention, stick a 'GIT PULL' into the subject
> > or send a ping on IRC.
> 
> ... one of these?
> 
> It'd be great to get this fixed in v4.8 so that the corresponding
> device-tree.git tag will build.

Oh, it ended  up in my v4.9-todo folder, not 4.8, I misunderstood
the urgency, sorry.

I've applied it to the fixes branch now.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
