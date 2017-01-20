From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5] ARM64: dts: meson-gx: Add firmware reserved memory
 zones
Date: Fri, 20 Jan 2017 10:14:45 +0100
Message-ID: <39e78b49-8d3a-583b-410a-210343345f44@suse.de>
References: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com>
 <2bdb6818-4620-53b1-112d-2d6a29e484d9@suse.de>
 <eca803d3-1a67-cda5-554d-4313ae56635e@suse.de> <m24m0vy8cg.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m24m0vy8cg.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, xypron.glpk-Mmb7MZpHnFY@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 19.01.2017 um 05:36 schrieb Kevin Hilman:
> Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:
>> Am 19.01.2017 um 01:20 schrieb Andreas Färber:
>>> Am 18.01.2017 um 17:50 schrieb Neil Armstrong:
>>>> The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
>>>> this patch adds these reserved zones.
>>>>
>>>> Without such reserved memory zones, running the following stress command :
>>>> $ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
>>>> multiple times:
>>>>
>>>> Could lead to the following kernel crashes :
>>>> [   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf000000 -- SError
>>>> ...
>>>> [   47.058536] Internal error: Attempting to execute userspace memory: 8600000f [#3] PREEMPT SMP
>>>> ...
>>>> Instead of the OOM killer.
>>>>
>>>
>>> I miss a Fixes: or Cc: here for the backport you desired. To have it
>>> fixed back to my very introduction:
>>>
>>> Fixes: 4f24eda8401f ("ARM64: dts: Prepare configs for Amlogic Meson GXBaby")
>>>
>>> People backporting it would need to handle the meson-{gx => gxbb}.dtsi
>>> transition for 4.9 down to 4.6, which seems fairly straightforward.
>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>
>>>> Changes since v4 at [5]:
>>>> - Move start of ddr memory to reserved-memory node
>>>> - Drop memory node move
>>>> - Fix typo in sizes
>>>>
>>>> Changes since resent v2 at [4]:
>>>> - Fix invalid comment of useable memory attributes
>>>>
>>>> Changes since original v2 at [3]:
>>>> - Typo in commit 2GiB -> 1GiB, 4GiB -> 2GiB
>>>>
>>>> Changes since v2 at [2]:
>>>> - Moved all memory node out of dtsi
>>>> - Added comment about useable memory
>>>> - Fixed comment about secmon reserved zone
>>>>
>>>> Changes since v1 at [1] :
>>>> - Renamed reg into linux,usable-memory to ovveride u-boot memory
>>>> - only kept secmon memory zone
>>>>
>>>> [1] http://lkml.kernel.org/r/20161212101801.28491-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>> [2] http://lkml.kernel.org/r/1483105232-6242-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>> [3] http://lkml.kernel.org/r/1484128128-22454-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>> [4] http://lkml.kernel.org/r/1484128540-22662-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>> [5] http://lkml.kernel.org/r/1484129414-23325-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>>>> index eada0b5..63d52b7 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>>>> @@ -55,6 +55,24 @@
>>>>  	#address-cells = <2>;
>>>>  	#size-cells = <2>;
>>>>  
>>>> +	reserved-memory {
>>>> +		#address-cells = <2>;
>>>> +		#size-cells = <2>;
>>>> +		ranges;
>>>> +
>>>> +		/* 16 MiB reserved for Hardware ROM Firmware */
>>>> +		hwrom: hwrom {
>>>
>>> Both sub-nodes get a label that is unused, but reserved-memory itself
>>> does not (my v4 remark). Intentional?
>>>
>>>> +			reg = <0x0 0x0 0x0 0x1000000>;
>>>> +			no-map;
>>>> +		};
>>>> +
>>>> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
>>>> +		secmon: secmon {
>>>
>>> I note that this .dtsi further down has a node /firmware/secure-monitor
>>> with label sm.
>>> a) Is there any naming convention such as secmon_mem to adopt here to
>>> avoid mixups with sm?
>>> b) Should this secmon node be referenced in the secure-monitor node via
>>> memory-node = <&secmon>; to model their connection, thereby giving the
>>> label a use? Or should we maybe merge the two nodes by moving the
>>> compatible string here?
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>
>> Answering my own question: the example labels use _reserved suffix.
>>
>>>> +			reg = <0x0 0x10000000 0x0 0x200000>;
>>
>> And since we use a reg property here, the node name should get a unit
>> address to avoid future dtc warnings/errors. Ditto for hwrom.
> 
> OK, I added Fixes:, your Reviewed-by, added the _reserved suffix and
> unit address and applied to v4.10/fixes.
> 
> Update patch below for reference.

Perfect, more than I expected.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
