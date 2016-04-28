From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V5 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Thu, 28 Apr 2016 12:28:59 +0100
Message-ID: <20160428112859.GE21145@leverpostej>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <1461801489-16254-5-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461801489-16254-5-git-send-email-sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sheetal.tigadoli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 27, 2016 at 05:58:07PM -0600, Sagar Dharia wrote:
> This controller driver programs manager, interface, and framer
> devices for Qualcomm's slimbus HW block.
> Manager component currently implements logical address setting,
> and messaging interface.
> Interface device reports bus synchronization information, and framer
> device clocks the bus from the time it's woken up, until clock-pause
> is executed by the manager device.
> 
> Signed-off-by: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/slimbus/slim-qcom-ctrl.txt |  45 ++
>  drivers/slimbus/Kconfig                            |   9 +
>  drivers/slimbus/Makefile                           |   1 +
>  drivers/slimbus/slim-qcom-ctrl.c                   | 563 +++++++++++++++++++++
>  drivers/slimbus/slim-qcom.h                        |  63 +++
>  5 files changed, 681 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
>  create mode 100644 drivers/slimbus/slim-qcom-ctrl.c
>  create mode 100644 drivers/slimbus/slim-qcom.h
> 
> diff --git a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> new file mode 100644
> index 0000000..bc05f44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> @@ -0,0 +1,45 @@
> +Qualcomm SLIMBUS controller
> +"qcom,slim-msm": This controller is used if applications processor
> +	driver controls slimbus master component (SoCs 8960, 8064).

I would strongly recommend using a more specific name, e.g.
"qcom,8960-slim", so that there's less confusion when some future SoC
inevitably has an incompatible SLIMbus controller.

The DT should contain the specific variant to account for any
integration quirks, though the device can simply have one string and
require a fallback entry for now.

> +	This driver is responsible for communicating with slave HW
> +	directly using messaging interface, and doing data channel
> +	management, and power management.

Drvier details don't belong in the DT binding, which should describe the
device independent of any particular driver.

> +
> +Required properties:
> +
> +- #address-cells - should be 4 (number of cells required to define
> +		4 fields of the enumeration address for the SLIMbus
> +		slave device)
> +- #size-cells	- should be 0

Perhaps refer to the generic SLIMbus binding document for these?

> + - reg : Offset and length of the register region(s) for the device
> + - reg-names : Register region name(s) referenced in reg above
> +	 Required register resource entries are:
> +	 "slimbus_physical": Physical adderss of controller register blocks

That name seems odd. We _always_ use physical addresses. Surely there's
some name in a datasheet for the controller, or if there isn't, then we
can just not require a name?

Nit: s/adderss/address/

> + - compatible : should be "qcom,slim-msm" if this is master component driver

As above, olease remove mentions of the driver.

> + - interrupts : Interrupt number used by this controller
> + - clocks : Interface and core clocks used by this slimbus controller
> + - clock-names : Required clock-name entries are:
> +	"iface_clk" : Interface clock for this controller
> +	"core_clk" : Interrupt for controller core's BAM
> +
> +Optional property:
> + - reg entry for slew rate : If slew rate control register is provided, this
> +	entry should be used.
> + - reg-name for slew rate: "slimbus_slew_reg"

Per the example below, this looks like an element in a separate system
controller block, or part of some other controller that's not modelled
here.

What is this, exactly?

> +
> +Example:
> +	slim@28080000 {
> +		compatible = "qcom,slim-msm";
> +		#address-cells = <4>;
> +		#size-cells = <0>;
> +		reg = <0x28080000 0x2000>, <0x80207C 4>;
> +		reg-names = "slimbus_physical", "slimbus_slew_reg";
> +		interrupts = <0 33 0>;
> +		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
> +		clock-names = "iface_clk", "core_clk";
> +
> +		codec-+jySZXB+v0i9EGZKw7sf2Q@public.gmane.org {
> +			compatible = "qcom,wcdv1", "slim";

As mentioned on the generic binding, please drop the "slim" fallback
here.

> +			reg = <0x217 0x60 0x1 0x0>;
> +		};
> +	};

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
