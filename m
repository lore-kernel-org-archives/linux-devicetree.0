From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v6 4/5] ARM: DTS: da850: Add cfgchip syscon node
Date: Fri, 28 Oct 2016 12:24:06 -0500
Message-ID: <8f57109a-a6c6-1559-7195-2a1bc5ad66c3@lechnology.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-5-git-send-email-david@lechnology.com>
 <b9bfc4aa-ef52-53c4-dc7e-c0bc1c5969fb@lechnology.com>
 <09eb61b9-d66e-838e-2411-d787fda65096@ti.com> <m2fungcses.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2fungcses.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/28/2016 12:08 PM, Kevin Hilman wrote:
> Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> writes:
>
>> On Wednesday 26 October 2016 09:38 PM, David Lechner wrote:
>>> On 10/25/2016 10:06 PM, David Lechner wrote:
>>>> Add a syscon node for the SoC CFGCHIPn registers. This is needed for
>>>> the new usb phy driver.
>>>>
>>>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/da850.dtsi | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>>>> index f79e1b9..6bbf20d 100644
>>>> --- a/arch/arm/boot/dts/da850.dtsi
>>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>>> @@ -188,6 +188,10 @@
>>>>              };
>>>>
>>>>          };
>>>> +        cfgchip: cfgchip@1417c {
>>>
>>> I wonder if there is a more generic name instead of cfgchip@. Is there a
>>> preferred generic name for syscon nodes?
>>
>> I did not find anything in ePAPR, but chip-controller might be more
>> appropriate.
>>
>>>
>>>> +            compatible = "ti,da830-cfgchip", "syscon";
>>
>> Looks like we need "simple-mfd" too in the compatible list?
>>
>> I think we can also fold patch 5/5 into this patch and add the cfgchip
>> along with USB phy child node included.
>>
>> If you respin the patch, I can drop 4/5 and 5/5 that I have queued and
>> included the updated patch instead.
>
> Sekhar, what's your opinion of having this syscon just for CFGCHIP* vs
> a single syscon for the whole SYSCFG0 region.
>
> The drivers/bus driver from Bartosz is also using SYSCFG0 registers, and
> proposing a sysconf ro this region, but it will need to exclude the
> CFGCHIPn registers if we also have this syscon.

What about the pinmux registers, which are already being used separately 
too?

>
> I tend to think we should just have one for the whole SYSCFG0 which
> this series could use.
>
> Unfortunately, the PHY driver is already merged and it references the
> syscon by compatible.  The PHY driver should probably be fixed to find
> its syscon by phandle, and then maybe we could move to a single syscon
> for SYSCFG0?

I agree that this should be change, but I was thinking we should use 
syscon_node_to_regmap(np->parent) since the phy node should be a child 
of the syscon node.

>
> Let us know your preference, I don't have a very strong feeling either
> way, but since we're already part way down the path of the CFGCHIP
> syscon, we should keep it and later migrate it to one for all of
> SYSCFG0.
>
> Kevin
>



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
