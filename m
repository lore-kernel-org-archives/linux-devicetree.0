From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [v17 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Fri, 4 Nov 2016 17:21:14 -0600
Message-ID: <CAGS+omDmFdqzuFqcCe9gFGemZc88Yt0_3_o2KwOgW=GN_kCakQ@mail.gmail.com>
References: <1472280263-18177-1-git-send-email-jitao.shi@mediatek.com>
 <1472280263-18177-2-git-send-email-jitao.shi@mediatek.com>
 <CAFqH_50_OwsbMWHkT_eukF52BVZYyMbGiamXO=pV4PpJq6BADA@mail.gmail.com> <e00519e2-990c-b9b2-71d4-a4c8d36f5e65@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e00519e2-990c-b9b2-71d4-a4c8d36f5e65@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, dri-devel <dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <bibby.hsieh@mediatek.com>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 6:23 AM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> On 10/18/2016 04:37 PM, Enric Balletbo Serra wrote:
> [...]
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> [...]
>>>
>>> +
>>> +/* Firmware */
>>> +#define PS_FW_NAME             "ps864x_fw.bin"
>>> +
>>
>> From where I can download this firmware image?
>
> I suppose this FW bits have to be added to linux-firmware repository first, before this patch can be accepted.

All PS8640 devices should already ship with working firmware.
The firmware update procedure is only used in the unlikely event where
one wants to update the bridge to a different firmware provided by
Parade.

Why must the lack of firmware really block landing this driver?

If this is really so, can we just land the functional part of the
driver first, and add the firmware update in a follow-up patch.

>
> Regards,
> Matthias
