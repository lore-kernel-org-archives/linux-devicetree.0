From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] openrisc: dts: or1ksim: Add stdout-path
Date: Tue, 19 Sep 2017 18:49:48 +0200
Message-ID: <CAMuHMdWwJ0VWCOfvLW9rWRq445XB3iPgk3VfHN_f9_eU4Lrjeg@mail.gmail.com>
References: <20170919140024.32563-1-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919140024.32563-1-shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stafford,

On Tue, Sep 19, 2017 at 4:00 PM, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> During reviews of the OpenRISC SMP patch series it was suggested to add
> stdout-path to the SMP dts file.  Add stdout-path to our other dts files
> to be a good example.
>
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/openrisc/boot/dts/or1ksim.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/openrisc/boot/dts/or1ksim.dts b/arch/openrisc/boot/dts/or1ksim.dts
> index 5d4f9027afaf..ecc30968cbcb 100644
> --- a/arch/openrisc/boot/dts/or1ksim.dts
> +++ b/arch/openrisc/boot/dts/or1ksim.dts
> @@ -7,6 +7,7 @@
>
>         chosen {
>                 bootargs = "console=uart,mmio,0x90000000,115200";
> +               stdout-path = &serial0;

I think that should be:

-               bootargs = "console=uart,mmio,0x90000000,115200";
+               stdout-path = "serial0:115200";

If stdout-path is present, it will become the default console.
All other UART parameters except for the serial speed are derived from
the serial0 node (= serial@90000000) in DT.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
