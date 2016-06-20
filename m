From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Add support for SYSCON reset
Date: Mon, 20 Jun 2016 13:44:44 -0500
Message-ID: <5768399C.30201@ti.com>
References: <20160601184125.20241-1-afd@ti.com> <576178C7.4040204@ti.com>
 <1466009144.3539.77.camel@pengutronix.de>
 <CAL_JsqKL+njqxTUB3MPgX=qJK72bmXXWH4gOuYMC2NFg5u7eqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKL+njqxTUB3MPgX=qJK72bmXXWH4gOuYMC2NFg5u7eqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/15/2016 09:13 PM, Rob Herring wrote:
> On Wed, Jun 15, 2016 at 11:45 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> Hi Andrew,
>>
>> Am Mittwoch, den 15.06.2016, 10:48 -0500 schrieb Andrew F. Davis:
>>> On 06/01/2016 01:41 PM, Andrew F. Davis wrote:
>>>> Some SoCs contain reset controls for modules that are memory-mapped to
>>>> areas shared with other module configuration settings. This requires
>>>> synchronization across all drivers accessing this memory area. This
>>>> series adds a generic SYSCON reset driver to allow resets toggled
>>>> by bits in memory-mapped registers through SYSCON.
>>>>
>>>> Changes from v2:
>>>>  - Rebased on v4.7-rc1
>>>>  - Removed the need to give reset specifier nodes an index address
>>>>
>>>> Changes from v1:
>>>>  - Reset control information is now described in the reset node, this
>>>>    keeps the reset information centralized for easy verification
>>>>  - Other small fixups
>>>>
>>>> Andrew F. Davis (2):
>>>>   Documentation: dt: reset: Add syscon reset binding
>>>>   reset: add a SYSCON based reset driver
>>>>
>>>>  .../devicetree/bindings/reset/syscon-reset.txt     | 105 ++++++++
>>>>  drivers/reset/Kconfig                              |  10 +
>>>>  drivers/reset/Makefile                             |   1 +
>>>>  drivers/reset/reset-syscon.c                       | 289 +++++++++++++++++++++
>>>>  include/dt-bindings/reset/syscon.h                 |  23 ++
>>>>  5 files changed, 428 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
>>>>  create mode 100644 drivers/reset/reset-syscon.c
>>>>  create mode 100644 include/dt-bindings/reset/syscon.h
>>>>
>>>
>>> Is there any additional feedback for this driver? I normally try to
>>> refrain from pings, but this may begin to block further upstreaming of
>>> IPs that uses this reset if it can not be taken this cycle.
>>
>> There's still Rob's concern that this binding needs a device tree node
>> per single register bit in the worst case, which seems a bit overkill.
> 
> Yes, that's still my concern with this.
> 
>> I'd still prefer to have this information hidden in the drivers, but if
>> you absolutely have to put it in the device tree, maybe an approach more
>> similar to pinctrl-simple, where you could list all resets, one per
>> line, in a single property, would be more acceptable:
>>
>> pscrst: reset-controller {
>>         compatible = "ti,<chip>-pscrst", "syscon-reset";
>>
>>         /* syscon-reset,bits = <ctrl_reg ctrl_bit stat_reg stat_bit flags>; */
> 
> ti,reset-bits
> 
>>         syscon-reset,bits = <0xa3c 8 0x83c 8 RESET_ASSERT_CLEAR  /* 0: pcrst-dsp */
>>                              0xa40 5 0     0 RESET_TRIGGER_SET>; /* 1: pcrst-example */
>> };
>>
>> dsp0: dsp {
>>         resets = <&pscrst 0>;
>> };
> 
> Otherwise, this seems okay. It is more concise.
> 

If this is what you would both be okay with then I'll do it this way,
pushing v4 in a moment.

>>
>>> If there is still an objection to calling this a generic reset solution
>>> we would not strongly object to relabeling this to something implying
>>> more TI exclusivity.
>>
>> Good. Right now there don't seem to be that many reset controllers in
>> the wild for which this binding would be a good fit. If this turns out
>> to be useful for others, we can add more compatibles to the driver.
> 
> Certainly other users would make a generic solution more compelling.
> 

I believe some other current reset drivers could have made use of this
without having resorted to new drivers, I guess we will have to just
wait to see if it gets traction with new platforms or not, before we can
decide if this solution is really as general as I think it can be.

Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
