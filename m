From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 0/7] aspeed: Integrate pinctrl and gpio drivers
Date: Tue, 13 Sep 2016 22:14:33 +0930
Message-ID: <CACPK8XdM9V=7tqbu_MYR8=LApCN8s+3dav=E6mck6ixU8PhA9A@mail.gmail.com>
References: <20160830075600.11559-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160830075600.11559-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 5:25 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> Here's v3 of the Aspeed pinctrl and gpio driver integration patches. v2 of the
> integration series can be found at:
>
>   https://lkml.org/lkml/2016/8/19/403

Looks good to me. I commented on the two patches that I don't think we
want to include. If you're happy with that I will send a tree to Arnd.

Arnd, the pinctrl driver is staged for 4.9. We're adding the symbol to
arch/arm/mach-aspeed, so the tree I send will have a dependency on the
pinctrl tree. How do I proceed in this case?

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
