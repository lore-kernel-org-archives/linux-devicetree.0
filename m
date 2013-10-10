From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Thu, 10 Oct 2013 11:08:40 +0100
Message-ID: <20131010100840.GP25034@n2100.arm.linux.org.uk>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org> <CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com> <20131010072624.GA29191@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131010072624.GA29191-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2013 at 03:26:26PM +0800, Shawn Guo wrote:
> However, my patch is talking about a different thing.  For example, we
> have a device whose pinctrl-0 consists of two phandle entries that point
> to pin configuration nodes foo and bar.
> 
> 	pinctrl-0 = <&foo &bar>;
> 
> 	foo {
> 		...
> 	};
> 
> 	bar {
> 		...
> 	};
> 
> My patch only wants to make it clear that the configuration specified by
> node foo will be applied to pin controller first, and the configuration
> defined in node bar will be applied after that.  When both nodes have
> configuration for a pin, these two configs for the same pin go to two
> different pinctrl_setting structures.  And these two pinctrl_settings
> can not be applied accumulatedly but only sequentially.  That's what my
> patch talks about.

I still say this is a potentially dangerous thing, and in my case of
overriding the DAT3 pull-sense, it will cause the pin to glitch if
nothing is connected to it.

So even if you do get this clarified, I am *not* happy to change my
patch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
