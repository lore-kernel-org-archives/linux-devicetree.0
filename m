From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: meson: add the efuse node
Date: Sat, 21 Oct 2017 00:04:49 +0200
Message-ID: <CAFBinCAtcWERQbH4Q8XRYMyYctwWEj0bX+Ud5oRyhOuOiYjqew@mail.gmail.com>
References: <20171002232804.20042-1-martin.blumenstingl@googlemail.com> <20171002232804.20042-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002232804.20042-5-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Tue, Oct 3, 2017 at 1:28 AM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Meson6, Meson8 and Meson8b use a similar IP block which has access to
> 512 bytes of efuse data.
> During SoC manufacturing some calibration settings for the CVBS
> connector and the internal temperature sensor are written to this efuse.
> On some boards it additionally stores for example the MAC addresses.
>
> The efuse is enabled on Meson8 and Meson8b but kept disabled on Meson6
> since we do not have a clock driver there (which is required to read
> data from the efuse).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson.dtsi   | 15 +++++++++++++++
>  arch/arm/boot/dts/meson6.dtsi  |  3 +++
>  arch/arm/boot/dts/meson8.dtsi  |  6 ++++++
>  arch/arm/boot/dts/meson8b.dtsi |  7 +++++++
>  4 files changed, 31 insertions(+)
the dt-binding documentation and driver were queued for v4.15 today.
could you please have a look at this patch and queue it for v4.15 as
well (if everything is fine)?

[snip]


thank you!
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
