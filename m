From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: net: Add DT bindings for Socionext
 Netsec
Date: Tue, 12 Dec 2017 17:29:19 +0000
Message-ID: <20171212172919.ezd54qqcyk6fh5kq@lakrids.cambridge.arm.com>
References: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
 <1513098921-21042-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513098921-21042-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Dec 12, 2017 at 10:45:21PM +0530, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch adds documentation for Device-Tree bindings for the
> Socionext NetSec Controller driver.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/net/socionext-netsec.txt   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> new file mode 100644
> index 0000000..4695969
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> @@ -0,0 +1,45 @@
> +* Socionext NetSec Ethernet Controller IP
> +
> +Required properties:
> +- compatible: Should be "socionext,synquacer-netsec"
> +- reg: Address and length of the control register area, followed by the
> +       address and length of the EEPROM holding the MAC address and
> +       microengine firmware
> +- interrupts: Should contain ethernet controller interrupt
> +- clocks: phandle to the PHY reference clock, and any other clocks to be
> +          switched by runtime_pm
> +- clock-names: Required only if more than a single clock is listed in 'clocks'.
> +               The PHY reference clock must be named 'phy_refclk'

Please define the full set of clocks (and their names) explicitly. This
should be well-known.

Otherwise, this looks ok.

Thanks,
Mark.

> +- phy-mode: See ethernet.txt file in the same directory
> +- phy-handle: phandle to select child phy
> +
> +Optional properties: (See ethernet.txt file in the same directory)
> +- dma-coherent: Boolean property, must only be present if memory
> +		 accesses performed by the device are cache coherent
> +- local-mac-address
> +- mac-address
> +- max-speed
> +- max-frame-size
> +
> +Required properties for the child phy:
> +- reg: phy address
> +
> +Example:
> +	eth0: netsec@522D0000 {
> +		compatible = "socionext,synquacer-netsec";
> +		reg = <0 0x522D0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clk_netsec>;
> +		phy-mode = "rgmii";
> +		max-speed = <1000>;
> +		max-frame-size = <9000>;
> +		phy-handle = <&ethphy0>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +		};
> +	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
