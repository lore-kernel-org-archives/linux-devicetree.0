From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM i.MX6q: Link system reset controller (SRC) to
 IPU in DT
Date: Thu, 17 Jan 2013 13:34:25 +0800
Message-ID: <20130117053424.GJ26179@S2101-09.ap.freescale.net>
References: <1358352787-15441-1-git-send-email-p.zabel@pengutronix.de>
 <1358352787-15441-5-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358352787-15441-5-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2013 at 05:13:04PM +0100, Philipp Zabel wrote:
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q.dtsi |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index d6265ca..c445959 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -555,6 +555,7 @@
>  				compatible = "fsl,imx6q-src";
>  				reg = <0x020d8000 0x4000>;
>  				interrupts = <0 91 0x04 0 96 0x04>;
> +				#reset-cells = <1>;
>  			};
>  
>  			gpc: gpc@020dc000 {
> @@ -1046,6 +1047,7 @@
>  			interrupts = <0 6 0x4 0 5 0x4>;
>  			clocks = <&clks 130>, <&clks 131>, <&clks 132>;
>  			clock-names = "bus", "di0", "di1";
> +			resets = <&src 2>;
>  		};
>  
>  		ipu2: ipu@02800000 {
> @@ -1055,6 +1057,7 @@
>  			interrupts = <0 8 0x4 0 7 0x4>;
>  			clocks = <&clks 133>, <&clks 134>, <&clks 137>;
>  			clock-names = "bus", "di0", "di1";
> +			reset = <&src 4>;

s/reset/resets

Shawn

>  		};
>  	};
>  };
> -- 
> 1.7.10.4
> 
