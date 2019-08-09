From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Date: Fri, 9 Aug 2019 17:42:52 +0300
Message-ID: <20190809144252.GD864@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

Hi Luis,

On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
> RX mode.
> 
> Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> ---
> Changelog
> v3-v4
> - @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
>   it is really useful for me here. I removed all other the proprietary
>   properties except this one. Do you still think it must be removed?

Yes. DT is the wrong place for runtime configuration. You get that
information using the V4L2_CID_LINK_FREQ control on the upstream
sub-device.

> - Frequency units @Rob
> 
>  .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> new file mode 100644
> index 0000000..50603e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> @@ -0,0 +1,29 @@
> +Synopsys DesignWare MIPI Rx D-PHY block details
> +
> +Description
> +-----------
> +
> +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
> +Please refer to phy-bindings.txt for more information.
> +
> +Required properties:
> +- compatible		: Shall be "snps,dw-dphy-rx".
> +- #phy-cells		: Must be 1.
> +- bus-width		: Size of the test interface data bus (8 bits->8 or
> +			  12bits->12).

Hmm. This seems like runtime configuration as well.

> +- snps,dphy-frequency	: Frequency at which D-PHY should start, configurable.
> +			  Check Synopsys databook. (-kHz)
> +- reg			: Test interface register. This correspondes to the
> +			  physical base address of the controller and size of
> +			  the device memory mapped registers; Check Synopsys
> +			  databook.

Is this just for testing purposes or not?

> +
> +Example:
> +
> +	mipi_dphy_rx1: dphy@d00003040 {
> +		compatible = "snps,dw-dphy-rx";
> +		#phy-cells = <1>;
> +		bus-width = <12>;
> +		snps,dphy-frequency = <300000>;
> +		reg = <0xd0003040 0x20>;
> +	};

-- 
Regards,

Sakari Ailus
