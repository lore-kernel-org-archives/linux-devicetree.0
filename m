From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: GPIO: Add gpio-initval
Date: Wed, 18 Nov 2015 11:20:15 +0100
Message-ID: <CACRpkdZFwdG7vGVncF9Y=sbpP0vhnU_EfLanTNL=HfU71gRNKw@mail.gmail.com>
References: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
	<1447754878-21099-2-git-send-email-mpa@pengutronix.de>
	<20151117203542.GA7091@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151117203542.GA7091@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 9:35 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Nov 17, 2015 at 11:07:57AM +0100, Markus Pargmann wrote:
>> Add a binding for GPIO initialization.
>
> Some comments, but they are really more on the gpio hog. I must have
> missed them.

They are already merged, and in use :(

>> +Optional properties:
>> +- line-name:  The GPIO label name. If not present the node name is used.
>
> We already have "label" for this purpose.

I would rather say we already have another instance of "line-name"
for this purpose. See
Documentation/devicetree/bindings/gpio/gpio.txt

"label" was not chosen because it's a Linuxism (that is what the internal
API is using) and not to the point.

I like the clear "line" specifier over "pin" etc since GPIOs can be
chip-internal and what not.

>> + The following two options are mutually exclusive. One of them should be
>> + specified, but not both:
>> +- gpio-hog:   A property specifying that this child node represent a GPIO hog.
>> +- gpio-initval: This GPIO should be initialized to the specified configuration.
>> +
>> + The following three options are mutually exclusive. They change the setting of
>> + the GPIO pin. One of them should be specified:
>>  - input:      A property specifying to set the GPIO direction as input.
>>  - output-low  A property specifying to set the GPIO direction as output with
>>             the value low.
>>  - output-high A property specifying to set the GPIO direction as output with
>>             the value high.
>
> If they are mutually exclusive, then it should just be one property with
> values. That is much more simple to validate.
>
> But none of this is really even needed. We can do all this with existing
> bindings. Most gpio controllers use 2 cells and the 2nd cell was
> reserved for something like this. Simply adding a -gpios property in the
> gpio controller node would do the job:
>
> init-gpios = <&self n (GPIO_ACTIVE_HIGH | GPIO_OUTPUT)>;
> hog-gpios = <&self m GPIO_INPUT>;
>
> Perhaps we don't want to use GPIO_ACTIVE_x here, but we have 31 more
> free bits to use.

I prefer if the flags to be used for characteristics of the line rather
than driving it in any way. Anyway the input/output-low/output-high is
already merged, and in use for hogs.

We looked at using -gpios in a self-referential manner, but that
made it impossible to name the lines, and that is a desired
property. Hogged lines need names so we can figure out who is
using them during debug etc. It also makes the DT more
human-readable.

Yours,
Linus Walleij
