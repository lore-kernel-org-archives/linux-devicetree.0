From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 0/6] SMP and CPU hotplug support for Meson8/Meson8b
Date: Sun, 29 Oct 2017 16:31:55 +0100
Message-ID: <7hwp3eug0k.fsf@baylibre.com>
References: <20170917164523.6970-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170917164523.6970-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sun, 17 Sep 2017 18:45:17 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> This patchset adds support for booting the secondary CPU cores (and
> taking them offline again) on Amlogic Meson8 and Meson8b SoCs.
> It is based on an earlier version from Carlo Caione - this helped me
> a lot to get a better understanding of how SMP/CPU hotplug works
> (compared to the code found in Amlogic's GPL kernel sources from
> year 2015).

[...]

> Carlo Caione (2):
>   dt-bindings: Amlogic: Add Meson8 and Meson8b SMP related documentation
>   ARM: dts: meson8b: add support for booting the secondary CPU cores

Applied to v4.15/dt...

> Martin Blumenstingl (4):
>   ARM: smp_scu: add a helper for powering on a specific CPU
>   ARM: smp_scu: allow the platform code to read the SCU CPU status
>   ARM: meson: Add SMP bringup code for Meson8 and Meson8b
>   ARM: dts: meson8: add support for booting the secondary CPU cores

Applied to v4.15/soc with Russell's ack.

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
