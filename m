From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 0/8] arm64: Add initial Actions Semi S700 and
 CubieBoard7 support
Date: Thu, 7 Dec 2017 12:30:07 +0100
Message-ID: <2742e6af-2195-1f47-92eb-524107e426bd@suse.de>
References: <20171113233427.5386-1-afaerber@suse.de>
 <e43387f9-60a6-129b-d0e9-dff6d0df301a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e43387f9-60a6-129b-d0e9-dff6d0df301a-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeff Chen <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Ahha Lee <lee-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org>
Cc: Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5qKF5Yip?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, support-om/0PrzuAKC1Z/+hSey0Gg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 07.12.2017 um 10:20 schrieb Daniel Lezcano:
> On 14/11/2017 00:34, Andreas Färber wrote:
>> Hello,
>>
>> This series prepares the Actions Semi S700 SoC and Cubietech CubieBoard7.
>> It boots equally far as the S900 based Bubblegum-96 these patches are based on,
>> i.e. into an initrd with serial and all four cores up.
>>
>> v2 modifies the clocksource driver patches and adds SPS patches.
>>
>> Not having succeeded to replace the bootloader on eMMC or to try
>> booting from SD, the only working way I've found to boot mainline kernels
>> appears to be booting into Android, then issuing "reboot bootloader". U-Boot
>> is lacking the saveenv command, so it wasn't possible to change the bootdelay
>> to facilitate this.
> 
> Is it possible this change fixes your issue ?
> 
> http://git.denx.de/?p=u-boot.git;a=commit;h=c9e87ba66540cf72c164674a71af43853d087ba8

Actions is not yet supported in mainline U-Boot, and S500 boards did not
have a problem there. The saveenv command is simply not enabled in this
config deployed by Cubietech. Since I have not succeeded in getting a
self-built U-Boot booted from SD, I cannot test individual commits on
top either.

Maybe Cubietech or Actions can comment?

Regards,
Andreas

>> Cf. https://en.opensuse.org/HCL:CubieBoard7

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
