From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/13] Documentation: add BCM6328 pincontroller binding documentation
Date: Mon, 22 Aug 2016 14:51:37 +0200
Message-ID: <CACRpkdYd8k2WDs7Zkn3O1W9roHeFVTHyzEkLgpgrVBm_gijmQA@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-3-git-send-email-jonas.gorski@gmail.com>
 <20160819141436.GA6970@rob-hp-laptop> <CAOiHx=mLgZ6Q3tBY3zYkCpMX09Kv54OQQoAXAdP16D_xoXO3mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=mLgZ6Q3tBY3zYkCpMX09Kv54OQQoAXAdP16D_xoXO3mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 4:30 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 19 August 2016 at 16:14, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

>>> +pinctrl: pin-controller@10000080 {
>>> +     compatible = "brcm,bcm6328-pinctrl";
>>> +     reg = <0x10000080 0x8>,
>>> +           <0x10000088 0x8>,
>>> +           <0x10000098 0x4>,
>>> +           <0x1000009c 0xc>;
>>> +     reg-names = "dirout", "dat", "mode", "mux";
>>
>> What's in the holes? Just do one range or perhaps this should be part of
>> some larger block.
>
> For this particular SoC it's SPI Slave Config; Registers found in the
> holes on other SoCs:
>
> * TestControl
> * OscControl (just the name, no other documentation what it does)
> * Switch LED control (for integrated switches)
> * Legacy LED controller
> * Reset Controller for the VDSL PHY
>
> And there are also usually quite a few other registers on this block.
> This seems to have been treated as a "GPIO and everything else that
> isn't large enough for its own block" by Broadcom - with BCM6328/6362
> they even introduced a "MISC" block then.

What I would do myself is to put a syscon over this node.

syscon: syscon@10000080 {
    compatible = "broadcom,foo", "syscon";
    reg = <0x10000000 0x100>;
(...)

Or however that looks.

Then use the generic GPIO syscon driver on top of this,
see drivers/gpio/gpio-syscon.c

That driver does not support any pincontrol/muxing but
is a good candidate to handle the GPIO portions.

Syscons are there to handle these composite "misc sys
regs" devices.

You can even spawn subdevices to it by adding the
compatible-string "mfd-simple".

The rest of the subdevices would also have to be syscon
children.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
