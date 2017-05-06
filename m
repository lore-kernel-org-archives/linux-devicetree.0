From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 0/2] Amlogic Meson (32-bit) .dts cleanups
Date: Sat, 6 May 2017 19:29:22 +0200
Message-ID: <CAFBinCDSv7GZh8bkAO_NuLibVAiwjSBXzwGFTmTixro-MNg+wQ@mail.gmail.com>
References: <20170417213938.22626-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170417213938.22626-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kevin, Hi Carlo,

On Mon, Apr 17, 2017 at 11:39 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> This series provides a few cleanups in the 32-bit Amlogic .dts files.
>
> The first patch introduces the actual busses so the .dts' basic structure
> is similar to what we have in the 64-bit .dts files.
>
> The second patch removes even more duplication by inheriting meson.dtsi
> from meson8b.dtsi (just like meson6.dtsi and meson8.dtsi are doing).
>
> There should not be any functional changes with these patches. However,
> I was only test this on a Meson8 based device, so it would be great if
> somebody could test this on a Meson8b device.
>
>
> Martin Blumenstingl (2):
>   ARM: dts: meson: organize devices in their corresponding busses
>   ARM: dts: meson8b: inherit meson.dtsi from meson8b.dtsi
>
>  arch/arm/boot/dts/meson.dtsi   | 180 ++++++++++++++++++-----------------
>  arch/arm/boot/dts/meson6.dtsi  |   2 -
>  arch/arm/boot/dts/meson8.dtsi  | 116 +++++++++++++++--------
>  arch/arm/boot/dts/meson8b.dtsi | 210 +++++++++++++++++------------------------
>  4 files changed, 255 insertions(+), 253 deletions(-)
>
> --
> 2.12.2
>
unfortunately I don't have a Meson8b device where I could test this.
can we let kernelci test this on the Odroid-C1? Meson8b can currently
only boot ramdisks (no MMC, no USB, etc.) - so I think kernelci would
catch all regressions (if there are any)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
