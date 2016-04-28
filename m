From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 2/6] of/slimbus: OF helper for SLIMbus
Date: Thu, 28 Apr 2016 12:11:11 +0100
Message-ID: <20160428111110.GD21145@leverpostej>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461801489-16254-3-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
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

Per the below code, this naming detail is Linux-specific, and should go
from the binding.

> +However, the device may need additional non-standard way to power it
> +up so that it can start functioning. In that case, child node will
> +need to be present as slave of the slimbus-controller device.
> +The compatible property will be necessary so that corresponding
> +driver can probe and execute the required procedure to make it
> +functional.
> +

I imagine there may be other properties in some cases for more than
just power management, so it may be better to say:

	In some cases it may be necessary to describe non-probeable
	details such as non-standard ways of powering up a device. In
	such cases, child nodes for those devices will be present as
	slaves of the slimbus-controller, as detailed below.

> +Required property for SLIMbus child node if it is present:
> +- reg		- enumeration address fields of the device
> +
> +- compatible	- name of SLIMbus child node using practice typically
> +		followed by discoverable buses:
> +		"<manufacturer>,<product-model>", "slim"

What's the point in the "slim" fallback? That seems to imply nothing
useful, and other busses don't do that.


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
> +			compatible = "qcom,wcdv1", "slim";
> +			reg = <0x217 0x60 0x1 0x0>;
> +		};
> +	};

I'm not familiar with SLIMbus, but other than the above comments this
binding looks ok to me.

> diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
> index 6024f74..6aaa08f 100644
> --- a/drivers/slimbus/slim-core.c
> +++ b/drivers/slimbus/slim-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/idr.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slimbus.h>
> +#include <linux/of.h>
>  
>  static DEFINE_MUTEX(slim_lock);
>  static DEFINE_IDR(ctrl_idr);
> @@ -265,6 +266,61 @@ static LIST_HEAD(board_list);
>  static LIST_HEAD(slim_ctrl_list);
>  static DEFINE_MUTEX(board_lock);
>  
> +#if IS_ENABLED(CONFIG_OF)
> +/* OF helpers for SLIMbus */
> +static void of_register_slim_devices(struct slim_controller *ctrl)
> +{
> +	struct device_node *node;
> +
> +	if (!ctrl->dev.of_node)
> +		return;
> +
> +	for_each_child_of_node(ctrl->dev.of_node, node) {
> +		int ret;
> +		u32 ea[4];
> +		struct slim_device *slim;
> +		char *name;
> +
> +		ret = of_property_read_u32_array(node, "reg", ea, 4);
> +		if (ret) {
> +			dev_err(&ctrl->dev, "of_slim: E-addr err:%d\n", ret);
> +			continue;
> +		}
> +		name = kcalloc(SLIMBUS_NAME_SIZE, sizeof(char), GFP_KERNEL);
> +		if (!name)
> +			return;
> +
> +		slim = kzalloc(sizeof(struct slim_device), GFP_KERNEL);

sizeof(*slim) would be nicer here.

Thanks,
Mark.
