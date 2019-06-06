From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 1/2] DT: mailbox: add binding doc for the ARM SMC
 mailbox
Date: Wed, 5 Jun 2019 19:51:52 -0700
Message-ID: <19931084-8b12-c510-8856-5cc869e4f9ff@gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-2-peng.fan@nxp.com>
 <ae4c79f0-4aec-250e-e312-20aba5554665@gmail.com>
 <20190603165651.GA12196@e107155-lin>
 <20190603181856.34996aaa@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603181856.34996aaa@donnerap.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: peng.fan@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, jassisinghbrar@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, van.freenix@gmail.com
List-Id: devicetree@vger.kernel.org



On 6/3/2019 10:18 AM, Andre Przywara wrote:
> On Mon, 3 Jun 2019 17:56:51 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> Hi,
> 
>> On Mon, Jun 03, 2019 at 09:22:16AM -0700, Florian Fainelli wrote:
>>> On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:  
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> The ARM SMC mailbox binding describes a firmware interface to trigger
>>>> actions in software layers running in the EL2 or EL3 exception levels.
>>>> The term "ARM" here relates to the SMC instruction as part of the ARM
>>>> instruction set, not as a standard endorsed by ARM Ltd.
>>>>
>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>> ---
>>>>
>>>> V2:
>>>> Introduce interrupts as a property.
>>>>
>>>> V1:
>>>> arm,func-ids is still kept as an optional property, because there is no
>>>> defined SMC funciton id passed from SCMI. So in my test, I still use
>>>> arm,func-ids for ARM SIP service.
>>>>
>>>>  .../devicetree/bindings/mailbox/arm-smc.txt        | 101 +++++++++++++++++++++
>>>>  1 file changed, 101 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
>>>> new file mode 100644
>>>> index 000000000000..401887118c09
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
>>>> @@ -0,0 +1,101 @@  
>>
>> [...]
>>
>>>> +Optional properties:
>>>> +- arm,func-ids		An array of 32-bit values specifying the function
>>>> +			IDs used by each mailbox channel. Those function IDs
>>>> +			follow the ARM SMC calling convention standard [1].
>>>> +			There is one identifier per channel and the number
>>>> +			of supported channels is determined by the length
>>>> +			of this array.
>>>> +- interrupts		SPI interrupts may be listed for notification,
>>>> +			each channel should use a dedicated interrupt
>>>> +			line.  
>>>
>>> I would not go about defining a specific kind of interrupt, since SPI is
>>> a GIC terminology, this firmware interface could be used in premise with
>>> any parent interrupt controller, for which the concept of a SPI/PPI/SGI
>>> may not be relevant.
>>>  
>>
>> While I agree the binding document may not contain specifics, I still
>> don't see how to use SGI with this. Also note it's generally reserved
>> for OS future use(IPC) and using this for other than IPC may be bit
>> challenging IMO. It opens up lots of questions.
> 
> Well, a PPI might be possible to use, although it's somewhat dodgy to hijack the GIC's (re-)distributor from EL3 to write to GICD_ISPENDR<n>. Need to ask Marc about his feelings towards this. But it's definitely possible from a hypervisor to inject arbitrary interrupts into a guest.
> 
> But more importantly: is there any actual reason this needs to be a GIC interrupt? If I understand the code correctly, this could just be any interrupt, including one of an interrupt combiner or a GPIO chip. So why not just use the standard wording of: "exactly one interrupt specifier for each channel"?

That was my point, I am not stuck on using an SGI, or PPI, or anything
(even if that's what we have been using at the moment), any interrupt
would/should do here so the wording should be exactly as you indicated.
-- 
Florian
