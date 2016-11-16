From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the second USB PHY
Date: Wed, 16 Nov 2016 13:35:57 -0800
Message-ID: <m2twb7w1j6.fsf@baylibre.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
        <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
        <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161112131305.26088-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sat, 12 Nov 2016 14:13:05 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> When the USB PHY driver was introduced the reset framework did not
> have support for triggering a reset pulse for shared resets. On GXBB
> however there is only one reset line for both PHYs (meaning we have a
> shared reset line). With the latest changes to the reset framework and
> the corresponding updates to the phy-meson8b-usb2 driver we can now pass
> the reset to the second PHY as well.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Applied.

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
