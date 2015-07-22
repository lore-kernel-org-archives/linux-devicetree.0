From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Use correct dts properties for tsadc node
Date: Wed, 22 Jul 2015 11:00:04 +0200
Message-ID: <22118807.OAheiiLXpf@diego>
References: <1437543846-19897-1-git-send-email-romain.perier@gmail.com> <1437543846-19897-2-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437543846-19897-2-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 22. Juli 2015, 07:44:06 schrieb Romain Perier:
> tsadc-tshut-mode and tsadc-tshut-polarity properties don't exist. The
> rockchip thermal driver looks for rockchip,hw-tshut-mode and
> rockchip,hw-tshut-polarity instead, otherwise it might freeze or hang the
> device according to the default mode or polarity used.
> 
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi
> b/arch/arm/boot/dts/rk3288-veyron.dtsi index 627d113..cc76cf7 100644
> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
> @@ -367,8 +367,8 @@
>  &tsadc {
>  	status = "okay";
> 
> -	tsadc-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> -	tsadc-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
> +	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> +	rockchip,hw-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
>  };
> 
>  &uart0 {

applied this one to my dts branch for 4.3 (after adding a veyron to the 
subject).


Thanks for the catch
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
