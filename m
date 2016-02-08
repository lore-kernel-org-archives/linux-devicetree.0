From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 2/6] of/slimbus: OF helper for SLIMbus
Date: Mon, 8 Feb 2016 14:24:13 -0600
Message-ID: <20160208202413.GA26297@rob-hp-laptop>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-3-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-3-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 06, 2016 at 11:44:21AM -0700, Sagar Dharia wrote:
> OF helper routine scans the SLIMbus DeviceTree, allocates resources,
> and creates slim_devices according to the hierarchy.
> 
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/slimbus/bus.txt | 54 ++++++++++++++++
>  drivers/slimbus/slim-core.c                       | 75 +++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
> 
> diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
> new file mode 100644
> index 0000000..71c769d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/bus.txt
> @@ -0,0 +1,54 @@
> +SLIM(Serial Low Power Interchip Media Bus) bus
> +
> +SLIMbus is a 2-wire bus, and is used to communicate with peripheral
> +components like audio-codec.
> +
> +Controller is a normal device using binding for whatever bus it is
> +on (e.g. platform bus).
> +Required property for SLIMbus controller node:
> +- compatible	- name of SLIMbus controller following generic names
> +		recommended practice.
> +- #address-cells - should be 4 (number of cells required to define
> +		4 fields of the enumeration address for the SLIMbus
> +		slave device)
> +- #size-cells	- should be 0
> +
> +No other properties are required in the SLIMbus controller bus node.
> +
> +Child nodes:
> +Every SLIMbus controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SLIMbus slave device is
> +uniquely determined by the enumeration address containing 4 fields:
> +Manufacturer ID, Product code, Device index, and Instance value for
> +the device.
> +
> +Required property for SLIMbus child node:
> +- reg		- enumeration address fields of the device
> +
> +Optional:
> +- compatible	- Slave devices can use compatible field to have a name.
> +		If this field is missing, name of the device will be
> +		determined using slave's enumeration address.
> +		(e.g. in the example below, slave's name will be:
> +		0x217:0x60:0x1:0x0)

The compatible string should follow other discoverable buses like PCI 
and USB and use the enumeration data for the compatible string. 
Something like "slim<manuID>,<product code>". 

> +		Note that the property is listed as optional since the
> +		devices are discoverable when they are functional.
> +		However, the device may need additional non-standard
> +		way to power it up so that it can start functioning.
> +		In that case, compatible property will be
> +		needed for the corresponding driver to probe and
> +		perform the required procedure to make it functional.

I think the node being present should be optional, but the compatible 
should be required if node is present.

> +
> +SLIMbus example for Qualcomm's slimbus manager component:
> +
> +	slim@28080000 {
> +		compatible = "qcom,slim-msm";
> +		reg = <0x28080000 0x2000>,
> +		interrupts = <0 33 0>;
> +		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
> +		clock-names = "iface_clk", "core_clk";
> +
> +		codec_slave@0217.0060.01.00 {

Unique fields should be separated by commas.

Probably should just be "codec@..."

> +			reg = <0x217 0x60 0x1 0x0>;
> +		};
> +	};
