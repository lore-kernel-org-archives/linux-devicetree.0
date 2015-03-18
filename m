From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 6/8] pinctrl: cygnus: add gpio/pinconf driver
Date: Wed, 18 Mar 2015 02:39:21 +0100
Message-ID: <CACRpkdYhMw36xrqptbd8b7KpkVyrZMW_nkxQTPcGkQvt3z3w=Q@mail.gmail.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
	<1425933902-20652-7-git-send-email-rjui@broadcom.com>
	<CACRpkdZ1ErfikdF41aANTM-7LE6AExizHtCZTq1_TTxwYjeSQA@mail.gmail.com>
	<54FF306C.7020407@broadcom.com>
	<CACRpkdZbxTyYWpxWCmdN8a7p+MjcUo6UxEwfgStPWsNzf4NZ=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZbxTyYWpxWCmdN8a7p+MjcUo6UxEwfgStPWsNzf4NZ=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback->
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 10:15 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Mar 10, 2015 at 6:57 PM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> On 3/10/2015 3:20 AM, Linus Walleij wrote:
>>> On Mon, Mar 9, 2015 at 9:45 PM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>>> This adds the initial support of the Broadcom Cygnus GPIO/PINCONF driver
>>>> that supports all 3 GPIO controllers on Cygnus including the ASIU GPIO
>>>> controller, the chipCommonG GPIO controller, and the always-on GPIO
>>>> controller. Basic PINCONF configurations such as bias pull up/down, and
>>>> drive strength are also supported in this driver.
>>>>
>>>> Pins from the ASIU GPIO controller can be individually muxed to GPIO
>>>> function, through interaction with the Cygnus IOMUX controller
>>>>
>>>> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Tested-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>
>>> Patch applied! But please look at this:
>>>
>>>> +#include <linux/gpio.h>
>>>
>>> Doesn't just #include <linux/gpio/driver.h> work?
>>>
>>
>> I think I need linux/gpio.h for gpiochip_add_pin_range and some related
>> APIs.
>
> OK you're right ... I need to fix this.

I sent a patch fixing this now... hope it will work.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
