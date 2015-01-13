From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 03/13] mtd: st_spi_fsm: dt-bindings: Deprecate generic
 compatible string
Date: Mon, 12 Jan 2015 21:02:30 -0800
Message-ID: <20150113050230.GP9759@ld-irv-0074>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <1418644760-18773-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418644760-18773-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ devicetree

Please include devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org whenever you send DT patches
like this.

On Mon, Dec 15, 2014 at 11:59:10AM +0000, Lee Jones wrote:
> This driver now obtains platform information via DT matching, which requires
> a compatible string per platform.  This change introduces the new specific
> strings and deprecates the old generic one.
> 
> We also take out all of the old, unused properties which are no longer
> required.
> 
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/st-fsm.txt | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
> index c248939..4e3a16c 100644
> --- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
> +++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
> @@ -1,26 +1,20 @@
>  * ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
>  
>  Required properties:
> -  - compatible : Should be "st,spi-fsm"
> +  - compatible : "st,spi-fsm" is now DEPRECATED

See my comments on patch 4.

In light of that, it may make sense to support both, so DTS files could
list:

	compatible = "st,stid127-spi-fsm", "st,spi-fsm";

But I'm not really privy to whatever discussion determined that you
needed to deprecate the current binding. If there really are no users of
the current upstream binding, then maybe your current deprecation plan
can work fine.

> +		 Should be one of;
> +		   "st,stid127-spi-fsm"
> +		   "st,stih407-spi-fsm"
> +		   "st,stih416-spi-fsm"
>    - reg        : Contains register's location and length.
> -  - reg-names  : Should contain the reg names "spi-fsm"
>    - interrupts : The interrupt number
>    - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
> -
> -Optional properties:
> -  - st,syscfg          : Phandle to boot-device system configuration registers
> -  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
> -  - st,boot-device-spi : Expected boot-device value if booted via this device
> +  - st,syscfg  : Phandle to boot-device system configuration registers
>  
>  Example:
>  	spifsm: spifsm@fe902000{
> -	        compatible         = "st,spi-fsm";
> +		compatible         = "st,stih407-spi-fsm";
>  	        reg                =  <0xfe902000 0x1000>;
> -	        reg-names          = "spi-fsm";
>  	        pinctrl-0          = <&pinctrl_fsm>;
>  		st,syscfg	   = <&syscfg_rear>;
> -	        st,boot-device-reg = <0x958>;
> -	        st,boot-device-spi = <0x1a>;
> -		status = "okay";
>  	};
> -

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
