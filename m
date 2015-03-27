From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: gpio-syscon for Keystone 2 - DT bindings mismatch code expectation?
Date: Fri, 27 Mar 2015 11:12:24 +0100
Message-ID: <CACRpkdYVkdLEEae8JHSsBEtMyhMx0yqN8RLhP2reoV+r5gA+JA@mail.gmail.com>
References: <20150323215545.GT8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150323215545.GT8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 10:55 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:

> Linus, Grygorii,
>
> I'm trying to understand what's happening to make Keystone2 print
> this at boot:
>
> gpio-syscon soc:keystone_dsp_gpio@02620240: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@2620244: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@2620248: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@262024c: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@2620250: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@2620254: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@2620258: can't read the dir register offset!
> gpio-syscon soc:keystone_dsp_gpio@262025c: can't read the dir register offset!

Grygorii are you looking into this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
