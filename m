From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCHv1] rtc: bcm-iproc: Add support for Broadcom iproc rtc
Date: Wed, 11 Mar 2015 13:00:22 -0700
Message-ID: <55009ED6.4050205@broadcom.com>
References: <1418757750-3628-1-git-send-email-arun.ramamurthy@broadcom.com> <2569223.1gDQjv8f8j@wuerfel> <54F78CF4.9040108@broadcom.com> <2216310.NqXA88JvvL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2216310.NqXA88JvvL@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Arun Ramamurthy <arunrama-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 15-03-04 02:58 PM, Arnd Bergmann wrote:
> On Wednesday 04 March 2015 14:53:40 Arun Ramamurthy wrote:
>> On 15-03-04 02:50 PM, Arnd Bergmann wrote:
>>> On Wednesday 04 March 2015 14:40:13 Arun Ramamurthy wrote:
>>>> On 15-03-04 02:21 PM, Arnd Bergmann wrote:
>>>>> On Thursday 12 February 2015 14:17:41 Arun Ramamurthy wrote:
>>>>>> Hi Arnd
>>>>>>
>>>>>> My apologies for the late reply, I was moved to other work items. I
>>>>>> wanted to get more clarification on the syscon issue so that I can
>>>>>> submit the next patch set. If I understand correctly, you would like
>>>>>> me to move the CRMU logic to a new driver under mfd/ and use the syscon
>>>>>> api calls in my rtc driver? Thanks
>>>>>
>>>>> It depends a lot on what's in there, I can best advise you if you
>>>>> have some form of register list.
>>>>>
>>>>> A common approach would be to not have a driver for the crmu at all,
>>>>> but just mark it as syscon, and have the other drivers either reference
>>>>> the syscon node through a phandle, or create them as childrem of
>>>>> the syscon node. The latter case makes most sense if all uses of
>>>>> the crmu have no other MMIO registers.
>>>>>
>>>>
>>>> Thank you Arnd, I am going to follow the approach of adding a child node
>>>> to the syscon node. Several other driver use other registers in the CRMU
>>>> so I think the child node approach makes the most sense.
>>>
>>> Just to be sure we have the same understanding: of those other drivers,
>>> do you think that they would use only CRMU registers, or could there
>>> be drivers that have both CRMU as well as other MMIO registers?
>>>
>> The other drivers have both CRMU and other MMIO registers. So I thought
>> they could also switch to using the syscon child nodes.
>>
>
> No, in this case, better not use child nodes at all. When other platforms
> use child nodes of a syscon, the common case is that they use the 'reg'
> property to refer to syscon registers, which are in a different address
> space from other MMIO, and you can't easily mix the two.
>

Arnd, this is the device tree entry that I would end up with and I plan 
to use syscon_regmap_lookup_by_phandle in the rtc driver. Does this look 
acceptable?

rtc: iproc_rtc@0x03026000 {
		compatible = "brcm,iproc-rtc";
		reg =	<0x03026000 0xC>,
		iso_cell_syscon = <&crmu_iso_cell_control>;
		bbl_auth_syscon = <&crmu_bbl_auth>
		status = "okay";

crmu_iso_cell_control:crmu@0x0301C02C {
		compatible = "syscon";
		reg = <0x0301C038 0x8>
}

crmu_bbl_auth:crmu@0x03024C74 {
		compatible = "syscon";
		reg = <0x03024C74 0x8>;
}

Thanks
> 	Arnd
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
