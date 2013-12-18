From: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/6] pinctrl: Add pinctrl binding for Broadcom Capri
 SoCs
Date: Tue, 17 Dec 2013 18:02:07 -0800
Message-ID: <52B1021F.2010708@broadcom.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>	<1386787041-6035-1-git-send-email-syin@broadcom.com>	<1386787041-6035-5-git-send-email-syin@broadcom.com>	<CACRpkdY7s+eUFkg0AsaN5B9-1y_mTJ29Y-D9CkRG2GQ3JshP+w@mail.gmail.com>	<52ABB150.1030702@broadcom.com> <CACRpkdZ5Cxii48CsVJzEaBhvZOs8JCcR_hJV=RczhHbW4aqG-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ5Cxii48CsVJzEaBhvZOs8JCcR_hJV=RczhHbW4aqG-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbn?= =?ISO-8859-1?Q?er?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13-12-16 05:17 AM, Linus Walleij wrote:
> On Sat, Dec 14, 2013 at 2:16 AM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>
>>>> +- bias-pull-up:                        Integer. Pull up strength in Ohm:
>>>> +                                       1: 1.2 kOhm
>>>> +                                       2: 1.8 kOhm
>>>> +                                       3: 720 Ohm
>>>> +                                       4: 2.7 kOhm
>>>> +                                       5: 831 Ohm
>>>> +                                       6: 1.08 kOhm
>>>> +                                       7: 568 Ohm
>>>
>>>
>>> Please do not use these custom enumerators 1 thru 7.
>>> Instead say that the argument is given in ohms, so for
>>> example:
>>>
>>> bias-pull-up = <12000>;
>>>
>>> Then translate this into the proper enumerator in your
>>> driver instead.
>>
>> Ok.  The 3 bits in this enumeration correspond to enabling the 3 pull up Rs
>> (1.2k, 1.8k, 2.7k) in parallel, so the enum kind of make sense. But sure I
>> can change it to actual ohms and will error out in the driver if specified
>> value is not one of the 7.
>
> Aha, that's how they do it :-)
>
> Please write this in a comment in the driver because it makes
> it a lot easier to understand what is going on, and e.g. how to
> fuzz an apropriate resistance.

Yes, I plan to explain where those odd numbers come from in this file.

> Can you tell me something about how such resistors are produced
> in silicon?

Sorry I'm not quite sure.  I only know a little bit of the circuitry 
down to the schematic level...

Regards,
Sherman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
