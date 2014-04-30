From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [Ac100] [PATCH v2 5/6] ARM: tegra: paz00: add dtbindings
 for nvec
Date: Wed, 30 Apr 2014 10:21:07 -0600
Message-ID: <536122F3.4070301@wwwdotorg.org>
References: <535EDE6D.2050505@wwwdotorg.org> <2004470.cHRJ0azkU4@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2004470.cHRJ0azkU4@fb07-iapwap2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/30/2014 01:52 AM, Marc Dietrich wrote:
> Hi,
> 
> Am Montag, 28. April 2014, 17:04:13 schrieb Stephen Warren:
>> On 04/26/2014 07:14 PM, Andrey Danin wrote:
>>
>> This patch isn't adding DT bindings for NVEC, but rather add DT nodes.
>> The binding is the schema, not the content.
>>
>> We need a DT binding document that's been reviewed by the DT binding
>> maintainers. Can you please first submit a patch to the Linux kernel
>> that modifies the existing I2C core and Tegra I2C controller binding
>> documentation to add slave mode support. Once that's fully reviewed and
>> ack'd, this patch series can implement support for it in U-Boot.
> 
> I'm sorry that I didn't came up with a proper kernel implementation, but while 
> we are discussion the binding I just want to give some coins.

I'm not looking for a kernel driver implementation, but we do need to
the DT binding fully reviewed and accepted.

>>> diff --git a/arch/arm/dts/tegra20-paz00.dts
>>> b/arch/arm/dts/tegra20-paz00.dts> 
>>>  	i2c@7000c500 {
>>>
>>> -		status = "disabled";
>>> +		status = "okay";
>>> +		clock-frequency = <40000>;
>>> +		slave-addr = <138>;
>>> +		nvec {
>>> +			compatible = "nvidia,tegra20-nvec";
>>> +			request-gpios = <&gpio 170 0>; /* gpio PV2 */
>>
>> The reg property is missing here. Since the i2c node has
>> #address-cells/#size-cells, there must be a reg property in the children.
>>
>> There's nothing here to indicate that this node is a slave device rather
>> than a master device, and doesn't seem to be any allowance for a single
>> I2C controller to support both master and slave nodes at the same time
>> (which I think Tegra's controller can IIRC).
>>
>> IIRC, I had previously suggested something like encoding master/slave
>> into the reg property of the I2C child nodes. We could either do:
>>
>> a) Set some top-bit to indicate a slave device.
>>
>> b) If #address-cells=<1>, only master devices are present. If
>> #address-cells=<2>, either master or slave devices could be present.
>> Cell 0 could be 0==master, 1==slave, and cell 1 the actual I2C bus address.
> 
> I'm not sure if this is really needed. NVEC knows it has to configure the 
> tegra controller as slave. I don't see a reason to double this fact in the 
> device tree. I like the idea of how the downstream kernel does it. The driver 
> calls something like tegra_i2c_init_slave with the slave address as an 
> parameter. This means that the slave address is not a property of the i2c 
> (slave-) controller, but of the master because it has the address hard coded 
> in its firmware. So reg = <138>; would be sufficient here and it also enables 
> multi-slave configs.

The binding in this patch is very special-cased. Instead, we need to
create a generic binding that will work identically across arbitrary I2C
controllers, some of which do support multiple slave addresses. The
issue that caused Linus to blow up about ARM was because everyone went
off and did their own HW-specific stuff without taking a look at the big
picture. That's exactly what the binding proposed in this patch does too.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
