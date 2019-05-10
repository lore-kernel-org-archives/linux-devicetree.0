Return-Path: <SRS0=FVw4=TK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com> <20190509201142.10543-12-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-12-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 May 2019 09:07:07 +0200
Message-ID: <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, May 9, 2019 at 10:14 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -614,7 +618,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>                 dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
>         }
>
> -       if (dparam->type == USBHS_TYPE_RZA1) {
> +       if (dparam->type == USBHS_TYPE_RZA1 ||
> +           dparam->type == USBHS_TYPE_RZA2) {
>                 dparam->pipe_configs = usbhsc_new_pipe;
>                 dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);

The above two lines are also present in the block for R-Car Gen2/3 above.
Perhaps they can just be moved out, and executed unconditionally?
That leaves R-Car with just the has_usb_dmac feature flag.

BTW, this driver uses a mix of feature checking using USBHS_TYPE_*
enums, and a parameter block/callback struct
(renesas_usbhs_platform_callback).  Perhaps the feature flags can just
be moved to the struct, and the various structs referenced from
of_device_id.data?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
