From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 0/2] meson: saradc: drop the sana clock
Date: Wed, 06 Dec 2017 11:52:44 -0800
Message-ID: <7h609jskfn.fsf@baylibre.com>
References: <20171116090115.29915-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116090115.29915-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> (Yixun Lan's
        message of "Thu, 16 Nov 2017 17:01:13 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> writes:

> This is a rework for the patch [v4 4/4] of previous series,
> which mean this will make the patch [1] obsolete.
>
> Changes since v4:
>  * separate DTS for ARM(32bit) vs ARM64
>  * add ACK from Martin

Thanks for splitting it up.

> [1] [PATCH v4 4/4] ARM64: dts: meson: drop "sana" clock from SAR ADC
> http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005266.html
>
> Xingyu Chen (2):
>   ARM64: dts: meson: drop "sana" clock from SAR ADC

Applied to v4.16/dt64

>   ARM: dts: meson: drop "sana" clock from SAR ADC

Applied to v4.16/dt

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
