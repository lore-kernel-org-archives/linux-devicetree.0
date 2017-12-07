From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] add Meson8/Meson8b serial core clock handling
Date: Wed, 06 Dec 2017 17:05:52 -0800
Message-ID: <7hvahjl53j.fsf@baylibre.com>
References: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117225857.9571-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Fri, 17 Nov 2017 23:58:55 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, hgkr.klein-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> This patchset adds the tty/serial core clock handling to the UARTs
> on Meson8 and Meson8b.
>
> Basically this is the Meson8 and Meson8b version of a patchset from
> Helmut Klein and Neil Armstrong, who implemented this for Meson GX
> (see [0]). Back then I asked Neil to drop Meson8b from his patchset
> because I was working on the Meson8 clock controller at that time.
>
> This also removes the last users that rely on the "amlogic,meson-uart"
> binding. Removing that binding from the meson_uart driver is not part
> of this series though.

I mistakenly replied to the v1 of this series.  It's this version (v2)
that I applied to v4.16/dt.

Sorry for the confusion, and thanks for the patches!

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
