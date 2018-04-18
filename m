Return-Path: <SRS0=rS5h=HH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1524039005-30618-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Apr 2018 10:47:55 +0200
Message-ID: <CAMuHMdUmHsXnU27JAyA9dq545NLYRb1ypMpdRZ6o0O3MrtfmTQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 08/11] usb: role: rcar-usb3-role-switch: add support
 for R-Car SoCs
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Wed, Apr 18, 2018 at 10:10 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds role switch support for R-Car SoCs. Some R-Car SoCs
> (e.g. R-Car H3) have USB 3.0 dual-role device controller which has
> the USB 3.0 xHCI host and Renesas USB 3.0 peripheral.
>
> Unfortunately, the mode change register contains the USB 3.0 peripheral
> controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
> manages this register. However, in peripheral mode, the host should
> stop. Also the host hardware needs to reinitialize its own registers
> when the mode changes from peripheral to host mode. Otherwise,
> the host cannot work correctly (e.g. detect a device as high-speed).
>
> To achieve this by a driver, this role switch driver manages
> the mode change register and attach/release the xhci-plat driver.
> The renesas_usb3 udc driver should call devm_of_platform_populate()
> to probe this driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/usb/roles/Kconfig
> +++ b/drivers/usb/roles/Kconfig
> @@ -11,4 +11,16 @@ config USB_ROLES_INTEL_XHCI
>           To compile the driver as a module, choose M here: the module will
>           be called intel-xhci-usb-role-switch.
>
> +config USB_ROLES_RCAR_USB3
> +       tristate "Renesas R-Car USB3.0 Role Switch"
> +       depends on ARCH_RENESAS && OF

ARCH_RENESAS implies OF.

Perhaps you intended:

        depends on OF
        depends on ARCH_RENESAS || COMPILE_TEST

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
