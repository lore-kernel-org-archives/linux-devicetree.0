From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM: mvebu: armada-xp: Add I2C eeprom on Lenovo ix4-300d
Date: Sat, 20 Sep 2014 11:55:58 +0200
Message-ID: <541D4F2E.9020707@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <1411157684-6991-8-git-send-email-sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411157684-6991-8-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/2014 10:14 PM, Sebastian Hesselbarth wrote:
> There is an I2C eeprom connected on Lenovo ix4-300d, add the
> corresponding node.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
...
> ---
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> index c5ee6c00766c..cef50da88e45 100644
> --- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> @@ -98,6 +98,11 @@
>  					reg = <0x2e>;
>  				};
>  
> +				at24c64@50 {

nit: the node name should describe function, not its type.

@Jason, when you take this in, feel free to name the node eeprom@50
instead.

Sebastian

> +					compatible = "atmel,24c64";
> +					reg = <0x50>;
> +				};
> +
>  				pcf8563@51 {
>  					compatible = "nxp,pcf8563";
>  					reg = <0x51>;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
