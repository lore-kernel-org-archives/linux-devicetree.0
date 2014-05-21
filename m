From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/10] irqchip: versatile-fpga: add pass-thru enable support
Date: Wed, 21 May 2014 10:35:38 -0500
Message-ID: <CAL_JsqJHernZ08vF6_a=Vz41dm1aAo7vZcK+G3pvVYhB7ytP9Q@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-4-git-send-email-robherring2@gmail.com>
	<20140521014146.GG8664@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140521014146.GG8664-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 8:41 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> Rob,
>
> On Tue, May 20, 2014 at 04:09:29PM -0500, Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Set the PIC_ENABLES register when the passthru-mask property is present.
>> This enables interrupts on the secondary controller to be passed thru
>> directly to the primary controller.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>> ---
>>  drivers/irqchip/irq-versatile-fpga.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>
> Patches 3 and 4 are good to go.  Shall I take them, or are they a
> depended on by later patches?

Thanks. There are dependencies, so I plan to send it all thru arm-soc.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
