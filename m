From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM i.MX53: add dts for the TQ tqma53 module
Date: Mon, 7 Jan 2013 19:00:23 +0100
Message-ID: <20130107180023.GL1906@pengutronix.de>
References: <1357571760-487-1-git-send-email-s.trumtrar@pengutronix.de>
 <1357571760-487-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357571760-487-3-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please Cc linux arm kernel list next time.

On Mon, Jan 07, 2013 at 04:16:00PM +0100, Steffen Trumtrar wrote:
> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> The tqma53 is an embedded module that has some features on board (e.g. emmc),
> but mostly just provides access to them on its interface.
> Going along with the imx53.dtsi, the tqma53.dtsi specifies the existing
> devices and their pinctrl for this module. All devices that are not on the
> module are disabled by default and need to be enabled in a baseboard DT.
> 
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx53-tqma53.dtsi |  207 +++++++++++++++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx53-tqma53.dtsi
> 
> diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
> new file mode 100644
> index 0000000..41a6277
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
> @@ -0,0 +1,207 @@
> +/*
> + * Copyright 2012 Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix
> + * Copyright 2012 Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/include/ "imx53.dtsi"
> +
> +/ {
> +	model = "TQ TQMa53";
> +	compatible = "tq,tqma53", "fsl,imx53";
> +
> +	memory {
> +		reg = <0x70000000 0x40000000>; /* Up to 1GiB */
> +	};
> +
> +	soc {
> +		aips@50000000 {
> +			spba@50000000 {
> +				esdhc2: esdhc@50008000 {
> +					pinctrl-names = "default";
> +					pinctrl-0 = <&pinctrl_esdhc2_1>;
> +					wp-gpios = <&gpio1 2 0>;
> +					cd-gpios = <&gpio1 4 0>;
> +					status = "disabled";
> +				};

Please convert all these to:

&esdhc2 {
	pinctrl-names = "default";
	...
};

(see arch/arm/boot/dts/omap3-beagle.dts for an example)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
