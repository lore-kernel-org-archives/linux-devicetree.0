From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC v3 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Thu, 27 Mar 2014 14:57:56 +0100
Message-ID: <53342E64.5060505@samsung.com>
References: <1395922579-28547-1-git-send-email-s.nawrocki@samsung.com>
 <1395922579-28547-3-git-send-email-s.nawrocki@samsung.com>
 <77553409.zvN7VkNGe7@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <77553409.zvN7VkNGe7@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 27/03/14 14:24, Laurent Pinchart wrote:
> On Thursday 27 March 2014 13:16:19 Sylwester Nawrocki wrote:
>> This function adds a helper function to configure clock parents and rates
>> as specified in clock-parents, clock-rates DT properties for a consumer
>> device and a call to it before driver is bound to a device.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
[...]
>> ---
>>  .../devicetree/bindings/clock/clock-bindings.txt   |   26 ++++++
>>  drivers/base/dd.c                                  |    7 ++
>>  drivers/clk/Makefile                               |    1 +
>>  drivers/clk/clk-conf.c                             |   87 +++++++++++++++++
>>  drivers/clk/clk.c                                  |   10 ++-
>>  include/linux/clk/clk-conf.h                       |   19 +++++
>>  6 files changed, 149 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/clk/clk-conf.c
>>  create mode 100644 include/linux/clk/clk-conf.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
>> 7c52c29..b452f80 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -115,3 +115,29 @@ clock signal, and a UART.
>>    ("pll" and "pll-switched").
>>  * The UART has its baud clock connected the external oscillator and its
>>    register clock connected to the PLL clock (the "pll-switched" signal)
>> +
>> +==Assigned clock parents and rates==
>> +
>> +Some platforms require static initial configuration of parts of the clocks
>> +controller. Such a configuration can be specified in a clock consumer node
>> +through clock-parents and clock-rates DT properties. The former should
>> contain
>> +a list of parent clocks in form of phandle and clock specifier pairs, the
>> +latter the list of assigned clock frequency values (one cell each).
>> +
>> +    uart@a000 {
>> +        compatible = "fsl,imx-uart";
>> +        reg = <0xa000 0x1000>;
>> +        ...
>> +        clocks = <&clkcon 0>, <&clkcon 3>;
>> +        clock-names = "baud", "mux";
>> +
>> +        clock-parents = <0>, <&pll 1>;
>> +        clock-rates = <460800>;
>> +    };
>> +
>> +In this example the pll is set as parent of "mux" clock and frequency of
>> "baud"
>> +clock is specified as 460800 Hz.
> 
> I'm curious, what should happen when two devices have conflicting requirements 
> ? If a different device required the <&clkcon 3> parent to be set to <&pll 2> 
> for instance, who should win ? Shouldn't a warning be printed ?

In general, the assumption is that the <&clkcon 3> clock would be used only
by the uart@a000 device. If a clock is shared I'd say it shouldn't be put
in a multiple consumer device nodes. Instead it should be put in a clock
provider node, as I was trying to explain in the sentence below.

A warning could be useful, but it could complicate the code. We would need,
for example, to store information about already configured clocks in a list and
scan it before actually altering any clock parent or rate.

>> +For clocks which are not directly connected to any consumer device
>> similarly
>> +clocks, clock-parents and/or clock-rates properties should be specified in
>> +assigned-clocks subnode of a clock controller DT node.
> 
> It might be that I'm not familiar enough with the clock framework, but this 
> sounds unclear to me. I'm not sure what you mean exactly.

Sorry about not being precise here, would something like below be more
clear ?

"Configuration of common clocks, which affect multiple consumer devices
can be specified in a dedicated 'assigned-clocks' subnode of a clock
provider node, e.g.:

    clkcon {
        ...
        #clock-cells = <1>;

        assigned-clocks {
            clocks = <&clkcon 16>, <&clkcon 17>;
            clock-parents = <0>, <&clkcon 1>;
            clock-rates = <200000>;
        };
    };	
"

Naturally it's this just an RFC, any critics or suggestions are welcome.:)

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
