Return-Path: <SRS0=znRT=TH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com> <20190506234631.113226-2-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 10:01:55 +0200
Message-ID: <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 7, 2019 at 1:47 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2 has optional dedicated 48MHz crystal inputs, which adds a new
> register setting when used.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

> @@ -630,6 +635,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> +               channel->uses_usb_x1 = true;
> +

Perhaps this can be checked some other way (e.g. by checking for a non-zero
clock rate of the USB_X1 clock referenced from DT), thus removing the need for
adding a custom property?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
