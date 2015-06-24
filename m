From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8173: Add I2C device node
Date: Wed, 24 Jun 2015 19:00:42 +0800
Message-ID: <CAGS+omC0n1eADRCy58a4C=w9LikPvQv=bHopNTE1XXW3h7zRLA@mail.gmail.com>
References: <1433164107-26568-1-git-send-email-eddie.huang@mediatek.com>
 <1433164107-26568-3-git-send-email-eddie.huang@mediatek.com> <5279457.I1q8kC8mJN@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5279457.I1q8kC8mJN@ubix>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Wed, Jun 24, 2015 at 4:04 AM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Monday, June 01, 2015 09:08:27 PM Eddie Huang wrote:
>> Add MT8173 I2C device nodes, include I2C controllers and pins.
>> MT8173 has six I2C controllers, from i2c0 to i2c6, exclude i2c5.
>> The 6th I2C controller register base doesn't next to 5th I2C,
>> and there is a hardware between 5th and 6th I2C controller. So
>> SoC designer name 6th controller as "i2c6", not "i2c5".
>>
>> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>
> applied to v4.2-next/arm64

It looks like [0] has the pinctrl changes, but lost the actual i2c nodes.

[0] https://github.com/mbgg/linux-mediatek/commit/0afbf26eda52831560e9f60427751ab8b2641eef

Thanks,
-Dan

>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
