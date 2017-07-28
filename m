From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] Add PWM support for Meson8
Date: Fri, 28 Jul 2017 09:43:44 -0700
Message-ID: <7hziboqzpb.fsf@baylibre.com>
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Wed, 12 Jul 2017 00:20:13 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> This series moves the pwm_ab and pwm_cd nodes to the common meson.dtsi.
> According to Amlogic's GPL kernel sources Meson6 contains the same PWM
> IP blocks for pwm_ab and pwm_cd (at the same register offsets) as Meson8
> and Meson8b.
>
> pwm_ef on the other hand does not exist on Meson6, so it stays in
> meson8b.dtsi (and is added to meson8b.dtsi).
>
> Known usages of the PWM controllers:
> - controlling the brightness of the system LED
> - generating the 32.768kHz wifi LPO clock
> - controlling the VDDEE (CPU) voltage

Applied to v4.14/dt,

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
