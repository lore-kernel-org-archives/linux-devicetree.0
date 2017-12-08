From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxm: fix q200 interrupt number
Date: Fri, 08 Dec 2017 10:49:25 -0800
Message-ID: <7hr2s5m4wa.fsf@baylibre.com>
References: <20171204100504.7741-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204100504.7741-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's
        message of "Mon, 4 Dec 2017 11:05:04 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Correct the interrupt number assigned to the Realtek PHY in the q200
>
> Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
> Reported-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>
>  This change depends on the related series from Martin [0]
>  Thanks for catching it Martin !

Applied to v4.16/dt64 on top of Martin's series.

> [0]: https://lkml.kernel.org/r/20171202214037.17017-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org

FYI: This results in: No such Message-ID known.

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
