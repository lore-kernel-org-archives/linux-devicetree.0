From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Thu, 10 Aug 2017 15:35:02 -0500
Message-ID: <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 06, 2017 at 11:24:02AM -0700, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Device Tree bindinds for Altera ASMI Parallel II IP Core.

s/bindinds/bindings/

> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/altera-asmip2.txt      | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> new file mode 100644
> index 0000000..3380366
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
> @@ -0,0 +1,22 @@
> +* Altera ASMI Parallel II IP Core
> +
> +Required properties:
> +- compatible : Should be "altr,asmi_parallel2".

s/_/-/

> +- reg : A tuple consisting of a physical address and length.
> +
> +Optional subnodes:
> +Subnodes of the Altera ASMI Paralllel II IP Core are spi slave nodes.

But this is not a general purpose SPI controller?

> +- reg : chip select value
> +- label : optional user friendly label
> +
> +Example:
> +
> +qspi: spi@a0001000 {
> +	compatible = "altr,asmi_parallel2";
> +	reg = <0xa0001000 0x10>;
> +
> +	flash@0 {

This should have a compatible.

> +		reg = <0>;
> +		label = "FPGA Image";
> +	};
> +};
> -- 
> 2.7.4
> 
