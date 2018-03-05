Return-Path: <SRS0=9mlS=F3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:42094 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751462AbeCER0p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Mar 2018 12:26:45 -0500
MIME-Version: 1.0
In-Reply-To: <1520270260-16009-1-git-send-email-geert+renesas@glider.be>
References: <1520270260-16009-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Mar 2018 18:26:44 +0100
Message-ID: <CAMuHMdXsvGcBgNAn3_pVD3q68yzP_chvkjvDZUwpSsYhiYkT3w@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Add support for dynamic instances
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-serial@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

CC devicetree

On Mon, Mar 5, 2018 at 6:17 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> On DT platforms, the sh-sci driver requires the presence of "serialN"
> aliases in DT, from which instance IDs are derived.  If a DT alias is
> missing, the drivers fails to probe the corresponding serial port.
>
> This becomes cumbersome when considering DT overlays, as currently
> there is no upstream support for dynamically updating the /aliases node
> in DT.  Furthermore, even in the presence of such support, hardcoded
> instance IDs in independent overlays are prone to conflicts.
>
> Hence add support for dynamic instance IDs, to be used in the absence of
> a DT alias.  This makes serial ports behave similar to I2C and SPI
> buses, which already support dynamic instances.
>
> Ports in use are tracked using a simple bitmask of type unsigned long,
> which is sufficient to handle all current hardware (max. 18 ports).
> The maximum number of serial ports is still fixed, and configurable
> through Kconfig.  Range validation is done through both Kconfig and a
> compile-time check.
>
> Due to the fixed maximum number of serial ports, dynamic and static
> instances share the same ID space.  Static instances added later are
> rejected when conflicting with dynamic instances registered earlier.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/Kconfig  | 2 ++
>  drivers/tty/serial/sh-sci.c | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 3682fd3e960cbd64..76005dc5f6246593 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -762,6 +762,8 @@ config SERIAL_SH_SCI
>
>  config SERIAL_SH_SCI_NR_UARTS
>         int "Maximum number of SCI(F) serial ports" if EXPERT
> +       range 1 64 if 64BIT
> +       range 1 32 if !64BIT
>         depends on SERIAL_SH_SCI
>         default "3" if H8300
>         default "10" if SUPERH
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 9e1dfbb4b40bf849..3a03d391fcc72656 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -159,6 +159,7 @@ struct sci_port {
>  #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
>
>  static struct sci_port sci_ports[SCI_NPORTS];
> +static unsigned long sci_ports_in_use;
>  static struct uart_driver sci_uart_driver;
>
>  static inline struct sci_port *
> @@ -3011,6 +3012,7 @@ static int sci_remove(struct platform_device *dev)
>  {
>         struct sci_port *port = platform_get_drvdata(dev);
>
> +       sci_ports_in_use &= ~BIT(port->port.line);
>         uart_remove_one_port(&sci_uart_driver, &port->port);
>
>         sci_cleanup_single(port);
> @@ -3092,6 +3094,8 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>
>         /* Get the line number from the aliases node. */
>         id = of_alias_get_id(np, "serial");
> +       if (id < 0 && ~sci_ports_in_use)
> +               id = ffz(sci_ports_in_use);
>         if (id < 0) {
>                 dev_err(&pdev->dev, "failed to get alias id (%d)\n", id);
>                 return NULL;
> @@ -3126,6 +3130,9 @@ static int sci_probe_single(struct platform_device *dev,
>                 dev_notice(&dev->dev, "Consider bumping CONFIG_SERIAL_SH_SCI_NR_UARTS!\n");
>                 return -EINVAL;
>         }
> +       BUILD_BUG_ON(SCI_NPORTS > sizeof(sci_ports_in_use) * 8);
> +       if (sci_ports_in_use & BIT(index))
> +               return -EBUSY;
>
>         mutex_lock(&sci_uart_registration_lock);
>         if (!sci_uart_driver.state) {
> @@ -3224,6 +3231,7 @@ static int sci_probe(struct platform_device *dev)
>         sh_bios_gdb_detach();
>  #endif
>
> +       sci_ports_in_use |= BIT(dev_id);
>         return 0;
>  }
>
> --
> 2.7.4
