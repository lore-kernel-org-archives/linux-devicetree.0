From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Patch v3 08/11] driver/edac/fsl_ddr: Add support of little
 endian
Date: Mon, 8 Aug 2016 16:39:22 +0100
Message-ID: <20160808153922.GG12649@leverpostej>
References: <1470351518-22404-1-git-send-email-york.sun@nxp.com>
 <1470351518-22404-9-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470351518-22404-9-git-send-email-york.sun@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: York Sun <york.sun@nxp.com>
Cc: linux-edac@vger.kernel.org, morbidrsa@gmail.com, oss@buserror.net, stuart.yoder@nxp.com, bp@alien8.de, Rob Herring <robh+dt@kernel.org>, Doug Thompson <dougthompson@xmission.com>, mchehab@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 03:58:33PM -0700, York Sun wrote:
> Get endianness from device tree. Both big endian and little endian
> are supported. Default to big endian for backward compatibility to
> MPC85xx.
> 
> Signed-off-by: York Sun <york.sun@nxp.com>
> 
> ---
> Change log
>   v3: no change
>   v2: Separated from "Add support for ARM-based SoCs" patch
> 
>  .../fsl/ddr.txt}                                   |  6 ++
>  drivers/edac/fsl_ddr_edac.c                        | 83 ++++++++++++++--------
>  2 files changed, 58 insertions(+), 31 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/mem-ctrlr.txt => memory-controllers/fsl/ddr.txt} (74%)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> similarity index 74%
> rename from Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> rename to Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> index f87856f..62623f9 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> @@ -7,6 +7,10 @@ Properties:
>  		  "fsl,qoriq-memory-controller".
>  - reg		: Address and size of DDR controller registers
>  - interrupts	: Error interrupt of DDR controller
> +- little-endian	: Specifies little-endian access to registers
> +- big-endian	: Specifies big-endian access to registers
> +
> +If both little-endian and big-endian are omitted, big-endian will be used.

The binding looks fine.

> @@ -470,6 +483,13 @@ int fsl_ddr_mc_err_probe(struct platform_device *op)
>  	mci->ctl_name = pdata->name;
>  	mci->dev_name = pdata->name;
>  
> +	if (of_find_property(op->dev.of_node, "little-endian", NULL))

Use:	if (of_property_read_bool(dev.of_node, "little-endian"))

> +		little_endian = true;
> +	else if (of_find_property(op->dev.of_node, "big-endian", NULL))
	
Use:	else if (of_property_read_bool(dev.of_node, "big-endian"))

> +		little_endian = false;
> +	else
> +		little_endian = false;
> +

With those fixed up:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.
