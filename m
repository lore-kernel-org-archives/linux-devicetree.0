From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND RFC PATCH 2/2] ARM: dts: rockchip: Update the cpu freqs table
Date: Fri, 08 Jan 2016 20:16:19 +0100
Message-ID: <4951150.PYM4FhWu6V@phil>
References: <1452252698-16765-1-git-send-email-zhengxing@rock-chips.com> <1452252698-16765-3-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452252698-16765-3-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, keescook@google.com, leozwang@google.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Xing,

Am Freitag, 8. Januar 2016, 19:31:38 schrieb Xing Zheng:
> Actually, we need more cpu freqs which are 50MHz integer multiples.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> 
>  arch/arm/boot/dts/rk3036.dtsi |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
> index 1cb5877..1a773eb 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -79,7 +79,18 @@
>  			resets = <&cru SRST_CORE0>;
>  			operating-points = <
>  				/* KHz    uV */
> -				 816000 1000000
> +				1200000 1200000
> +				1100000 1200000
> +				1000000 1200000
> +				 900000 1200000
> +				 800000 1200000
> +				 700000 1200000
> +				 600000 1200000
> +				 500000 1200000
> +				 400000 1200000
> +				 300000 1200000
> +				 200000 1200000
> +				 100000 1200000

what about reducing the voltage as well?

>From rk3288-specific discussions I remember that reducing the frequency 
without touching the voltage, didn't really save so much energy.
And it looks like it was running 816MHz@1.0V just fine as well.

I guess you should find out which voltages are really necessary for each 
step.


Heiko
