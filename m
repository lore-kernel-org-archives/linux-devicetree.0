From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: adc: Add Renesas GyroADC bindings
Date: Mon, 23 Jan 2017 21:41:29 +0100
Message-ID: <CAMuHMdUVwQoqQbrsGtbvxK9PoHae3n=UuJYijTMToUsdc=8=mQ@mail.gmail.com>
References: <20170121144212.8858-1-marek.vasut@gmail.com> <20170123170827.tkatb2aizjhbfifo@rob-hp-laptop>
 <63b3660b-6ce0-134c-ef79-c06430c735c5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63b3660b-6ce0-134c-ef79-c06430c735c5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Mon, Jan 23, 2017 at 8:56 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/23/2017 06:08 PM, Rob Herring wrote:
>> On Sat, Jan 21, 2017 at 03:42:11PM +0100, Marek Vasut wrote:
>>> new file mode 100644
>>> index 000000000000..081947367135
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt

>>> +Required properties:
>>> +- compatible:       Should be "renesas,<chip>-gyroadc", "renesas,rcar-gyroadc".
>>
>> Need to enumerate <chip>.
>
> It's enumerated below , the only special-case we handle at this point is
> the r8a7792 , which has extra interrupt block which we don't use anyway,
> but the driver disables those interrupts.

It is not enumerated below. You just give an example for r8a7791.

Please list all supported/tested compatible values, so checkpatch
can validate compatible values in DTS patches adding GyroADC device
nodes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
