From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Tue, 13 Nov 2012 14:13:45 +0100
Message-ID: <CACRpkdZqAbRsvKEqTHNsZGsZO0KEMS1RyLtxujjdo8Xw59xnDA@mail.gmail.com>
References: <38620644.IyR5R8rjKP@percival>
	<1801189.6J3flQFRCq@percival>
	<CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A@mail.gmail.com>
	<1503934.I4tc7K6I6s@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503934.I4tc7K6I6s@percival>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2012 at 7:23 AM, Alex Courbot <acourbot@nvidia.com> wrote:
> On Thursday 08 November 2012 05:24:19 Linus Walleij wrote:
>> On Tue, Nov 6, 2012 at 2:33 AM, Alex Courbot <acourbot@nvidia.com> wrote:
>> > How about, in a first time (and because I'd also like to get the power
>> > seqs
>> > moving on), a typedef from int to gpio_handle_t and a first implementation
>> > of the gpio_handle_*() API that would just call the existing
>> > integer-based API (apart from gpio_handle_get())? That way things will
>> > not break when we switch to a real handle.
>>
>> I'm afraid of typedef:ing gpio_handle_t to int because it sort of
>> encourages non-handlers to be used mixed with the old integers.
>>
>> I would prefer to create, e.g. in <linux/gpio/consumer.h>
>> something like:
>>
>> struct gpio;
>>
>> struct gpio *gpio_get(struct device *dev, const char *name);
>>
>> int gpio_get_value(struct gpio *g);
>>
>> Nothing more! I.e. struct gpio is an opaque cookie, nothing to be known
>> about it.
>
> However these is already a struct gpio declared in linux/gpio.h. Shall the
> opaque handler be renamed something like "struct gpioh", or is your idea to
> make both APIs mutually exclusive?

Basically I'd like the API's to be mutually execlusive.

But maybe there is a namespace clash anyway, since the
handler code will have to #linclude <linux/gpio.h>

This is one of the rare cases where I'd maybe like to
even #undef gpio in the core code just to be able to
mask that defintion of "gpio" with the "gpio" from the
new API.

I really like the fact that it will bite your hand if you try
to use both APIs at once, you could even introduce some

#define DO_NOT_INCLUDE_LINUX_GPIO_H
in <linux/gpio/consumer.h>

And
#define DO_NOT_INCLUDE_GPIO_CONSUMER_H
in <linux/gpio.h>

and then put things like:

#ifdef DO_NOT_INCLUDE_LINUX_GPIO_H
#error "Trying to use mutually exclusive interfaces"
#endif

into <linux/gpio.h>...

Yours,
Linus Walleij
