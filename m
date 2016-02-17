From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Wed, 17 Feb 2016 21:50:44 +0100
Message-ID: <9529888.YxErSS5PS8@wuerfel>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com> <1455730114-2547-3-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455730114-2547-3-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 17 February 2016 18:28:34 Romain Perier wrote:
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 0477a81..71009dc 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -99,6 +99,11 @@
>                 };
>         };
>  
> +       hwrev@c1107d4c {
> +               compatible = "amlogic,meson8b-hwrev", "syscon";
> +               reg = <0xc1107d4c 0x460>;
> +       };
> 

That is a very odd address. Are you sure this is not part of a larger
block of registers?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
