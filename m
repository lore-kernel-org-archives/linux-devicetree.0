From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 10/22] ARM: dts: r7s72100: Add generic compatible
 string for I2C EEPROM
Date: Thu, 13 Apr 2017 21:52:27 +0200
Message-ID: <CAMuHMdWXbKK-BA8KwnQ=QOsLwYpHu0GfbW52NTFE1N9C-HfZ2Q@mail.gmail.com>
References: <20170413182839.25381-1-javier@osg.samsung.com> <20170413182839.25381-11-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413182839.25381-11-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 8:28 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
>
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
>
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> @@ -57,7 +57,7 @@
>         clock-frequency = <400000>;
>
>         eeprom@50 {
> -               compatible = "renesas,24c128";
> +               compatible = "renesas,24c128","atmel,24c128";

Missing space after comma.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
