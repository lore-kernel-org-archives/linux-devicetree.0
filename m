From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: dts: meson: clean pin offsets
Date: Fri, 06 Oct 2017 15:30:03 -0700
Message-ID: <7ha8139afo.fsf@baylibre.com>
References: <20170921171450.27407-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921171450.27407-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's
        message of "Thu, 21 Sep 2017 19:14:43 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> The series is the device-tree part of the series sent to pinctrl [0]
> The present patchset depends on the pinctrl part.
>
> The purpose of this series is to:
> 1) remove the hardcoded gpio offset
> 2) adjust gpio-ranges with respect to the new pin number of each
>    controller
> 3) adjust gpio-line-names accordingly for the boards having this property.
>
> [0]: https://lkml.kernel.org/r/20170918134610.17743-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

Seeing the driver part is now merged, applying to v4.15/dt64,

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
