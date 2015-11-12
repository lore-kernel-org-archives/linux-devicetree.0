From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Thu, 12 Nov 2015 08:44:25 -0600
Message-ID: <20151112144425.GA21857@rob-hp-laptop>
References: <1445895295-16778-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445895295-16778-1-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, slash.tmp-GANU6spQydw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 09:34:54PM +0000, Mans Rullgard wrote:
> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
> using the "aurora,nb8800" compatible string.  When used in Sigma
> Designs chips a few additional features are available.  These variants
> are indicated by a "sigma,<chip>-ethernet" compatible string.
> 
> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes:
> - added phy child node
> ---
>  .../devicetree/bindings/net/aurora,nb8800.txt      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/aurora,nb8800.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.txt b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
> new file mode 100644
> index 0000000..df12ff1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
> @@ -0,0 +1,37 @@
> +* Aurora VLSI AU-NB8800 Ethernet controller
> +
> +Required properties:
> +- compatible: Should be "sigma,<chip>-ethernet", "aurora,nb8800"
> +- reg: Should be MMIO address space of the device
> +- interrupts: Should contain the interrupt specifier for the device
> +- interrupt-parent: Should be a phandle for the interrupt controller
> +- clocks: Should be a phandle for the clock for the device
> +- #address-cells: Should be <1>
> +- #size-cells: Should be <0>
> +
> +Common properties described in ethernet.txt:
> +- local-mac-address
> +- mac-address
> +- phy-handle
> +- phy-mode
> +
> +The attached PHY should be specified in a child node as per phy.txt.
> +
> +Example:
> +
> +ethernet@26000 {
> +	compatible = "sigma,smp8642-ethernet", "aurora,nb8800";
> +	reg = <0x26000 0x800>;
> +	interrupts = <38>;
> +	clocks = <&sys_clk>;
> +	max-speed = <1000>;
> +	phy-connection-type = "rgmii";
> +	phy-handle = <&eth0_phy>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	eth0_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
