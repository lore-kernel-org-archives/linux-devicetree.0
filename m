From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 02/39] [media] dt-bindings: Add bindings for i.MX
 media driver
Date: Mon, 20 Mar 2017 10:02:35 -0500
Message-ID: <20170320150235.xfd7c3a26au5qmyz@rob-hp-laptop>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-3-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1489121599-23206-3-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>, Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, Steve Longerbeam <steve_longerbeam@mentor.com>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

+Ramiro

On Thu, Mar 09, 2017 at 08:52:42PM -0800, Steve Longerbeam wrote:
> Add bindings documentation for the i.MX media driver.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> ---
>  Documentation/devicetree/bindings/media/imx.txt | 74 +++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
> new file mode 100644
> index 0000000..3059c06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx.txt
> @@ -0,0 +1,74 @@
> +Freescale i.MX Media Video Device
> +=================================
> +
> +Video Media Controller node
> +---------------------------
> +
> +This is the media controller node for video capture support. It is a
> +virtual device that lists the camera serial interface nodes that the
> +media device will control.
> +
> +Required properties:
> +- compatible : "fsl,imx-capture-subsystem";
> +- ports      : Should contain a list of phandles pointing to camera
> +		sensor interface ports of IPU devices
> +
> +example:
> +
> +capture-subsystem {
> +	compatible = "fsl,imx-capture-subsystem";
> +	ports = <&ipu1_csi0>, <&ipu1_csi1>;
> +};
> +
> +fim child node
> +--------------
> +
> +This is an optional child node of the ipu_csi port nodes. If present and
> +available, it enables the Frame Interval Monitor. Its properties can be
> +used to modify the method in which the FIM measures frame intervals.
> +Refer to Documentation/media/v4l-drivers/imx.rst for more info on the
> +Frame Interval Monitor.
> +
> +Optional properties:
> +- fsl,input-capture-channel: an input capture channel and channel flags,
> +			     specified as <chan flags>. The channel number
> +			     must be 0 or 1. The flags can be
> +			     IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, or
> +			     IRQ_TYPE_EDGE_BOTH, and specify which input
> +			     capture signal edge will trigger the input
> +			     capture event. If an input capture channel is
> +			     specified, the FIM will use this method to
> +			     measure frame intervals instead of via the EOF
> +			     interrupt. The input capture method is much
> +			     preferred over EOF as it is not subject to
> +			     interrupt latency errors. However it requires
> +			     routing the VSYNC or FIELD output signals of
> +			     the camera sensor to one of the i.MX input
> +			     capture pads (SD1_DAT0, SD1_DAT1), which also
> +			     gives up support for SD1.
> +
> +
> +mipi_csi2 node
> +--------------
> +
> +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
> +CSI-2 sensors.
> +
> +Required properties:
> +- compatible	: "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";

Ramiro is also working on a binding for DW MIPI CSI2 block[1]. We need 1 
binding for that.

> +- reg           : physical base address and length of the register set;
> +- clocks	: the MIPI CSI-2 receiver requires three clocks: hsi_tx
> +		  (the D-PHY clock), video_27m (D-PHY PLL reference
> +		  clock), and eim_podf;
> +- clock-names	: must contain "dphy", "ref", "pix";
> +- port@*        : five port nodes must exist, containing endpoints
> +		  connecting to the source and sink devices according to
> +		  of_graph bindings. The first port is an input port,
> +		  connecting with a MIPI CSI-2 source, and ports 1
> +		  through 4 are output ports connecting with parallel
> +		  bus sink endpoint nodes and correspond to the four
> +		  MIPI CSI-2 virtual channel outputs.
> +
> +Optional properties:
> +- interrupts	: must contain two level-triggered interrupts,
> +		  in order: 100 and 101;
> -- 
> 2.7.4
> 

[1] https://lkml.org/lkml/2017/3/7/395
