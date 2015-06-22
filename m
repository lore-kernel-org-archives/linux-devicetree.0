From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: cros-ec-keyboard: Add support for some
 Japanese keys
Date: Mon, 22 Jun 2015 08:25:59 -0700
Message-ID: <CAD=FV=U2BpMqBdOCihc9CAc2Q0gvECgH9Qm8e1XvQ-4ftWqrBA@mail.gmail.com>
References: <1430874218-27738-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430874218-27738-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 5, 2015 at 6:03 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Add support for 4 Japanese keys
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> ---
>
>  arch/arm/boot/dts/cros-ec-keyboard.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> index 9c7fb0a..4e42f30c 100644
> --- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> +++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> @@ -22,6 +22,7 @@
>                         MATRIX_KEY(0x00, 0x02, KEY_F1)
>                         MATRIX_KEY(0x00, 0x03, KEY_B)
>                         MATRIX_KEY(0x00, 0x04, KEY_F10)
> +                       MATRIX_KEY(0x00, 0x05, KEY_RO)
>                         MATRIX_KEY(0x00, 0x06, KEY_N)
>                         MATRIX_KEY(0x00, 0x08, KEY_EQUAL)
>                         MATRIX_KEY(0x00, 0x0a, KEY_RIGHTALT)
> @@ -34,6 +35,7 @@
>                         MATRIX_KEY(0x01, 0x08, KEY_APOSTROPHE)
>                         MATRIX_KEY(0x01, 0x09, KEY_F9)
>                         MATRIX_KEY(0x01, 0x0b, KEY_BACKSPACE)
> +                       MATRIX_KEY(0x01, 0x0c, KEY_HENKAN)
>
>                         MATRIX_KEY(0x02, 0x00, KEY_LEFTCTRL)
>                         MATRIX_KEY(0x02, 0x01, KEY_TAB)
> @@ -45,6 +47,7 @@
>                         MATRIX_KEY(0x02, 0x07, KEY_102ND)
>                         MATRIX_KEY(0x02, 0x08, KEY_LEFTBRACE)
>                         MATRIX_KEY(0x02, 0x09, KEY_F8)
> +                       MATRIX_KEY(0x02, 0x0a, KEY_YEN)
>
>                         MATRIX_KEY(0x03, 0x01, KEY_GRAVE)
>                         MATRIX_KEY(0x03, 0x02, KEY_F2)
> @@ -53,6 +56,7 @@
>                         MATRIX_KEY(0x03, 0x06, KEY_6)
>                         MATRIX_KEY(0x03, 0x08, KEY_MINUS)
>                         MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)
> +                       MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)
>
>                         MATRIX_KEY(0x04, 0x00, KEY_RIGHTCTRL)
>                         MATRIX_KEY(0x04, 0x01, KEY_A)
> --
> 1.9.1

Is anyone planning to pick up this trivial change?

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
