From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Thu, 14 Jan 2016 20:10:16 -0600
Message-ID: <20160115021016.GA19573@rob-hp-laptop>
References: <1452694404-1253-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452694404-1253-1-git-send-email-sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 07:43:24PM +0530, Subbaraya Sundeep Bhatta wrote:
> This patch adds the document describing dt bindings for ZynqMP
> PHY. ZynqMP SOC has a High Speed Processing System Gigabit
> Transceiver which provides PHY capabilties to USB, SATA,
> PCIE, Display Port and Ehernet SGMII controllers.
> 
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  v2:
> 	modified to use phy cells as 2.
> 
>  .../devicetree/bindings/phy/phy-zynqmp.txt         | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> new file mode 100644
> index 0000000..975cf21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> @@ -0,0 +1,103 @@
> +Xilinx ZynqMP PHY binding
> +
> +This binding describes a ZynqMP PHY device that is used to control ZynqMP
> +High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides four lanes
> +and are used by USB, SATA, PCIE, Display port and Ethernet SGMMI controllers.

s/SGMMI/SGMII/ 

> +
> +Required properties (controller (parent) node):
> +- compatible    : Should be "xlnx,zynqmp-psgtr"
> +
> +- reg		: Address and length of register sets for each device in
> +		  "reg-names"
> +- reg-names     : The names of the register addresses corresponding to the
> +		  registers filled in "reg":
> +			- serdes: SERDES block register set
> +			- siou: SIOU block register set
> +			- lpd: Low power domain peripherals reset control
> +			- fpd: Full power domain peripherals reset control
> +
> +-xlnx,tx_termination_fix: Include fix for a functional issue in the GT. The TX
> +			  termination resistance can be out of spec due to a
> +			  bug in the calibration logic. This issue will be fixed
> +			  in silicon in future versions.
> +
> +Required nodes	:  A sub-node is required for each lane the controller
> +		   provides.
> +
> +Required properties (port (child) nodes):
> +lane0:
> +- #phy-cells	: Should be 2
> +		  Cell after port phandle is device type from:
> +			- <PHY_TYPE_PCIE 0>
> +			- <PHY_TYPE_SATA 0>
> +			- <PHY_TYPE_USB3 0>
> +			- <PHY_TYPE_DP 1>
> +			- <PHY_TYPE_SGMII 0>

What is the 2nd cell for? The phandle doesn't count for the size.

However, I would simplify this to get rid of the sub nodes and set lane 
in the 1st cell and the type in the 2nd cell.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
