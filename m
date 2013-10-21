From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] ARM: imx6qdl: provide pinctrl configurations for
 DAT3 pull-down
Date: Mon, 21 Oct 2013 08:46:12 +0800
Message-ID: <20131021004610.GB17165@S2101-09.ap.freescale.net>
References: <20131005112147.GX12758@n2100.arm.linux.org.uk>
 <E1VSPw9-0004Ug-BF@rmk-PC.arm.linux.org.uk>
 <20131007055340.GB3739@S2101-09.ap.freescale.net>
 <20131007180357.GS12758@n2100.arm.linux.org.uk>
 <20131008015426.GA7480@S2101-09.ap.freescale.net>
 <52537378.1020904@wwwdotorg.org>
 <20131008034048.GB7480@S2101-09.ap.freescale.net>
 <20131008090015.GC25034@n2100.arm.linux.org.uk>
 <20131019150556.GI25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131019150556.GI25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 19, 2013 at 04:05:56PM +0100, Russell King - ARM Linux wrote:
> I can't find what the result of this discussion was, but from what I
> remember, we decided that we weren't going to do this override thing,
> and instead we were going to separate out the configuration of DAT3.
> 
> Who's going to do that?

I'm going to do that.  Thanks for reminding :)

Shawn

> I'd rather not, because it means editing
> quite a number of DT files which I have no way to test, and the
> chances of messing this up are quite high.  I've already developed
> a deep seated hatred for DT in general through my involvement with
> IMX, particularly how it's very easy to make an undetected mistake
> and then spend hours debugging it.
> 
> Until this is resolved, I'm sticking with my own method of redefining
> the entire pinctrl set for DAT3 pull-down, which I've tested as working.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
