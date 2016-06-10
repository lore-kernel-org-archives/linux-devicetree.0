From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: BCM5310x: Enable switch ports on SmartRG
 SR400AC
Date: Fri, 10 Jun 2016 21:32:59 +0200
Message-ID: <20160610193259.GI2338@lunn.ch>
References: <1465583756-26740-1-git-send-email-f.fainelli@gmail.com>
 <1465583756-26740-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465583756-26740-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 11:35:56AM -0700, Florian Fainelli wrote:
> Define the port mapping for the SmartRG SR400ACE device.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> index 8b0c440b2e71..c219d33496cc 100644
> --- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> +++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> @@ -126,3 +126,43 @@
>  &spi_nor {
>  	status = "okay";
>  };
> +
> +&srab {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		switch0port0: port@0 {

Hi Florian

You don't need the labels, since you don't have any phandles pointing
at them.

Other than that, great to see a board using the new switch driver.

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
