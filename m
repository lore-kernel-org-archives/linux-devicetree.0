From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 0/6] Add Meson 8b / GXBB support to the IR driver
Date: Mon, 29 Aug 2016 14:28:10 -0500
Message-ID: <m2shtniddh.fsf@baylibre.com>
References: <20160819215547.20063-1-martin.blumenstingl@googlemail.com>
        <20160820095424.636-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160820095424.636-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> (Martin
        Blumenstingl's message of "Sat, 20 Aug 2016 11:54:18 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> Newer Amlogic platforms (Meson 8b and GXBB) use a slightly different
> register layout for their Infrared Remoete Controller. The decoder mode
> is now configured in another register. Without the changes to the
> meson-ir driver we are simply getting incorrect "durations" reported
> from the hardware (because the hardware is not in time measurement aka
> software decode mode).
>
> This problem was also noticed by some people trying to use this on an
> ODROID-C1 and ODROID-C2 - the workaround there (probably because the
> datasheets were not publicy available yet at that time) was to switch
> to ir_raw_event_store_edge (which leaves it up to the kernel to measure
> the duration of a pulse). See [0] and [1] for the corresponding
> patches.
>
> Changes in v5:
> - changed pin function and group names to remote_input_ao so they match
>   with the datasheet
>
> Tested-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Thanks for the respin.  I'll take the driver and DT/bindings through the
arm-soc tree and Linus has taken the pinctrl patch.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
