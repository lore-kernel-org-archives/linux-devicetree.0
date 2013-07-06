From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx27 phyCARD-S remove wrong I2C RTC
Date: Sat, 6 Jul 2013 11:15:59 +0800
Message-ID: <20130706031557.GA30164@S2101-09.ap.freescale.net>
References: <1372782469.486055292@f129.mail.ru>
 <1373031909-16178-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1373031909-16178-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 05, 2013 at 03:45:09PM +0200, Markus Pargmann wrote:
> Fixup of commit 7874d595b78e431f0f661d2fe47625649308a52e

The commit ID is not stable.  I just dropped it and applied the patch.

Shawn

> "ARM: dts: Add device tree support for phycard pca100".
> 
> Remove wrong I2C RTC node.
> 
> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> 
> Thanks, Alexander, you are right. I2C2 has no RTC.
> 
> Regards,
> 
> Markus
> 
>  arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
> index ec52b6d..01ee807 100644
> --- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
> +++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
> @@ -55,11 +55,6 @@
>  		reg = <0x4a>;
>  	};
>  
> -	rtc@51 {
> -		compatible = "nxp,pcf8563";
> -		reg = <0x51>;
> -	};
> -
>  	at24@52 {
>  		compatible = "at,24c32";
>  		pagesize = <32>;
> -- 
> 1.8.2.1
> 
