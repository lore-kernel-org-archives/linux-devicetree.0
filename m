From: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
Subject: Re: [PATCH v2 0/2] pinctrl: Allow indicating loss of state across
 suspend/resume
Date: Fri, 3 Nov 2017 10:37:07 +0000
Message-ID: <20171103103707.3e5wb3c7foxbuvvg@localhost.localdomain>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102231551.16220-1-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 02, 2017 at 04:15:49PM -0700, Florian Fainelli wrote:
> Hello Linus,
> 
> It's me again, so I have been thinking about the problem originally
> reported in: [PATCH fixes v3] pinctrl: Really force states during suspend/resume
> 
> and other similar patches a while ago, and this new version allows a platform
> using pinctrl-single to specify whether its pins are going to lose their state
> during a system deep sleep.
> 
> Note that this is still checked at the pinctrl_select_state() because consumers
> of the pinctrl API might be calling this from their suspend/resume functions
> and should not have to know whether the provider does lose its pin states.
> 

Still feels to me like it should be the providers job to the
restore the state rather than expecting the consumer to
re-request any state it had. But lets wait and see what Linus
thinks.

Also not sure if you have seen this chain, but probably worth a
look:

https://www.spinics.net/lists/devicetree/msg200649.html

It is adding support to the GPIO code for controllers that can
have options to retain state across reset, not the same but
probably at least slightly related to this series.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
