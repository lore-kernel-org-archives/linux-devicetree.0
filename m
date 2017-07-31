From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v3 1/2] gpio: davinci: Add keystone-k2g compatible
Date: Mon, 31 Jul 2017 19:14:52 +0530
Message-ID: <90337754-8670-6df7-5421-7100e31755b1@ti.com>
References: <1501051524-5990-1-git-send-email-j-keerthy@ti.com>
 <5aa0d273-8e05-a5ff-7931-b9a94acade36@ti.com>
 <8021c424-460c-def4-3a67-ed760997193d@ti.com>
 <2eeaeea5-9476-8631-8680-7db3322151bf@ti.com>
 <da92fe60-d70b-6a37-6b88-2ac95dd67b6a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <da92fe60-d70b-6a37-6b88-2ac95dd67b6a@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, ssantosh@kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, nsekhar@ti.com, t-kristo@ti.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Wednesday 26 July 2017 07:50 PM, Suman Anna wrote:
> On 07/26/2017 08:36 AM, Keerthy wrote:
>>
>> On Wednesday 26 July 2017 06:57 PM, Franklin S Cooper Jr wrote:
>>>
>>>
>>> On 07/26/2017 08:00 AM, Suman Anna wrote:
>>>> Hi Keerthy,
>>>>
>>>> On 07/26/2017 01:45 AM, Keerthy wrote:
>>>>> The patch adds keystone-k2g compatible, specific properties and
>>>>> an example.
>>>
>>> Seems we are adding information regarding several Keystone 2 SoCs. So
>>> the commit and subject should be tweaked to reflect this.
>>
>> Okay i can add that as well.
>>
>>>>
>>>> Please update patch header to "dt-bindings: gpio: davinci: ...."
>>>>
>>>>>
>>>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>>>> ---
>>>>>
>>>>> Changes in v3:
>>>>>
>>>>>   * Added details about family of SoCs corresponding to compatibles.
>>>>>
>>>>>  .../devicetree/bindings/gpio/gpio-davinci.txt      | 40 +++++++++++++++++++++-
>>>>>  1 file changed, 39 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>> index 5079ba7..fb9efee 100644
>>>>> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>> @@ -1,7 +1,10 @@
>>>>>  Davinci/Keystone GPIO controller bindings
>>>>>  
>>>>>  Required Properties:
>>>>> -- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
>>>>> +- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs 
>>>>> +			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
>>>>> +						66AK2E SoCs
>>>>> +			"ti,keystone-k2g-gpio", "ti,keystone-gpio": for 66AK2G
>>>>>  
>>>>>  - reg: Physical base address of the controller and the size of memory mapped
>>>>>         registers.
>>>>> @@ -26,6 +29,17 @@ The GPIO controller also acts as an interrupt controller. It uses the default
>>>>>  two cells specifier as described in Documentation/devicetree/bindings/
>>>>>  interrupt-controller/interrupts.txt.
>>>>>  
>>>>> +Required Properties specific to keystone-k2g
>>>>
>>>> Thanks for updating the binding for the clocks, but clocks are not
>>>> specific to K2G. They also apply to other K2 SoCs. Davinci platforms do
>>>> not have DT clocks atm, so the Davinci portion can be updated later if
>>>> and when they get added.
>>>>
>>>
>>> What about power-domain property?
> 
> The correct name is "power-domains".
> 
>> Driver has no pm_runtime implemented yet.
> 
> True, not yet, but this is in general a required property on K2G SoCs to
> automatically enable clocks through runtime_pm. Clock properties on K2G
> nodes should only be truly required if a driver is using clk API
> (ideally to control optional clocks or for adjusting clock frequencies).
> When the gpio-davinci driver gets updated to use pm_runtime, the clock
> properties will be rendered obsolete for K2G.
> 
> Rob,
> Any suggestions on how we need to handle this? Should we be adding the
> property now or later when we adapt the driver for runtime_pm? This
> would be a common theme for K2G nodes that are reusing Davinci drivers.
> 
> My take on this would be to add the property now, and mark the clock
> properties obsolete when the driver gets converted.

Rob,

Any comments on this?

Regards,
Keerthy

> 
> regards
> Suman
> 
>>
>>>
>>>>> +
>>>>> +- clocks: Should contain devices input clock. The first parameter
>>>>> +           is a handle to k2g_clks. The second parameter is the
>>>>> +           device ID and the third parameter is the clock ID. One can
>>>>> +           refer: http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
>>>>
>>>> No need for this link here, just refer to the appropriate clock
>>>> bindings. Some thing like the following would be better
>>>
>>> This information is helpful especially with the macros being dropped.
>>> However, I agree that this is not the place for this information.
>>> Probably should be linked to in the ti,sci-clk.txt and
>>> sci-pm-domain.txt. However, both of these are outdated since it is
>>> referring to macros and includes that don't exist or will no longer exist.
>>
>> Hence included here but yes i can point to something like what Suman
>> asked me to.
>>
>>>
>>>>
>>>> - clocks:               Should contain the device's input clock, and
>>>>                         should be defined as per the appropriate clock
>>>> bindings consumer usage in,
>>>>
>>>> Documentation/devicetree/bindings/clock/keystone-gate.txt
>>>>                             for 66AK2HK/66AK2L/66AK2E SoCs or,
>>>>
>>>> Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>>>                             for 66AK2G SoCs
>>>>
>>>>> +
>>>>> +           Example: <&k2g_clks 0x001c 0x0>;
>>>>
>>>> This can be dropped as well, below example already demonstrates it.
>>>>
>>>>> +
>>>>> +- clock-names: The driver expects the clock name to be "gpio";
>>>>
>>>> Just say, Should be "gpio". No need of mentioning about the driver.
>>>>
>>>>> +
>>>>>  Example:
>>>>>  
>>>>>  gpio: gpio@1e26000 {
>>>>> @@ -60,3 +74,27 @@ leds {
>>>>>  		...
>>>>>  	};
>>>>>  };
>>>>> +
>>>>> +Example for keystone-k2g:
>>>>
>>>> s/keystone-k2g/66AK2G/
>>>>
>>>>> +
>>>>> +gpio0: gpio@2603000 {
>>>>> +	compatible = "ti,keystone-k2g-gpio", "ti,keystone-gpio";
>>>>> +	reg = <0x02603000 0x100>;
>>>>> +	gpio-controller;
>>>>> +	#gpio-cells = <2>;
>>>>> +	interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
>>>>> +			<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
>>>>> +	interrupt-controller;
>>>>> +	#interrupt-cells = <2>;
>>>>> +	ti,ngpio = <144>;
>>>>> +	ti,davinci-gpio-unbanked = <0>;
>>>>> +	clocks = <&k2g_clks 0x001b 0x0>;
>>>>> +	clock-names = "gpio";
>>>>> +};
>>>
>>> If your going to talk about other Keystone 2 devices it would be helpful
>>> to include an example for one of them since they have slightly different
>>> properties.
>>
>> Sure.
>>
>>>>>
>>>>
>>>> regards
>>>> Suman
>>>>
> 
