From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] soc: amlogic: Add Meson6/8/8b SoC Information driver
Date: Fri, 06 Oct 2017 15:38:13 -0700
Message-ID: <7h60br9a22.fsf@baylibre.com>
References: <20170923141403.20882-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170923141403.20882-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sat, 23 Sep 2017 16:14:00 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> The 32-bit Amlogic SoC have some registers which contain some information
> the SoC's major and version, as well as a "major version".
> This patchset adds support for this register decoding and exposing with the
> SoC bus infrastructure, with dt-bindings and DT node.
>
> This is inspired by Neil's Meson GX socinfo driver, see [0]
>
> All information was taken from Amlogic's 3.10 GPL kernel sources because
> the public S805 datasheet from Hardkernel does not contain any relevant
> information for these register blocks.
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004187.html
>
> Martin Blumenstingl (3):
>   dt-bindings: Amlogic: add documentation for the SoC info register
>     areas

Applied to v4.15/dt

>   soc: amlogic: Add Meson6/Meson8/Meson8b/Meson8m2 SoC Information
>     driver

Applied to v4.15/drivers

>   ARM: dts: meson: add SoC information nodes

Applied to v4.15/dt

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
