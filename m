From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4] ARM64: dts: meson-gx: Add reserved memory zone and
 usable memory range
Date: Sun, 15 Jan 2017 15:43:15 +0100
Message-ID: <d3a00788-c3c1-4b10-90bf-2a8bc6a138f8@suse.de>
References: <1484129414-23325-1-git-send-email-narmstrong@baylibre.com>
 <m21sw66828.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m21sw66828.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xypron.glpk-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 13.01.2017 um 21:03 schrieb Kevin Hilman:
> Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> 
>> The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
>> this patch adds this reserved zone and redefines the usable memory range.
>>
>> The memory node is also moved from the dtsi files into the proper dts files
>> to handle variants memory sizes.
>>
>> This patch also fixes the memory sizes for the following platforms :
>> - gxl-s905x-p212 : 1GiB instead of 2GiB, a proper 2GiB dts should be pushed
>> - gxm-s912-q201 : 1GiB instead of 2GiB, a proper 2GiB dts should be pushed
>> - gxl-s905d-p231 : 1GiB instead of 2GiB, a proper 2GiB dts should be pushed
>> - gxl-nexbox-a95x : 1GiB instead of 2GiB, a proper 2GiB dts should be pushed
>>
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> Queued for v4.10-rc.

What is the motivation for this change? I have a local U-Boot patch to
detect the amount of memory available as done downstream, but U-Boot
only updates the reg property that you seem to be abandoning here...

So for devices that come in multiple RAM configurations - like R-Box Pro
- this would require separate .dts files now! This looks very wrong to
me, especially since I am not aware of other platforms doing the same.
Instead, there's memory reservations for top and bottom done in U-Boot
for reg, plus reserved-memory nodes for anything in the middle.

Another thing to consider is that uEFI boot (bootefi) handles memory
reservation differently yet again, on the bootloader level. I have had
that working fine on Odroid-C2 and Vega S95.

So if there's no bug this is fixing (none mentioned in commit message) I
strongly object to this patch.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
