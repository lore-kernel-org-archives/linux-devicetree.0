From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding documentation
Date: Mon, 16 Sep 2019 17:05:36 -0700
Message-ID: <20190917000535.GE12789@Asurada-Nvidia.nvidia.com>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2019 at 05:42:13PM +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> new file mode 100644
> index 000000000000..40353fc30255
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
> @@ -0,0 +1,36 @@
> +fsl,mqs audio CODEC
> +
> +Required properties:
> +  - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
> +		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
> +  - clocks : A list of phandles + clock-specifiers, one for each entry in
> +	     clock-names
> +  - clock-names : "mclk" - must required.
> +		  "core" - required if compatible is "fsl,imx8qm-mqs", it
> +		           is for register access.
> +  - gpr : A phandle of General Purpose Registers in IOMUX Controller.
> +	  Required if compatible is "fsl,imx6sx-mqs".
> +
> +Required if compatible is "fsl,imx8qm-mqs":
> +  - power-domains: A phandle of PM domain provider node.
> +  - reg: Offset and length of the register set for the device.
> +
> +Example:
> +
> +mqs: mqs {
> +	compatible = "fsl,imx6sx-mqs";
> +	gpr = <&gpr>;
> +	clocks = <&clks IMX6SX_CLK_SAI1>;
> +	clock-names = "mclk";
> +	status = "disabled";
> +};
> +
> +mqs: mqs@59850000 {
> +	compatible = "fsl,imx8qm-mqs";
> +	reg = <0x59850000 0x10000>;
> +	clocks = <&clk IMX8QM_AUD_MQS_IPG>,
> +		 <&clk IMX8QM_AUD_MQS_HMCLK>;
> +	clock-names = "core", "mclk";
> +	power-domains = <&pd_mqs0>;
> +	status = "disabled";
> +};
> -- 
> 2.21.0
> 
