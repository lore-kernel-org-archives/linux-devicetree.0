From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
Date: Fri, 8 Apr 2016 13:39:06 +0200
Message-ID: <CACRpkdZu6ODbDaf1QCn8URSoJp=h3qDt2tzxxhpQ2oVO8Mb=QQ@mail.gmail.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
	<1459278791-3646-5-git-send-email-tthayer@opensource.altera.com>
	<CACRpkda8VTDGVsRqbCs6ESeokA3t_p2X91FUNiqA7YM=F-JXBQ@mail.gmail.com>
	<56FEDB62.1010308@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <56FEDB62.1010308@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, pawell.moll@arm.com, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Dinh Nguyen <dinguyen@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-hwmon@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 1, 2016 at 10:34 PM, Thor Thayer
<tthayer@opensource.altera.com> wrote:
> On 04/01/2016 07:17 AM, Linus Walleij wrote:

>>> +struct altr_a10sr_gpio {
>>> +       struct altr_a10sr *a10sc;
>>> +       struct gpio_chip gp;
>>> +};
>>
>> Add some kerneldoc.
>
> OK. To clarify, is this comment referring to the bindings document or
> something different?

Document the data structure.
Documentation/kernel-doc-nano-HOWTO.txt

>> Please check:
>> - If there is really no direction setting anywhere
>> - For example if some lines are hardwired as input and
>>    some lines are hardwired as output
>> - If that is not the case, verify that all lines are really
>>    open drain, they should be if all are both input and
>>    output at the same time.
>>
>
> I see your point. I'll investigate how to do this properly for your 2nd
> check above. Registers are hard-wired as input or output so I'll need to
> handle this properly and is why I didn't implement the .set_direction
> callback. Thanks for the explanation.
>
> In my case, there are 12 valid GPIOs out of the 16 bits (the first 4 bits
> are unused). Bits 4-7 are output and bits 8-15 are inputs. I was using the
> IN_VALID range for the inputs and the OUT_VALID range for the outputs.

It sounds like should implement direction_[input|output]() callbacks
and just return 0 if the user is asking for the hardwired direction and return
error if it tries to set an input-only to output and vice versa.

Yours,
Linus Walleij
