From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution,
 or is there something	better?
Date: Mon, 21 Oct 2013 21:05:44 +0100
Message-ID: <52658918.1060708@wwwdotorg.org>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100.arm.linux.org.uk> <52646AF9.3050309@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52646AF9.3050309-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/21/2013 12:44 AM, Guenter Roeck wrote:
> On 10/20/2013 04:11 PM, Russell King - ARM Linux wrote:
>> On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:
>>> The only thing we've really moved out of the kernel is the exact IDs of
>>> which GPIOS, interrupts, I2C/SPI ports the devices are connected to; the
>>> simple stuff not the hard stuff. The code hasn't really been simplified
>>> by DT - if anything, it's more complicated since we now have to parse
>>> those values from DT rather than putting them into simple
>>> data-structures.
>>
>> Here's my random thoughts this evening on DT, orientated mostly on a
>> problem area I've been paying attention to recently.
>>
>> In some ways, DT has made things much harder.  I don't know whether
> 
> On the other side, DT has made some things much simpler.
> 
> Problem case: Chip A's interrupt pin is connected to gpio pin of chip B.
> Chip B's interrupt pin is connected to a gpio pin on chip C. Chip C's
> interrupt pin is connected to the interrupt controller. Chips B and C
> are multi-function FPGAs. Exact gpio pins used vary from board to board.
> 
> With DT, this relationship is easy to describe, and none of the chip
> drivers
> really needs to know what is connected to what. Without DT, it would be
> much more complex.

I thought that was very easy with board files. For every chip that gets
instantiated, you tell it which base IRQ ID to use. For every chip that
outputs a IRQ, you tell it which IRQ ID that signal is, simply by adding
the recipient chip's IRQ base and an offset. That seems very simple. If
you don't want to add the base/offset together, we could always have
invented some lookup table similar to what regulators had, and pinctrl
has now, which says for each (device name, IRQ name/number) output,
here's the (device name, IRQ name/number) of the associated input.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
