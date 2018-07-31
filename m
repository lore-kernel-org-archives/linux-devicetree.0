From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy-qcom-ipq4019-usb: add binding
 document
Date: Tue, 31 Jul 2018 16:33:45 -0600
Message-ID: <20180731223345.GA23086@rob-hp-laptop>
References: <20180725054059.19506-1-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725054059.19506-1-john@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: Alban Bedel <albeu@free.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 07:40:57AM +0200, John Crispin wrote:
> This patch adds the binding documentation for the HS/SS USB PHY found
> inside Qualcom Dakota SoCs.

Qualcomm

> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../bindings/phy/phy-qcom-ipq4019-usb.txt           | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
> new file mode 100644
> index 000000000000..362877fcafed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
> @@ -0,0 +1,21 @@
> +Qualcom Dakota HS/SS USB PHY
> +
> +Required properties:
> + - compatible: "qcom,usb-ss-ipq4019-phy",
> +	       "qcom,usb-hs-ipq4019-phy"

<vendor>,<soc>-<block> is the usual order.

> + - reg: offset and length of the registers
> + - #phy-cells: should be 0
> + - resets: the reset controllers as listed below
> + - reset-names: the names of the reset controllers
> +	"por_rst" - the POR reset line for SS and HS phys
> +	"srif_rst" - the SRIF reset line for HS phys

'_rst' is redundant.

> +Example:
> +
> +hsphy@a8000 {

usb-phy@...

> +	compatible = "qcom,usb-hs-ipq4019-phy";
> +	phy-cells = <0>;
> +	reg = <0xa8000 0x40>;
> +	resets = <&gcc USB2_HSPHY_POR_ARES>,
> +		 <&gcc USB2_HSPHY_S_ARES>;
> +	reset-names = "por_rst", "srif_rst";
> +};
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
