From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] pinctrl: ns2: add pinmux driver support for
 Broadcom NS2 SoC
Date: Fri, 29 Apr 2016 10:40:59 +0200
Message-ID: <CACRpkdZb=jc8pAhxPWSF2nJnEeAU3JenTfNyZwZDrtgq4QoGsw@mail.gmail.com>
References: <CAL2FKYnJNVOcB7aYwkwRAGSq5ufg+CJowJCnzpBEYiTMev0B9A@mail.gmail.com>
	<dc5a5c07-7acd-ae28-cf5c-187d58de64c9@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dc5a5c07-7acd-ae28-cf5c-187d58de64c9-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2016 at 8:24 PM, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 4/17/2016 8:34 PM, Yendapally Reddy Dhananjaya Reddy wrote:

>>>
>>>         /* not all Iproc GPIO pins can be muxed individually */
>>>         if (!chip->pinmux_is_supported)
>>>                 return 0;
>
>
> NS2 does not support GPIO pins to be muxed individually. The call to
> iproc_gpio_request should be rejected for NS2 since
> 'chip->pinmux_is_supported' is false.

Aha, I see.

> since NS2 can only support group based GPIO configuration, the
> above functions will be rejected because "pinmux_is_supported" is false:
>
> chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
> "gpio-ranges");
>
> Here, "gpio-ranges" should never be defined on NS2 DT files.

Makes perfect sense.

So for this hardware, muxing will always be done orthogonally
(using some pinctrl hogs or similar for GPIO).

I'm waiting for a version fixing the bool Kconfig issue, then I guess
the driver is ready for inclusion.

Yours,
Linus Waleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
