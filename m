From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Dove: fix bad properties of the si5351 clkout2
 used by Cubox audio
Date: Tue, 08 Oct 2013 20:19:45 +0200
Message-ID: <52544CC1.6010502@gmail.com>
References: <20131008202027.6d9f0bd2@armhf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008202027.6d9f0bd2@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2013 08:20 PM, Jean-Francois Moine wrote:
> As defined in the DT, clkout2 is not allowed to change the pll inside
> si5351.
>
> This patch extends the properties of clkout2 so that it works as the
> external clock of the audio device in the Cubox.
>
> Also, as the second si5351 clock is not used in the Cubox, its
> definition is removed.
>
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>

Already gave my

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

which you should add to help us keep track of them next time.

> ---
> v2:
> - remove clkout1 which is not used in the Cubox (Sebastian Hesselbarth)
> ---
>   arch/arm/boot/dts/dove-cubox.dts | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-cubox.dts
> index bb38a24..3dd8844 100644
> --- a/arch/arm/boot/dts/dove-cubox.dts
> +++ b/arch/arm/boot/dts/dove-cubox.dts
> @@ -99,18 +99,12 @@
>   			silabs,pll-master;
>   		};
>
> -		clkout1 {
> -			reg = <1>;
> -			silabs,drive-strength = <8>;
> -			silabs,multisynth-source = <1>;
> -			silabs,clock-source = <0>;
> -			silabs,pll-master;
> -		};
> -
>   		clkout2 {
>   			reg = <2>;
> +			silabs,drive-strength = <8>;
>   			silabs,multisynth-source = <1>;
>   			silabs,clock-source = <0>;
> +			silabs,pll-master;
>   		};
>   	};
>   };
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
