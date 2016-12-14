From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Wed, 14 Dec 2016 19:32:15 +1030
Message-ID: <CACPK8Xd0znB0C+P8mstjjSgJWN2T_a0h2jJYG77gVbiZghtCyA@mail.gmail.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com> <1481702104-8617-5-git-send-email-jaghu@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481702104-8617-5-git-send-email-jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Jagha,

On Wed, Dec 14, 2016 at 6:25 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Add clock, data and clear signal GPIO lines to control seven segment display on
> zaius platform.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

The Zaius device tree is not upstream. I suggest you submit it through
the Aspeed maintainer's tree (me!) for inclusion in the next merge
window.

For the time being, drop this patch from your series as it will not
apply to the upstream kernel.

As a general rule make sure you're basing the patches you send
upstream on a tag from an upstream tree. Linus' v4.9 tag would be the
best one at this point in time.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 8ef4ece..ccb8147 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -43,6 +43,14 @@
>                         gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       seven-seg-disp {
> +               compatible = "seven-seg-gpio-dev";
> +               refresh-interval-ms = "1000";
> +               clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +               clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +       };
>  };
>
>  &fmc {
> --
> 2.8.0.rc3.226.g39d4020
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
