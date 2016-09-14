From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 4/7] palmetto: Request relevant mux functions in devicetree
Date: Wed, 14 Sep 2016 10:29:07 +0930
Message-ID: <CACPK8XdskPDwnuMVx7xU6rNWn+o-s17FZ3=VQAK1mu4kkfctMA@mail.gmail.com>
References: <20160830075600.11559-1-andrew@aj.id.au> <20160830075600.11559-5-andrew@aj.id.au>
 <CACPK8Xe-dowcwXkO8rDH2reMzGadUMSq5ZtV=23FP4virt+DUQ@mail.gmail.com> <1473800295.8689.295.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473800295.8689.295.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 6:28 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Tue, 2016-09-13 at 22:11 +0930, Joel Stanley wrote:
>> It's not clear that all systems use these pins in that way. I will
>> not
>> include this one for now.
>
> Well, it has VGA so the VGA hsync, vsync and DDC should be there at
> least...

True. When we enable VGA in our tree these pins will be requested as
part of the VGA driver's device node, so they don't need to be hogged
by the pinctrl node like this.

The ones I'm not clear on are bmc_flack and bmc_int. Andrew, do you
have a recommendation here?

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
