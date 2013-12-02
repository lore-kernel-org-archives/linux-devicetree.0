From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] of: Add MIPI DSI bus device tree bindings
Date: Mon, 02 Dec 2013 20:57:20 +0100
Message-ID: <1564239.XE5EGzcucS@flatron>
References: <1385998631-18515-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1385998631-18515-1-git-send-email-treding@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On Monday 02 of December 2013 16:37:11 Thierry Reding wrote:
> Document the device tree bindings for the MIPI DSI bus. The MIPI Display
> Serial Interface specifies a serial bus and a protocol for communication
> between a host and up to four peripherals.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt  | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
>
> diff --git a/Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt b/Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
> new file mode 100644
> index 000000000000..f58ca4485a2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
> @@ -0,0 +1,54 @@
> +MIPI DSI (Display Serial Interface) busses
> +==========================================
> +
> +The MIPI Display Serial Interface specifies a serial bus and a protocol for
> +communication between a host and up to four peripherals. This document will
> +define the syntax used to represent a DSI bus in a device tree.
> +
> +This document describes DSI bus-specific properties only or defines existing
> +standard properties in the context of the DSI bus.
> +
> +Each DSI host provides a DSI bus. The DSI host controller's node contains a
> +set of properties that characterize the bus. Child nodes describe individual
> +peripherals on that bus.
> +
> +DSI host
> +--------
> +
> +In addition to the standard properties and those defined by the parent bus of
> +a DSI host, the following properties apply to a node representing a DSI host.
> +
> +Required properties:
> +- #address-cells: The number of cells required to represent an address on the
> +  bus. DSI peripherals are addressed using a 2-bit virtual channel number, so
> +  a maximum of 4 devices can be addressed on a single bus. Hence the value of
> +  this property should be 1.
> +- #size-cells: Should be 0.
> +
> +DSI peripheral
> +--------------
> +
> +Peripherals are represented as child nodes of the DSI host's node. Properties
> +described here apply to all DSI peripherals, but individual bindings may want
> +to define additional, device-specific properties.
> +
> +Required properties:
> +- reg: The virtual channel number of a DSI peripheral. Must be in the range
> +  from 0 to 3.
> +
> +Example
> +-------
> +
> +	dsi-host {
> +		...
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		peripheral@0 {
> +			compatible = "...";
> +			reg = <0>;
> +		};
> +
> +		...
> +	};
> 

In general, this looks good to me as a starter, so we could have support
for DSI bus merged. IMHO we should consider adding some generic bus
properties in future, though.

Anyway, have my

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
