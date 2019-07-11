From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH 5/8] dt-bindings: PCI: Add Amazon's Annapurna Labs PCIe
 host bridge binding
Date: Thu, 11 Jul 2019 10:12:35 +0300
Message-ID: <36e8c3b0-feeb-db8f-3808-0218b54adcec@amazon.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
 <20190710164519.17883-6-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710164519.17883-6-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 7/10/2019 7:45 PM, Jonathan Chocron wrote:
> Document Amazon's Annapurna Labs PCIe host bridge.

That is the way! (best to keep same wordings (Amazon's)

>
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>   .../devicetree/bindings/pci/pcie-al.txt       | 45 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt
>
> diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt b/Documentation/devicetree/bindings/pci/pcie-al.txt
> new file mode 100644
> index 000000000000..d92cc529490e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
> @@ -0,0 +1,45 @@
> +* Amazon Annapurna Labs PCIe host bridge
> +
> +Annapurna Labs' PCIe Host Controller is based on the Synopsys DesignWare

Amazon's


and what is the s' ? should it be for all

> +Example:
> +
> +	pcie-external0 {
probably should have a reference with the address
> +		compatible = "amazon,al-pcie";
> +		reg = <0x0 0xfb600000 0x0 0x00100000
> +		       0x0 0xfd800000 0x0 0x00010000
> +		       0x0 0xfd810000 0x0 0x00001000>;
> +		reg-names = "config", "controller", "dbi";
> +		bus-range = <0 255>;
> +		device_type = "pci";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map-mask = <0x00 0 0 7>;
> +		interrupt-map = <0x0000 0 0 1 &gic_main GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>; /* INTa */
gic_main->gic
> +		ranges = <0x02000000 0x0 0xc0010000 0x0 0xc0010000 0x0 0x07ff0000>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a6137df3f0e..d555beb794bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12205,6 +12205,7 @@ PCIE DRIVER FOR ANNAPURNA LABS
AMAZON!
>   M:	Jonathan Chocron <jonnyc@amazon.com>
>   L:	linux-pci@vger.kernel.org
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/pcie-al.txt
>   F:	drivers/pci/controller/dwc/pcie-al.c
>   
>   PCIE DRIVER FOR AMLOGIC MESON
