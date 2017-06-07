From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] PCI: Add DT binding for tango PCIe controller
Date: Wed, 7 Jun 2017 16:29:07 -0500
Message-ID: <20170607212907.2wr3hqbokjb74kj3@rob-hp-laptop>
References: <741766e5-cff2-db5f-d40b-6866e08fd966@sigmadesigns.com>
 <69f3ffe7-3c39-fa94-71f8-91744a869cc9@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <69f3ffe7-3c39-fa94-71f8-91744a869cc9-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, David Laight <david.laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Phuong Nguyen <phuong_nguyen-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 03:30:26PM +0200, Marc Gonzalez wrote:
> Binding for the Sigma Designs SMP8759 SoC.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pci/tango-pcie.txt | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/tango-pcie.txt b/Documentation/devicetree/bindings/pci/tango-pcie.txt
> new file mode 100644
> index 000000000000..35ef2c811a27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/tango-pcie.txt
> @@ -0,0 +1,30 @@
> +Sigma Designs Tango PCIe controller
> +
> +Required properties:
> +
> +- compatible: "sigma,smp8759-pcie"
> +- reg: address/size of PCI configuration space, address/size of register area
> +- device_type: "pci"
> +- #size-cells: <2>
> +- #address-cells: <3>
> +- msi-controller
> +- ranges: translation from system to bus addresses
> +- interrupts: spec for misc interrupts, spec for MSI
> +
> +http://elinux.org/Device_Tree_Usage#PCI_Address_Translation
> +http://elinux.org/Device_Tree_Usage#Advanced_Interrupt_Mapping

Why are these here?

There's several standard properties you are missing like bus-range. 
Build your dts with "W=2". dtc recently gained some checks for PCI 
bindings.

> +
> +Example:
> +
> +	pcie@2e000 {
> +		compatible = "sigma,smp8759-pcie";
> +		reg = <0x50000000 SZ_4M>, <0x2e000 0x100>;
> +		device_type = "pci";
> +		#size-cells = <2>;
> +		#address-cells = <3>;
> +		msi-controller;
> +		ranges = <0x02000000 0x0 0x00400000  0x50400000  0x0 SZ_60M>;

I don't think SZ_60M exists or is available to dts files. Just put the 
number in.

> +		interrupts =
> +			<54 IRQ_TYPE_LEVEL_HIGH>, /* misc interrupts */
> +			<55 IRQ_TYPE_LEVEL_HIGH>; /* MSI */
> +	};
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
