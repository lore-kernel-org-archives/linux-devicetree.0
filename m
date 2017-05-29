From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add bindings for basic reset controller
Date: Mon, 29 May 2017 19:46:13 +0930
Message-ID: <CACPK8Xc4zTqyB5ALU-N8KOkH-LLaJtSs5iBtjivNT=cJv3xkKA@mail.gmail.com>
References: <20170526033214.8081-1-joel@jms.id.au> <20170526033214.8081-2-joel@jms.id.au>
 <1496048959.17695.20.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496048959.17695.20.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 6:39 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Joel,
>
> On Fri, 2017-05-26 at 13:32 +1000, Joel Stanley wrote:
>> This adds the bindings documentation for a basic single-register reset
>> controller.
>>
>> The bindings describe a single 32-bit register that contains up to 32
>> reset lines, each deasserted by clearing the appropriate bit in the
>> register.
>>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/reset/reset-basic.txt      | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/reset-basic.txt
>>
>> diff --git a/Documentation/devicetree/bindings/reset/reset-basic.txt b/Documentation/devicetree/bindings/reset/reset-basic.txt
>> new file mode 100644
>> index 000000000000..7341e04e7904
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/reset-basic.txt
>> @@ -0,0 +1,31 @@
>> +Basic single-register reset controller
>> +======================================
>> +
>> +This describes a generic reset controller where the reset lines are controlled
>> +by single bits within a 32-bit memory location. The memory location is assumed
>> +to be part of a syscon regmap.
>
> There are a few more assumptions. First, that the reset line is asserted
> by setting the corresponding bits, and that it is deasserted by clearing
> them. Further, that the bits are not auto-clearing. And then, that the
> same bit can be read back to provide the current reset line status.

I'll add a property to indicate set-to-enable in v2. How about:

 - reset-set-assert: Specifies that the bit should be set to assert
the reset. The default is to set the bit to deassert the reset.

I'm sure we can find a better way to write that.

I'll add a note that the bits are not auto-clearing, and therefore
they can be read back. This is in the spirit of trying to describe a
basic reset controller.

>
>> +Reset controller required properties:
>> + - compatible: should be "reset-basic"
>> + - #reset-cells: must be set to 1
>> + - reg: reset register location within regmap
>> +
>> +Device node required properties:
>> + - resets phandle
>> + - bit number, counting from zero, for the desired reset line. Max is 31.
>> +
>> +Example:
>> +
>> +syscon {
>> +     compatible = "syscon";
>> +
>> +     uart_rest: rest@0c {
>
> The device node name should be "reset-controller", and leading zeroes
> should be dropped from the address part:
>
>         uart_rest: reset-controller@c {

Ok.

>
>> +             compatible = "reset-basic";
>
> Maybe this is not necessary for the example, but the compatible should
> contain a vendor/hardware specific string first.

You're suggesting I add a hardware-specific string in addition to the
generic reset-basic? eg:

            compatible = "aspeed,uart-rest", "reset-basic";

I don't think that helps anyone. We don't do that for eg.
timeriomem-rng or gpio-fan. Or perhaps I've misunderstood your
suggestion?

>
>> +             #reset-cells = <1>;
>> +             reg = <0x0c>;
>> +     };
>> +}
>> +
>> +&uart {
>> +     resets = <&uart_rest 0x04>;
>
> I'd use decimal here.

Ok.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
