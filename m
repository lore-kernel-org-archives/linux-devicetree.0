From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: l2c: cache size parsing through device tree
Date: Fri, 22 Aug 2014 18:59:58 -0700
Message-ID: <CAGVrzcZm9Qktj9wDM5XG8zE=bY7FYF3V5ns3NPY7nCxbSpEckw@mail.gmail.com>
References: <1407972571-8986-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407972571-8986-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-08-13 16:29 GMT-07:00 Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi all,
>
> This patch series adds support for specifying the L2 cache size through Device
> Tree using the ePAPR standard 'cache-size' and 'cache-sets' properties.
>
> The rationale behind these patches is to support Broadcom's BCM63138 DSL SoC
> which comes out of reset with an invalid cache way-size specified in its L2C
> auxiliary register.
>
> For the third patch I took the approach of a helper function that can be called
> by the 3 different of_parse functions that we have currently.

Russell, does that look like what you had in mind? Thank you!

>
> Thanks!
>
> Florian Fainelli (3):
>   ARM: l2c: enforce use of cache-level property
>   ARM: l2c: order optional properties in alphabetical order
>   ARM: l2c: parse 'cache-size' and 'cache-sets' properties
>
>  Documentation/devicetree/bindings/arm/l2cc.txt |  4 +-
>  arch/arm/mm/cache-l2x0.c                       | 68 ++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>
> --
> 1.9.1
>



-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
