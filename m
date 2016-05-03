From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 2/6] of/slimbus: OF helper for SLIMbus
Date: Tue, 3 May 2016 11:11:56 -0500
Message-ID: <20160503161156.GA12898@rob-hp-laptop>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 27, 2016 at 05:58:05PM -0600, Sagar Dharia wrote:
> OF helper routine scans the SLIMbus DeviceTree, allocates resources,
> and creates slim_devices according to the hierarchy.
> 
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/slimbus/bus.txt | 55 ++++++++++++++++++++++
>  drivers/slimbus/slim-core.c                       | 57 +++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
> 
> diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
> new file mode 100644
> index 0000000..c5bb54a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/bus.txt
> @@ -0,0 +1,55 @@
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
> +If child node is not present and it is instantiated after device
> +discovery (slave device reporting itself present),
> +its name will be in this format: "217:60:1:0"
> +
> +However, the device may need additional non-standard way to power it
> +up so that it can start functioning. In that case, child node will
> +need to be present as slave of the slimbus-controller device.
> +The compatible property will be necessary so that corresponding
> +driver can probe and execute the required procedure to make it
> +functional.
> +
> +Required property for SLIMbus child node if it is present:
> +- reg		- enumeration address fields of the device
> +
> +- compatible	- name of SLIMbus child node using practice typically
> +		followed by discoverable buses:
> +		"<manufacturer>,<product-model>", "slim"

Im most cases for compatible strings on discoverable buses, the VID and 
PID (and perhaps more) are used to form the compatible string. See USB 
binding for a recent example. This will save you from having to make up 
strings for every device.

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
> +		codec@0217.0060.01.00 {

unit-addresses should use ',' to separate fields and generally don't 
have leading zeros.

> +			compatible = "qcom,wcdv1", "slim";
> +			reg = <0x217 0x60 0x1 0x0>;
> +		};
> +	};
