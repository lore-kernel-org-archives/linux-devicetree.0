From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Date: Fri, 28 Jun 2019 17:13:26 +0300
Message-ID: <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

Hi Luis,

Thank you for the patchset.

On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> From: Luis Oliveira <lolivei@synopsys.com>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> ---
> Changelog
> v3-v4
> - remove "plat" from the block name @rob @laurent
> - remove "phy-names" when single-entry @rob
> - remove "snps,output-type" -> went to the driver config @laurent
> 
>  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> new file mode 100644
> index 0000000..613b7f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> @@ -0,0 +1,41 @@
> +Synopsys DesignWare CSI-2 Host controller
> +
> +Description
> +-----------
> +
> +This HW block is used to receive image coming from an MIPI CSI-2 compatible
> +camera.
> +
> +Required properties:
> +- compatible		: shall be "snps,dw-csi"
> +- reg			: physical base address and size of the device memory
> +			  mapped registers;
> +- interrupts		: DW CSI-2 Host interrupts
> +- phys			: List of one PHY specifier (as defined in
> +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> +			  This PHY is a MIPI DPHY working in RX mode.
> +- resets		: Reference to a reset controller (optional)
> +
> +The per-board settings:
> + - port sub-node describing a single endpoint connected to the camera as
> +   described in video-interfaces.txt[1].

Which endpoint properties in video-interfaces.txt are relevant for the
hardware? Which values may they have?

> +
> +Example:
> +
> +	csi2: csi2@3000 {
> +		compatible = "snps,dw-csi";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = < 0x03000 0x7FF>;

reg = <0x03000 0x7FF>;

> +		phys = <&mipi_dphy_rx>;
> +		resets = <&dw_rst 1>;
> +		interrupts = <2>;
> +
> +		port@0 {
> +			reg = <0>;

You can drop "@0" and the reg property.

> +			csi_ep1: endpoint {
> +				remote-endpoint = <&camera_1>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};

-- 
Kind regards,

Sakari Ailus
