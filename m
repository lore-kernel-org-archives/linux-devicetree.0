From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 06/12] media: dt-bindings: add bindings for i.MX7
 media driver
Date: Fri, 18 May 2018 18:08:57 +0200
Message-ID: <1526659737.3948.19.camel@pengutronix.de>
References: <20180518092806.3829-1-rui.silva@linaro.org>
 <20180518092806.3829-7-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180518092806.3829-7-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-05-18 at 10:28 +0100, Rui Miguel Silva wrote:
> Add bindings documentation for i.MX7 media drivers.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/media/imx7.txt        | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx7.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx7.txt b/Documentation/devicetree/bindings/media/imx7.txt
> new file mode 100644
> index 000000000000..a26372630377
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx7.txt
> @@ -0,0 +1,125 @@
> +Freescale i.MX7 Media Video Device
> +==================================
> +
> +mipi_csi2 node
> +--------------
> +
> +This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
> +compatible with previous version of Samsung D-phy.
> +
> +Required properties:
> +
> +- compatible    : "fsl,imx7-mipi-csi2";
> +- reg           : base address and length of the register set for the device;
> +- interrupts    : should contain MIPI CSIS interrupt;
> +- clocks        : list of clock specifiers, see
> +        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> +- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
> +                  entries in the clock property;
> +- power-domains : a phandle to the power domain, see
> +          Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- reset-names   : should include following entry "mrst";
> +- resets        : a list of phandle, should contain reset entry of
> +                  reset-names;
> +- phy-supply    : from the generic phy bindings, a phandle to a regulator that
> +	          provides power to MIPI CSIS core;
> +- bus-width     : maximum number of data lanes supported (SoC specific);
> +
> +Optional properties:
> +
> +- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
> +		    value when this property is not specified is 166 MHz;

Could this be obtained from one of the clock inputs via clk_get_rate?

regards
Philipp
