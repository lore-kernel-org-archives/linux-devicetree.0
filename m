Return-Path: <robherring2@gmail.com>
Date: Tue, 31 Jul 2018 15:41:28 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add bindings for Hisilicon SEC crypto
 accelerators.
Message-ID: <20180731214128.GA4238@rob-hp-laptop>
References: <20180723154955.12944-1-Jonathan.Cameron@huawei.com>
 <20180723154955.12944-2-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180723154955.12944-2-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, smueller@chronox.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linuxarm@huawei.com, xuzaibo@huwei.com, fanghao11@huawei.com, liguozhu@hisilicon.com, wangxiongfeng2@huawei.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 23, 2018 at 04:49:53PM +0100, Jonathan Cameron wrote:
> The hip06 and hip07 SoCs contain a number of these crypto units which
> accelerate AES and DES operations.
> 

You forgot the 'v2' on the patches. Only matters because I sort my 
reviews by version and then date. But don't tell anyone or I'll start 
getting v50 patches. :)

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  .../bindings/crypto/hisilicon,hip07-sec.txt        | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt b/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt
> new file mode 100644
> index 000000000000..78d2db9d4de5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt
> @@ -0,0 +1,67 @@
> +* Hisilicon hip07 Security Accelerator (SEC)
> +
> +Required properties:
> +- compatible: Must contain one of
> +  - "hisilicon,hip06-sec"
> +  - "hisilicon,hip07-sec"
> +- reg: Memory addresses and lengths of the memory regions through which
> +  this device is controlled.
> +  Region 0 has registers to control the backend processing engines.
> +  Region 1 has registers for functionality common to all queues.
> +  Regions 2-18 have registers for the 16 individual queues which are isolated
> +  both in hardware and within the driver.
> +- interrupts: Interrupt specifiers.
> +  Refer to interrupt-controller/interrupts.txt for generic interrupt client node
> +  bindings.
> +  Interrupt 0 is for the SEC unit error queue.
> +  Interrupt 2N + 1 is the completion interrupt for queue N.
> +  Interrupt 2N + 2 is the error interrupt for queue N.
> +- dma-coherent:  The driver assumes coherent dma is possible.
> +
> +Optional properties:
> +- iommus: The SEC units are behind smmu-v3 iommus.
> +  Refer to iommu/arm,smmu-v3.txt for more information.
> +
> +Example:
> +
> +p1_sec_a: crypto@400,d2000000 {

The unit address is still wrong. It should be '400d0000000'.

Really, your dts file should utilize 'ranges' and not just have 64-bit 
addresses and sizes everywhere. 

With that,

Reviewed-by: Rob Herring <robh@kernel.org>


> +	compatible = "hisilicon,hip07-sec";
> +	reg = <0x400 0xd0000000 0x0 0x10000
> +	       0x400 0xd2000000 0x0 0x10000
> +	       0x400 0xd2010000 0x0 0x10000
> +	       0x400 0xd2020000 0x0 0x10000
> +	       0x400 0xd2030000 0x0 0x10000
> +	       0x400 0xd2040000 0x0 0x10000
> +	       0x400 0xd2050000 0x0 0x10000
> +	       0x400 0xd2060000 0x0 0x10000
> +	       0x400 0xd2070000 0x0 0x10000
> +	       0x400 0xd2080000 0x0 0x10000
> +	       0x400 0xd2090000 0x0 0x10000
> +	       0x400 0xd20a0000 0x0 0x10000
> +	       0x400 0xd20b0000 0x0 0x10000
> +	       0x400 0xd20c0000 0x0 0x10000
> +	       0x400 0xd20d0000 0x0 0x10000
> +	       0x400 0xd20e0000 0x0 0x10000
> +	       0x400 0xd20f0000 0x0 0x10000
> +	       0x400 0xd2100000 0x0 0x10000>;
> +	interrupt-parent = <&p1_mbigen_sec_a>;
> +	iommus = <&p1_smmu_alg_a 0x600>;
> +	dma-coherent;
> +	interrupts = <576 4>,
> +		     <577 1>, <578 4>,
> +		     <579 1>, <580 4>,
> +		     <581 1>, <582 4>,
> +		     <583 1>, <584 4>,
> +		     <585 1>, <586 4>,
> +		     <587 1>, <588 4>,
> +		     <589 1>, <590 4>,
> +		     <591 1>, <592 4>,
> +		     <593 1>, <594 4>,
> +		     <595 1>, <596 4>,
> +		     <597 1>, <598 4>,
> +		     <599 1>, <600 4>,
> +		     <601 1>, <602 4>,
> +		     <603 1>, <604 4>,
> +		     <605 1>, <606 4>,
> +		     <607 1>, <608 4>;
> +};
> -- 
> 2.16.2
> 
> 
