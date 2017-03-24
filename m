From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/8] pinctrl: meson: add audio output pins
Date: Fri, 24 Mar 2017 12:52:44 -0700
Message-ID: <m2wpbeh2pf.fsf@baylibre.com>
References: <20170323165101.29262-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170323165101.29262-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's
        message of "Thu, 23 Mar 2017 17:50:53 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> This patchset adds the pinctrl definition and the related device-tree
> bindings of the i2s output and spdif output pins on the meson gxbb and
> gxl SoCs.
>
> This is part of the ongoing work to bring audio output suppot on the
> meson family. It was tested on the gxbb p200 and gxl p230.

Series looks good to me,

However, I'm not sure about Linus's preference, but most maintainers
(myself included) prefer a small description in the changelog, even if
it restates (with slightly more description) what's already in the
$SUBJECT.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
