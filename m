From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from device tree
Date: Tue, 12 Nov 2013 21:11:40 +0100
Message-ID: <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
	<20131112153057.GA9683@earth.universe>
	<CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
	<20131112200514.GA15413@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131112200514.GA15413-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 9:05 PM, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org> wrote:
> On Tue, Nov 12, 2013 at 06:06:49PM +0100, Linus Walleij wrote:

>> So this binding is documented for GPIO keys in:
>> Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
>>
>> This is probably the most used binding as GPIO matrixes are
>> not uncommon. But I don't know, yes it is a mess. (As usual.)
>
> I could find two boards using "gpio-matrix-keypad" in the mainline
> kernel and not a single instance of "linux,no-autorepeat":

In things connected to GPIO, I don't expect the in-kernel
device trees to be a good way so survey the usage of these
bindings. Anyone doing device trees on any system with a
few GPIOs can be using this.

But maybe we're lucky and won't break anyone's setup if
we change this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
