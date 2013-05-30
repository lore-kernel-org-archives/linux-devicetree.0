From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 01/12] mfd: DT bindings for the palmas family MFD
Date: Thu, 30 May 2013 17:03:30 -0600
Message-ID: <51A7DAC2.80602@wwwdotorg.org>
References: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
 <1363964122-19201-2-git-send-email-ian@slimlogic.co.uk>
 <5150906F.9040202@wwwdotorg.org> <51A73908.7020206@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A73908.7020206-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/30/2013 05:33 AM, keerthy wrote:
> 
> On 03/25/2013 11:29 PM, Stephen Warren wrote:
> 
>> On 03/22/2013 08:55 AM, Ian Lartey wrote:
>>> From: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
>>>
>>> Add the various binding files for the palmas family of chips. There is a
>>> top level MFD binding then a seperate binding for IP blocks on chips.
>>
>>> diff --git a/Documentation/devicetree/bindings/clock/palmas-clk.txt b/Documentation/devicetree/bindings/clock/palmas-clk.txt
>>
>> Where is the reg property; if you're instantiating the clk device as a
>> standalone DT node and driver, it should be possible to retrieve the
>> address of this IP block instance from DT, not using driver-internal APIs.
>>
>> This same comment likely applies everywhere, so I won't repeat it.
>>
>>> +Example:
>>> +
>>> +clk {
>>> +    compatible = "ti,twl6035-clk", "ti,palmas-clk";
>>> +    ti,clk32kg-mode-sleep = <0>;
>>> +    ti,clk32kgaudio-mode-sleep = <0>;
>>
>>> +    #clock-cells = <1>;
>>> +    clock-frequency = <32000000>;
>>> +    clock-names = "clk32kg", "clk32kgaudio";
>>
>> The binding description itself should describe what clocks this node
>> provides and consumes.
>>
>> What is clock-frequency; which clock does it affect?
>>
>> The presence of #clock-cells implies this is a clock provider. This
>> binding should define the format of the clock cells that this property
>> implies. I assume it's just the ID of the output clocks, but what values
>> correspond to which output clocks? That mapping table needs to be listed
>> here.
>>
>> The presence of clock-names implies this is a clock consumer. However,
>> there is no clocks property in the example. Is clks missing from the
>> example, or should this property be clock-output-names instead? If this
>> node is a clock consumer, the list of which clocks it requires should be
>> documented.
>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-palmas.txt b/Documentation/devicetree/bindings/gpio/gpio-palmas.txt
>>
>>> +- gpio-controller: mark the device as a GPIO controller
>>> +- gpio-cells = <1>:  GPIO lines are provided.
>>
>> That's #gpio-cells not gpio-cells.
>>
>> I assume that cell simply contains the GPIO ID/number. That should be
>> documented for clarity.
>>
>> Surely gpio-cells should be 2 not 1, so there is space for flags. At
>> least an "inverted" or "active-low" flag should be included; GPIO
>> consumers would typically implement that flag in SW, so there' no
>> requirement that the flag only be supported if the HW supports the feature.
>>
>>> +- interrupt-controller : palmas has its own internal IRQs
>>> +- #interrupt-cells : should be set to 2 for IRQ number and flags
>>> +  The first cell is the IRQ number.
>>> +  The second cell is the flags, encoded as the trigger masks from
>>> +  Documentation/devicetree/bindings/interrupts.txt
>>
>> You need "/interrupt-controller" before the filename there.
>>
>>> +- interrupt-parent : The parent interrupt controller.
>>
>> If this IP block has interrupt outputs, it should require an
>> "interrupts" property too. This is the same concept that drives the need
>> for a reg property. This same comment likely applies everywhere, so I
>> won't repeat it.
>>
>>> diff --git a/Documentation/devicetree/bindings/input/palmas-pwrbutton.txt b/Documentation/devicetree/bindings/input/palmas-pwrbutton.txt
>>
>>> +- interrupts: the interrupt outputs of the controller.
>>
>> How many entries are there, what do they mean, and in what order must
>> they appear? (Note that the binding of a node must define the order of
>> the interrupts property, since historically it's been accessed by index,
>> not by name, and all bindings must allow that access method to be used).
>>
>>> +- interrupt-names : Should be the name of irq resource. Each interrupt
>>> +  binds its interrupt-name.
>>
>> The binding needs to define standard names for the entries in this
>> property, or define that interrupts are only retrieved by index, in
>> which case interrupt-names shouldn't be present. This same comment
>> likely applies everywhere, so I won't repeat it.
>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Documentation/devicetree/bindings/mfd/palmas.txt
>>
>>> +Required properties:
>> ...
>>
>> I believe the Palmas devices have many separate I2C addresses, even
>> buses, which are I think are at least partially independently SW
>> configurable. In that case, the reg property for this node should
>> probably enumerate all the I2C addresses that this chip responds to, so
>> that they can each be passed down to the child nodes.
> 
> 
> Stephen,
> 
> The palmas devices do have multiple I2C slave IDs. From OMAP5 as the master
> all the palmas slave devices are connected via I2C1 bus.
> 
> I did not understand the SW configurable part. It is more board
> dependent. Correct me if i understood it wrongly.

IIRC (and I may not sine it's been a while since I looked at this),
there are SW registers that can modify the I2C address that the chip
will respond to, so you could access the main I2C address, then program
which other I2C addresses get used.

Or, perhaps I was just thinking of the fact that there are strapping
pins on the chip that affect both the main I2C address, and some/all of
the other I2C addresses, so the driver needs to be told each and every
I2C address, not just one single overall I2C address.
