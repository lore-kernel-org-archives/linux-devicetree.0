From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 9/9] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Wed, 20 Dec 2017 08:44:39 +0100
Message-ID: <CACRpkdZaEjdGB2k6HdPt1_E0jRXEimEUxT9NmMwMw7OiyeqGLA@mail.gmail.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com> <1513610272-7824-10-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513610272-7824-10-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 4:17 PM, Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org> wrote:

> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>
> Add support of stm32mp157c evaluation board (part number: STM32MP157C-EV1)
> split in 2 elements:
> -Daughter board (part number: STM32MP157C-ED1)
>  which includes CPU, memory and power supply
> -Mother board (part number: STM32MP157C-EM1)
>  which includes external peripherals (like display, camera,...)
>  and extension connectors.
>
> The daughter board can run alone, this is why the device tree files
> are split in two layers, for the complete evaluation board (ev1)
> and for the daughter board alone (ed1).
>
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
(...)
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts

Evaluation boards are important because they set a pattern that customers
will use.

Please consider to include nodes for all GPIO blocks used in this
evaluation board, and add:

gpio-line-names = "foo", "bar" ...;

See for example
arch/arm/boot/dts/bcm2835-rpi-a.dts
arch/arm/boot/dts/ste-snowball.dts

It's good to have because probably you guys have proper schematics and
know rail names of the stuff connected to those GPIO lines and so on,
so you can give the lines proper names.

It will be helpful for people using the reference design, especially with the
new character device, and also sets a pattern for people doing devices
based on the reference design and we really want to do that.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
