From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Mediatek EFUSE Support
Date: Mon, 14 Dec 2015 12:27:16 +0800
Message-ID: <CAGS+omA8XK6ksd7Ma8yAUbkSsHR6yQxjFrV+HGbd83UiH6T51g@mail.gmail.com>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447930014-19579-1-git-send-email-andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

On Thu, Nov 19, 2015 at 6:46 PM, Andrew-CT Chen
<andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> This patch adds EFUSE support driver which is used by other drivers
> like thermal sensor and HDMI impedance.
>
> There are some efuses these fuses store things like calibration data,
> speed bins.. etc. Drivers like thermal sensor, HDMI impedance would
> read out this data for configuring the driver.
>
> Change in v2:
> 1. Rebase to 4.4-rc1
> 2. Modify the driver Makefile for more consistent with other drivers
> 3. Modify the compatible string to "mediatek,mt8173-efuse" and "mediatek,efuse"

Do you still plan to queue this for v4.5?

>
> Andrew-CT Chen (3):
>   dt-bindings: add document of mediatek efuse driver
>   nvmem: mediatek: Add Mediatek EFUSE driver
>   dts: arm64: Add EFUSE device node
>
>  .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  5 ++
>  drivers/nvmem/Kconfig                              | 11 +++
>  drivers/nvmem/Makefile                             |  2 +
>  drivers/nvmem/mtk-efuse.c                          | 89 ++++++++++++++++++++++
>  5 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>  create mode 100644 drivers/nvmem/mtk-efuse.c
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
