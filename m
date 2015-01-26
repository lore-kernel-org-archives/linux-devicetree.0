From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Mon, 26 Jan 2015 19:44:36 +0100
Message-ID: <20150126184436.GE5015@lunn.ch>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421687701-5667-1-git-send-email-kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 06:15:01PM +0100, Imre Kaloz wrote:
> The Linksys WRT1900AC (Mamba) is a router that has
> 
> - 2 mini-PCIe slots with Marvell 88W8864 radios
> - 1 USB 3.0 port
> - 1 USB 2.0/eSATAp port
> - 2 Ethernet interfaces connected to a 88E6172 switch (1x WAN + 4x LAN)
> - 128MB NAND flash
> - 256MB RAM
> 
> Signed-off-by: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
> Changes since v1:
>   * add dual license
>   * lower SPI speed to meet the chip's maximum
>   * pinctrl cleanups based on Andrew Lunn's suggestions
> ---
>  arch/arm/boot/dts/armada-xp-mamba.dts | 273 ++++++++++++++++++++++++++++++++++
>  1 file changed, 273 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-xp-mamba.dts
> 
> diff --git a/arch/arm/boot/dts/armada-xp-mamba.dts b/arch/arm/boot/dts/armada-xp-mamba.dts
> new file mode 100644
> index 0000000..e368d18
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-xp-mamba.dts
> @@ -0,0 +1,273 @@
> +/*
> + * Device Tree file for the Linksys WRT1900AC (Mamba).
> + *
> + * Note: this board is shipped with a new generation boot loader that
> + * remaps internal registers at 0xf1000000. Therefore, if earlyprintk
> + * is used, the CONFIG_DEBUG_MVEBU_UART_ALTERNATE option should be
> + * used.
> + *
> + * Copyright (C) 2014 Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> + *
> + * Based on armada-xp-axpwifiap.dts:
> + *
> + *     Copyright (C) 2013 Marvell
> + *
> + *     Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is licensed under the terms of the GNU General Public
> + *     License version 2.  This program is licensed "as is" without
> + *     any warranty of any kind, whether express or implied.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "armada-xp-mv78230.dtsi"
> +
> +/ {
> +	model = "Linksys WRT1900AC (Mamba)";
> +	compatible = "linksys,mamba", "marvell,armadaxp-mv78230",
> +		     "marvell,armadaxp", "marvell,armada-370-xp";

Hi Imre

So the consensus seems to be 

 model = "Linksys WRT1900AC";
 compatible = "linksys,mamba", "...";

with leds using mamba.

Please name the file armada-xp-linksys-mamba.dts.

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
