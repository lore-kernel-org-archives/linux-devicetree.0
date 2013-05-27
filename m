From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] drivers: bus: add a new driver for WEIM
Date: Mon, 27 May 2013 14:34:49 +0800
Message-ID: <20130527063448.GF7782@S2101-09.ap.freescale.net>
References: <1369389564-13181-1-git-send-email-b32955@freescale.com>
 <1369389564-13181-2-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369389564-13181-2-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shc_work-JGs/UdohzUI@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2013 at 05:59:19PM +0800, Huang Shijie wrote:
> +Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
> +
> +	weim: weim@021b8000 {
> +		compatible = "fsl,imx6q-weim";
> +		reg = <0x021b8000 0x4000>;
> +		clocks = <&clks 196>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0x08000000 0x08000000>;
> +
> +		nor@0,0 {
> +			compatible = "cfi-flash";
> +			reg = <0 0 0x02000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			bank-width = <2>;
> +
Nit: remove this unneeded blank line.
> +			fsl,weim-cs-timing = <0x00620081 0x00000001 0x1C022000
> +					0x0000C000 0x1404a38e 0x00000000>;

Nit: please consistently use lower case for hex value.

Please update patch #6 as well.

Other than that,

Reviewed-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +		};
> +	};
