From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [v17 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Date: Tue, 25 Oct 2016 14:23:01 +0200
Message-ID: <e00519e2-990c-b9b2-71d4-a4c8d36f5e65@gmail.com>
References: <1472280263-18177-1-git-send-email-jitao.shi@mediatek.com>
 <1472280263-18177-2-git-send-email-jitao.shi@mediatek.com>
 <CAFqH_50_OwsbMWHkT_eukF52BVZYyMbGiamXO=pV4PpJq6BADA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqH_50_OwsbMWHkT_eukF52BVZYyMbGiamXO=pV4PpJq6BADA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, dri-devel <dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, bibby.hsieh@mediatek.com, ck.hu@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Yingjoe Chen <yingjoe>
List-Id: devicetree@vger.kernel.org



On 10/18/2016 04:37 PM, Enric Balletbo Serra wrote:
[...]
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
[...]
>> +
>> +/* Firmware */
>> +#define PS_FW_NAME             "ps864x_fw.bin"
>> +
>
> From where I can download this firmware image?
>

I suppose this FW bits have to be added to linux-firmware repository 
first, before this patch can be accepted.

Regards,
Matthias
