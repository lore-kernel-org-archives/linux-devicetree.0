From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Mon, 1 Jun 2015 15:45:35 +0200
Message-ID: <CACRpkdabE5ztEDT8797iOO3fwDLgJOYyQp_cfjk7iDEAE+Uh8A@mail.gmail.com>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
	<CACRpkdZcbvrcOMJavU5TacR1nD5+ot2FdC5zxBc=8XdhZN0SqQ@mail.gmail.com>
	<20150521184855.GA6159@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150521184855.GA6159@debian>
Sender: linux-gpio-owner@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 8:48 PM, Rabin Vincent <rabin@rab.in> wrote:
> On Tue, May 19, 2015 at 11:39:01AM +0200, Linus Walleij wrote:

>> Three cells is rather unusual, is it the best arrangement?
>>
>> Usually it's just offset+flags (your flags are ununsed I see).
>> And then you could divide offset by num gpios per bank
>> (I guess 32) in the driver to get bank number.
>
> At least to me, this:
>
> +       i2c {
> +               compatible = "i2c-gpio";
> +               gpios = <&gio 0xD 5 0>, <&gio 0xD 6 0>;
> +               i2c-gpio,delay-us = <2>;
>
> which immediately shows that it's port D pins 5 and 6 which are being used, and
> which matches the naming in the schematics and the chip documentation is
> clearly preferable to this:
>
> +               gpios = <&gio 101 0>, <&gio 102 0>;
>
> which uses made up numbers with no relation to any documentation and which
> probably requires the use of a calculator to determine if the correct
> pins are being used.

Sure I buy this ... just need to push back some to not get too
many deviant DT bindings :/

There is also the code such as of_gpio_simple_xlate()
that can't be reused for this, so thus it needs its own xlate
function and adds some complexity to the code.
But the convention in of_gpio_simple_xlate() is that
cell 0 is offset, and cell 1 is flags, so what about
moving the bank number to the last argument so you
can still use of_gpio_simple_xlate()?

Like so:
gpios = <&gio 5 0 0xD>, <&gio 6 0 0xD>;

I.e. extra cells go at the end. I can see you have a check
hack to see it is hitting a valid GPIO chip by using the label,
but that doesn't seem totally necessary.

Maybe we should even document this as a preferred binding
for "one IP with many banks inside it" use cases so we can
use that going forward?

> (btw, the ports have varying numbers of GPIOs and none of them have 32).

How typical.

> The binding in the patch matches the hardware.  The hardware is
> described as one IP with several ports and not several instances of the
> same IP.  The registers are also just 3 per port in the same region.
> Creating one instance of the device for handling each port, seems
> like useless overhead at best and, because it doesn't even match how the
> hardware looks like, quite wrong anyway.

OK.

> Only port A has interrupt support; this is not implemented in the
> current driver.

OK.

> BTW, the documentation for the chip is available here (GIO starts at
> page 647 and its registers at page 895):
> http://www.axis.com/files/manuals/etrax_fs_des_ref-070821.pdf

Ah I see it has pin multiplexing in front of the GPIO controller
block too. The driver may need  pinctrl_request_gpio()/
pinctrl_free_gpio() etc the day there is a standard pin control
driver in the back end of it. But no hurry with that.

>> > +struct etraxfs_gpio_port {
>> > +       const char *label;
>> > +       unsigned int oe;
>> > +       unsigned int dout;
>> > +       unsigned int din;
>>
>> consider using u32 for these.
>
> Why?  These are just offsets to the base address so there's no reason
> they _have_ to be 32 bits so u32 seems semantically wrong.

Ah I thought it was register shadows or something,
offsets are OK. Sorry.

Yours,
Linus Walleij
