From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC
Date: Sun, 1 May 2016 11:03:55 +0200
Message-ID: <CACRpkdbfSgVH_zGMdgyfvBbnpiTkd7dzugza4_w0_7MLMVNzyA@mail.gmail.com>
References: <1462036875-22625-1-git-send-email-carlo@caione.org>
	<1462036875-22625-2-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462036875-22625-2-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 30, 2016 at 7:21 PM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> This patch adds the basic platform file to support the pin controller
> found on the Amlogic Meson GXBB SoCs.
>
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   2 +

This thing conflicts with upstream. Make a separate patch for
updating the bindings I think.

>  arch/arm64/Kconfig.platforms                       |   2 +

This needs to be split off and sent separatelt to the ARM64
maintainers. Since it's just a symbol dependency (I think?) it
can be merged orthogonally.

>  drivers/pinctrl/meson/Makefile                     |   2 +-
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c         | 432 +++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.c              |   8 +
>  drivers/pinctrl/meson/pinctrl-meson.h              |   2 +
>  include/dt-bindings/gpio/meson-gxbb-gpio.h         | 154 ++++++++
>  7 files changed, 601 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>  create mode 100644 include/dt-bindings/gpio/meson-gxbb-gpio.h

This stuff I can merge, if I get it in a separate patch.

> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index 32f4a2d..fe7fe0b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -5,6 +5,8 @@ Required properties for the root node:
>                       "amlogic,meson8b-cbus-pinctrl"
>                       "amlogic,meson8-aobus-pinctrl"
>                       "amlogic,meson8b-aobus-pinctrl"
> +                     "amlogic,meson-gxbb-periphs-pinctrl"
> +                     "amlogic,meson-gxbb-aobus-pinctrl"

This is not how upstream looks...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
