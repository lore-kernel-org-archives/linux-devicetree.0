From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxl-libretech-cc: enable saradc
Date: Fri, 06 Oct 2017 14:24:11 -0700
Message-ID: <7hzi947yx0.fsf@baylibre.com>
References: <20170905170955.13135-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905170955.13135-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's
        message of "Tue, 5 Sep 2017 19:09:55 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Enable saradc and add the reference 1.8v regulator required.
> The libretech-cc has saradc channel 0 and 2 available on the 2 first
> pins of 2J3 header
>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Appled to v4.15/dt64,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
