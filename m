From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: at91: sam9g20 & sam9g45 add spi DT support
Date: Mon, 30 Jan 2012 11:58:14 -0700
Message-ID: <20120130185814.GQ28397@ponder.secretlab.ca>
References: <1327937271-23668-1-git-send-email-plagnioj@jcrosoft.com>
 <1327937271-23668-3-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327937271-23668-3-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2012 at 04:27:51PM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:
> at91sam9m10g45ek:
> 	add dataflash support
> usb_a9g20:
> 	add mmc spi support
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
> diff --git a/arch/arm/boot/dts/usb_a9g20.dts b/arch/arm/boot/dts/usb_a9g20.dts
> index e6c7970..1dfb7a9 100644
> --- a/arch/arm/boot/dts/usb_a9g20.dts
> +++ b/arch/arm/boot/dts/usb_a9g20.dts
> @@ -84,6 +84,17 @@
>  				status = "okay";
>  			};
>  
> +			spi1: spi@fffcc000 {
> +				status = "okay";
> +				mmc-slot@0 {
> +					compatible = "mmc-spi-slot";
> +					ncs-gpio = <&pioB 3 0>;
> +					gpios = <&pioC 4 0   /* CD */
> +						>;

Drop the above ncs-gpios line, but otherwise:

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> +					voltage-ranges = <3200 3400>;
> +					spi-max-frequency = <20000000>;
> +				};
> +			};
>  		};
>  	};
>  };
