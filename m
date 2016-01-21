From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Mediatek EFUSE Support
Date: Thu, 21 Jan 2016 14:32:16 +0000
Message-ID: <56A0EBF0.2020703@linaro.org>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com> <CAGS+omA8XK6ksd7Ma8yAUbkSsHR6yQxjFrV+HGbd83UiH6T51g@mail.gmail.com> <566E94CA.1050700@linaro.org> <56A0A5E1.5050105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A0A5E1.5050105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 21/01/16 09:33, Matthias Brugger wrote:
>
>
> On 14/12/15 11:07, Srinivas Kandagatla wrote:
>> Hi Andrew,
>>
>> On 14/12/15 04:27, Daniel Kurtz wrote:
>>> Hi Srinivas,
>>>
>>> On Thu, Nov 19, 2015 at 6:46 PM, Andrew-CT Chen
>>> <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>>> This patch adds EFUSE support driver which is used by other drivers
>>>> like thermal sensor and HDMI impedance.
>>>>
>>>> There are some efuses these fuses store things like calibration data,
>>>> speed bins.. etc. Drivers like thermal sensor, HDMI impedance would
>>>> read out this data for configuring the driver.
>>>>
>>>> Change in v2:
>>>> 1. Rebase to 4.4-rc1
>>>> 2. Modify the driver Makefile for more consistent with other drivers
>>>> 3. Modify the compatible string to "mediatek,mt8173-efuse" and
>>>> "mediatek,efuse"
>>>
>>> Do you still plan to queue this for v4.5?
>>>
>> Sorry guys, for the long delay in replying your pings, got busy with
>> regular office stuff :-)
>>
>> Yes, It should go in v4.5, I did send request with my sign-off to Greg,
>> he should take it via char-misc tree.
>>
>
> I can't see this patches in the char-misc tree [1].
> Can you please double check?

Hi Matthias,
Thanks for the patience. You should expect them to see after v4.5-rc1, 
that's when Greg said he would push the patches.

thanks,
srini
>
> Thanks,
> Matthias
>
> [1] https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/
>
>> Thanks,
>> srini
>>>>
>>>> Andrew-CT Chen (3):
>>>>    dt-bindings: add document of mediatek efuse driver
>>>>    nvmem: mediatek: Add Mediatek EFUSE driver
>>>>    dts: arm64: Add EFUSE device node
>>>>
>>>>   .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++++
>>>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  5 ++
>>>>   drivers/nvmem/Kconfig                              | 11 +++
>>>>   drivers/nvmem/Makefile                             |  2 +
>>>>   drivers/nvmem/mtk-efuse.c                          | 89
>>>> ++++++++++++++++++++++
>>>>   5 files changed, 143 insertions(+)
>>>>   create mode 100644
>>>> Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>>>>   create mode 100644 drivers/nvmem/mtk-efuse.c
>>>>
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> linux-kernel" in
>>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
