From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: Add SPI support for i.MX27 Phytec PCM038
 module
Date: Mon, 8 Apr 2013 14:35:59 +0800
Message-ID: <20130408063557.GC5047@S2101-09.ap.freescale.net>
References: <1365348554-24345-1-git-send-email-shc_work@mail.ru>
 <1365348554-24345-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1365348554-24345-2-git-send-email-shc_work-JGs/UdohzUI@public.gmane.org>
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
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 07, 2013 at 07:29:13PM +0400, Alexander Shiyan wrote:
> Added SPI node to imx27-phytec-phycore DT file.
> 
> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx27-phytec-phycore.dtsp | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycore.dtsp b/arch/arm/boot/dts/imx27-phytec-phycore.dtsp
> index 7228153..354dc77 100644
> --- a/arch/arm/boot/dts/imx27-phytec-phycore.dtsp
> +++ b/arch/arm/boot/dts/imx27-phytec-phycore.dtsp
> @@ -77,3 +77,9 @@
>  	nand-ecc-mode = "hw";
>  	status = "okay";
>  };
> +
> +&cspi1 {
> +	fsl,spi-num-chipselects = <1>;
> +	cs-gpios = <&gpio4 28 0>;
> +	status = "okay";
> +};

I would suggest these codes be sorted in alphabet order of label name.
IOW, &cspi1 should be put before &nfc. 

Shawn

> -- 
> 1.8.1.5
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
