Return-Path: <robherring2@gmail.com>
Date: Mon, 9 Apr 2018 14:10:02 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] scsi: ufs: Add UFS platform driver for Cadence UFS
Message-ID: <20180409191002.rv2ug6zbwrvavlr3@rob-hp-laptop>
References: <2A879077-6CAD-4DAA-8C9A-7368CB93C72D@global.cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A879077-6CAD-4DAA-8C9A-7368CB93C72D@global.cadence.com>
To: Janek Kotas <jank@cadence.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "vinholikatti@gmail.com" <vinholikatti@gmail.com>, "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 28, 2018 at 11:25:34AM +0000, Janek Kotas wrote:
> This patch adds a device tree platform
> driver description for Cadence UFS Controller.

You have exactly the same subject for both patches. Don't do that. For 
bindings, the preferred subject prefix is "dt-bindings: ufs: ".

> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  .../devicetree/bindings/ufs/cdns-ufs-pltfrm.txt    |   31 ++++++++++++++++++++
>  1 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns-ufs-pltfrm.txt
> 
> diff --git a/Documentation/devicetree/bindings/ufs/cdns-ufs-pltfrm.txt b/Documentation/devicetree/bindings/ufs/cdns-ufs-pltfrm.txt
> new file mode 100644
> index 0000000..d10229d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/cdns-ufs-pltfrm.txt

rename to cdns,ufshc.txt

> @@ -0,0 +1,31 @@
> +* Cadence Universal Flash Storage (UFS) Controller
> +
> +UFS nodes are defined to describe on-chip UFS host controllers.
> +Each UFS controller instance should have its own node.
> +
> +Required properties:
> +- compatible	: compatible list, contains the following controller:
> +			"cdns,ufshc"
> +		  complemented with the JEDEC version:
> +			"jedec,ufs-2.0"
> +
> +- reg		: registers mapping
> +- interrupts	: interrupts mapping

How many?

> +- clocks	: List of phandle and clock specifier pairs.
> +- clock-names	: List of clock input name strings sorted in the same
> +		  order as the clocks property. "core_clk" is mandatory.

"_clk" is redundant.

Really only one clock for the block? No clock from the PHY? No bus 
clock?

> +- freq-table-hz	: Array of <min max> operating frequencies stored in the same
> +		  order as the clocks property. If this property is not
> +		  defined or a value in the array is "0" then it is assumed
> +		  that the frequency is set by the parent clock or a
> +		  fixed rate clock source.

The 'assigned-clocks' property and friends should be able to handle 
this.

> +
> +Example:
> +	ufs@fd030000 {
> +		compatible = "cdns,ufshc", "jedec,ufs-2.0";
> +		reg = <0xfd030000 0x10000>;
> +		interrupts = <0 1 0>;
> +		freq-table-hz = <0 0>;
> +		clocks = <&ufs_core_clk 0>;
> +		clock-names = "core_clk";
> +	};
> -- 
> 1.7.1
