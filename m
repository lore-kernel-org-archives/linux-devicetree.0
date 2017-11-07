From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: NSP: Disable AHCI controller for HR NSP boards
Date: Tue, 7 Nov 2017 17:45:46 -0500
Message-ID: <CAC3K-4qZBJc9vRr2z3Fhx78feRdVASYFHZgayV=gG1jZ0dApVg@mail.gmail.com>
References: <20171107222812.17267-1-f.fainelli@gmail.com> <20171107222812.17267-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107222812.17267-2-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 5:28 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The AHCI controller is currently enabled for all of these boards:
> bcm958623hr and bcm958625hr would result in a hard hang on boot that we
> cannot get rid of. Since this does not appear to have an easy and simple
> fix, just disable the AHCI controller for now until this gets resolved.
>
> Fixes: 70725d6e97ac ("ARM: dts: NSP: Enable SATA on bcm958625hr")
> Fixes: d454c3762437 ("ARM: dts: NSP: Add new DT file for bcm958623hr")
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

> ---
>  arch/arm/boot/dts/bcm958623hr.dts | 4 ----
>  arch/arm/boot/dts/bcm958625hr.dts | 4 ----
>  2 files changed, 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm958623hr.dts b/arch/arm/boot/dts/bcm958623hr.dts
> index 3bc50849d013..b8bde13de90a 100644
> --- a/arch/arm/boot/dts/bcm958623hr.dts
> +++ b/arch/arm/boot/dts/bcm958623hr.dts
> @@ -141,10 +141,6 @@
>         status = "okay";
>  };
>
> -&sata {
> -       status = "okay";
> -};
> -
>  &qspi {
>         bspi-sel = <0>;
>         flash: m25p80@0 {
> diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
> index d94d14b3c745..6a44b8021702 100644
> --- a/arch/arm/boot/dts/bcm958625hr.dts
> +++ b/arch/arm/boot/dts/bcm958625hr.dts
> @@ -177,10 +177,6 @@
>         status = "okay";
>  };
>
> -&sata {
> -       status = "okay";
> -};
> -
>  &srab {
>         compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
>         status = "okay";
> --
> 2.9.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
