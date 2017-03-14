From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: BCM5301X: Specify serial console parameters
Date: Tue, 14 Mar 2017 13:26:50 +0100
Message-ID: <20170314122650.GV15842@lunn.ch>
References: <20170314075830.2247-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170314075830.2247-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 08:58:29AM +0100, Rafa?? Mi??ecki wrote:
> From: Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This adds baud rate, parity & number of data bits. It's required to get
> serial working correctly.
> 
> Signed-off-by: Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
> index 8fd1ef9f0c2d..468107166a6f 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -18,8 +18,12 @@
>  / {
>  	interrupt-parent = <&gic>;
>  
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
>  	chosen {
> -		stdout-path = &uart0;
> +		stdout-path = "serial0:115200n8";
>  	};

Hi Rafal

The alias is fine. But putting the stdout-path here is unusual. Which
serial port is used for console is board specific, where as
bcm5301x.dtsi is very generic, it describes the SoC, not a board.  If
you look at other .dtsi files, those that specify stdout-path contain
properties which are common to a range of similar boards.

	   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
