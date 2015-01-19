From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: add lubbock-io binding
Date: Mon, 19 Jan 2015 20:29:40 +0100
Message-ID: <87lhkyh8m3.fsf@free.fr>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
	<20150119083533.GF21886@x1>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119083533.GF21886@x1> (Lee Jones's message of "Mon, 19 Jan
	2015 08:35:33 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On Fri, 16 Jan 2015, Robert Jarzmik wrote:
>
>> Add a binding for lubbock motherboard IO board.
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mfd/lubbock-io.txt         | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/lubbock-io.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/lubbock-io.txt b/Documentation/devicetree/bindings/mfd/lubbock-io.txt
>> new file mode 100644
>> index 0000000..33c9e21
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/lubbock-io.txt
>> @@ -0,0 +1,26 @@
>> +Intel's pxa255 system development platform motherboard.
>
> s/pxa25/PXA25/
Ok.
>
> "system development platform motherboard" doesn't quite sit right with me.
>
> How about "Intel Xscale PXA255 development platform (Lubbock)"?
OK.

>
>> +This is the motherboard, or IO board, of the pxa25x development system,
>> +supporting a lubbock pxa25x SoC board.
>
> Again, this sounds weird.
Would it sound better with :
  This regroups all the CPLDs on the Lubbock motherboard, providing interrupt
  muxing, leds handling, ...
>
>> +Required properties:
>> +  - compatible : One of the following chip-specific strings:
>> +        "intel,lubbock-io"
>
> An odd thing to say with only one entry.
Right, a simple "should be" would fit better.
>
>> +  - interrupts : The first interrupt is the line the /IRQ signal the IO board
>> +                 multiplex is connected to. The only known case is GPIO0 on the
>> +                 pxa25x SoC.
>
> Can you get someone to help you re-word this into a more fluid
> sentence?
Aouch, how about this :
interrupts : The first interrupt is the SoC input interrupt connected to the
             lubbock IO board interrupt multiplexer output. The only known
             working configuration is GPIO0 on the pxa25x SoC.

>
>> +Optional properties:
>> +  - interrupts : The second optional interrupt is the base of the interrupts
>> +                 multiplexed by the lubbock motherboard. If unspecified, the
>> +                 range is fully dynamic, and the irqdomain will generate its
>> +                 interrupt base on the fly.
>> +
>> +Example:
>> +
>> +mb: lubbock-mb@0 {
>> +	compatible = "intel,lubbock-io";
>> +	interrupts = <0 IRQ_TYPE_EDGE_FALLING 400 IRQ_TYPE_NONE>;
>> +	#interrupt-cells = <2>;
>> +        interrupt-parent = <&pxairq>;
>
> Whitespace error.
Right.

> I'm guessing mb means motherboard?  I think it's unusual for a
> motherboard to have it's own driver.  Usually we provide drivers for
> the individual components/peripherals situated on the board.
Yes, mb for motherboard. Well, this driver is actually for the CPLDs on the
motherboard.  Would "lubbock-cplds" be a better choice ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
