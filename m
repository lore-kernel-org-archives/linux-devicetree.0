From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM953012HR: Add ethernet aliases
Date: Thu, 16 Mar 2017 13:07:33 -0400
Message-ID: <CAC3K-4pV=+Qherf-=aOAP40NUBUm680StQWo_G8M6=gmPdM5KQ@mail.gmail.com>
References: <1489611575-18684-1-git-send-email-steven.lin1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489611575-18684-1-git-send-email-steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 4:59 PM, Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Adding ethernet aliases.  These are used, for example, by bootloaders,
> to modify the MAC addresses in the device tree.
>
> Signed-off-by: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

LGTM

Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

> ---
>  arch/arm/boot/dts/bcm953012hr.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm953012hr.dts b/arch/arm/boot/dts/bcm953012hr.dts
> index 85f9b0b..766aa71 100644
> --- a/arch/arm/boot/dts/bcm953012hr.dts
> +++ b/arch/arm/boot/dts/bcm953012hr.dts
> @@ -41,6 +41,9 @@
>
>         aliases {
>                 serial0 = &uart0;
> +               ethernet0 = &gmac0;
> +               ethernet1 = &gmac1;
> +               ethernet2 = &gmac2;
>         };
>
>         chosen {
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
