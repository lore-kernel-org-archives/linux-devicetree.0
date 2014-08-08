From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/8] pinctrl: add driver for MB86S7x
Date: Fri, 8 Aug 2014 14:42:21 +0200
Message-ID: <CACRpkdb_8HBzLUKedZKwPxDZ8TQiNMs5QV_eFfkqD=-9TTK55w@mail.gmail.com>
References: <1405233067-4725-1-git-send-email-mollie.wu@linaro.org>
	<CACRpkdb_NC7j=XkbMPv8YYLSeEd1AOpFqmD8x+ohC7ds3cPCfg@mail.gmail.com>
	<CAJe_Zhc2gz8DZjzo-4YAucAZ2P=UamZ2MtTP1fHmxC0vspZJDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_Zhc2gz8DZjzo-4YAucAZ2P=UamZ2MtTP1fHmxC0vspZJDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 24, 2014 at 8:04 PM, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 22 July 2014 21:41, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Sun, Jul 13, 2014 at 8:31 AM, Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>>> +               if (pchip->pin_busy[p + 3]) {
>>> +                       pr_err("%s:%d:%d %d busy\n",
>>> +                              __func__, __LINE__, pins[i], p+3);
>>> +                       goto busy_exit;
>>> +               }
>>
>> I don't understand this either.
>>
>> Why all this fuzz around the four pins from p ... p+3?
>>
> Pinctrl exposes each pin individually, but the controller clubs 4 pins
> together to work in same mode... so we have to reject any attempt to
> change mode of a pin if any other pin in the same group [p,.. p+3] is
> already taken by some user and is in a different mode i.e, busy. And
> no, we can't expose each group of 4 as a 'virtual' pin because some
> groups serve to 2 different IPs.

OK I get it now I think, seems valid.

>>> +               pr_debug(" %d", p);
>>> +               pchip->pin_busy[p] = true;
>>
>> So I'm questioning this....
>>
>>> +               if (p < PINS_VIRT) /* Not for virtual pins */
>>
>> We need an explanation somewhere about what "virtual pins"
>> means in this driver, I have never seen that before.
>>
> Now, these are really 'virtual' :)
> The registers for physically individual pins are uniformly spaced and
> we can compact the offsets with simple math.
> However for some peripherals like PCI, USB etc, the pins are all tied
> together as one 'virtual' pin. To reuse the same math to calculate
> offsets, we assign virtual numbers to these virtual pins, assuming
> 'holes' wherever necessary.

Aha. OK, well I guess readability is paramount, the scheme
you come up with is likely to stick so make sure that whatever
way it works is very clear and documented so others can follow
the example later on.

>>> +MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
>>
>> "fujitsu" does not seem to exist in
>> Documentation/devicetree/bindings/vendor-prefixes.txt
>> Do you want to add it?
>>
> Yup, in a later patch of this set :)

OK thanks. Dunno if there is already some v2 in my inbox, I've
got some stuff to process...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
