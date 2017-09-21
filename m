From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] pinctrl: meson: clean pin offsets
Date: Thu, 21 Sep 2017 14:21:19 +0200
Message-ID: <CACRpkdYmO2PSKU-qkBMW7C35kHf=usfOoEAobQDMMdzd1RFSTw@mail.gmail.com>
References: <20170920133927.17390-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170920133927.17390-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 3:39 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:

> The initial goal of this series was move to TEST_N pin from the EE
> controller to AO controller, where it belongs. This meant modify the
> EE_OFF value.
>
> This offset is a quirk we brought from the vendor driver when it was
> initially merged. There no reason to keep this around and we could simply
> let pinctrl figure the pin base value.
>
> Removing this offset, while simple, ends up being quite a patch bomb.
> This is why I split the change over 5 first patches, so the important
> change, patch #1 remains visible. Of course, to avoid breaking bisect,
> these first 5 patches should be squashed into one. (If you prefer that I
> squash it myself, I may have to send you a PR as the patch would exceed
> VGER 100000 characters limit)
>
> The last change is this series, while not directly related, also requires
> to adjust the gpio-line-names property in DT. Having these changes going
> together would make it easier to coordinate the DTS changes.
>
> This was changeset has been test on gxbb P200, gxl libretech-cc.  It was
> also boot tested on meson8 (Thx Martin!)
>
> Jerome Brunet (8):
>   pinctrl: meson: remove offset from pinctrl
>   pinctrl: meson: remove offset continued - gxbb
>   pinctrl: meson: remove offset continued - gxl
>   pinctrl: meson: remove offset continued - meson8
>   pinctrl: meson: remove offset continued - meson8b
>   pinctrl: meson: get rid of pin_base
>   pinctrl: meson-gx: TEST_N belongs to the AO controller
>   pinctrl: meson-gxbb: add missing GPIOX_22 pin

Looks good just waiting for review from Carlo && || Kevin.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
