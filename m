From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [v17 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Mon, 7 Nov 2016 17:53:42 +0100
Message-ID: <3e2dfdfd-9d87-b49a-4012-6027bdca10f5@gmail.com>
References: <1472280263-18177-1-git-send-email-jitao.shi@mediatek.com>
 <1472280263-18177-2-git-send-email-jitao.shi@mediatek.com>
 <CAFqH_50_OwsbMWHkT_eukF52BVZYyMbGiamXO=pV4PpJq6BADA@mail.gmail.com>
 <e00519e2-990c-b9b2-71d4-a4c8d36f5e65@gmail.com>
 <CAGS+omDmFdqzuFqcCe9gFGemZc88Yt0_3_o2KwOgW=GN_kCakQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omDmFdqzuFqcCe9gFGemZc88Yt0_3_o2KwOgW=GN_kCakQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, stonea168-9Onoh4P/yGk@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 05/11/16 00:21, Daniel Kurtz wrote:
> On Tue, Oct 25, 2016 at 6:23 AM, Matthias Brugger
> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> On 10/18/2016 04:37 PM, Enric Balletbo Serra wrote:
>> [...]
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>> [...]
>>>>
>>>> +
>>>> +/* Firmware */
>>>> +#define PS_FW_NAME             "ps864x_fw.bin"
>>>> +
>>>
>>> From where I can download this firmware image?
>>
>> I suppose this FW bits have to be added to linux-firmware repository first, before this patch can be accepted.
>
> All PS8640 devices should already ship with working firmware.
> The firmware update procedure is only used in the unlikely event where
> one wants to update the bridge to a different firmware provided by
> Parade.
>
> Why must the lack of firmware really block landing this driver?
>
> If this is really so, can we just land the functional part of the
> driver first, and add the firmware update in a follow-up patch.
>

After checking other users of request_firmware and check them against 
linux-firmware I think we don't need the FW in linux-firmware to get the 
driver merged. Especially as there already is a working FW stored on the 
device.

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
