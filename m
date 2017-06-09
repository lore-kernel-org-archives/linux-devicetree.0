From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/8] Documentation: add DT binding for ARM System
 Control and Management Interface(SCMI) protocol
Date: Fri, 9 Jun 2017 09:16:32 -0500
Message-ID: <20170609141632.eni4k3c4aiyvbkfk@rob-hp-laptop>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
 <1496851812-19623-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496851812-19623-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 07, 2017 at 05:10:05PM +0100, Sudeep Holla wrote:
> This patch adds devicetree binding for System Control and Management
> Interface (SCMI) Message Protocol used between the Application Cores(AP)
> and the System Control Processor(SCP). The MHU peripheral provides a
> mechanism for inter-processor communication between SCP's M3 processor
> and AP.
> 
> SCP offers control and management of the core/cluster power states,
> various power domain DVFS including the core/cluster, certain system
> clocks configuration, thermal sensors and many others.
> 
> SCMI protocol is developed as better replacement to the existing SCPI
> which is not flexible and easily extensible.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arm,scmi.txt | 193 +++++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,scmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
> new file mode 100644
> index 000000000000..d6e4b7eff199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
> @@ -0,0 +1,193 @@
> +System Control and Management Interface (SCMI) Message Protocol
> +----------------------------------------------------------
> +
> +The SCMI is intended to allow agents such as OSPM to manage various functions
> +that are provided by the hardware platform it is running on, including power
> +and performance functions.
> +
> +This binding is intended to define the interface the firmware implementing
> +the SCMI as described in ARM document number ARM DUI 0922B ("ARM System Control
> +and Management Interface Platform Design Document")[0] provide for OSPM in
> +the device tree.
> +
> +Required properties:
> +
> +- compatible : shall be "arm,scmi"

Convince me that this genericish string is specific enough.

> +- method : The method of calling the SCMI firmware. Only permitted value
> +	   currently is:
> +	   "mailbox-doorbell" : When mailbox doorbell is used as a mechanism
> +				to alert the presence of a messages and/or
> +				notification
> +- mboxes: List of phandle and mailbox channel specifiers. It should contain
> +	  exactly one or two mailboxes, one for transmitting messages("tx")
> +	  and another optional for receiving the notifications("rx") if
> +	  supported.
> +- mbox-names: shall be "tx" or "rx"

...and optionally "rx"

> +- shmem : List of phandle pointing to the shared memory(SHM) area between the
> +	  processors using these mailboxes for IPC, one for each mailbox
> +	  SHM can be any memory reserved for the purpose of this communication
> +	  between the processors.

Maybe the mailbox binding should have a standard property for this?

> +
> +See Documentation/devicetree/bindings/mailbox/mailbox.txt for more details
> +about the generic mailbox controller and client driver bindings.
> +
> +Each protocol supported shall have a sub-node with corresponding compatible
> +as described in the following sections. If the platform supports dedicated
> +communication channel for a particular protocol, the 3 properties namely:
> +mboxes, mbox-names and shmem shall be present in the sub-node corresponding
> +to that protocol.
> +
> +Clock/Performance bindings for the clocks/OPPs based on SCMI Message Protocol
> +------------------------------------------------------------
> +
> +This binding uses the common clock binding[1].
> +
> +Required properties:
> +- compatible : shall be "arm,scmi-clocks" or "arm,scmi-perf-domains"
> +	arm,scmi-clocks:
> +	       These clocks either provide an entire range of values
> +	       between the limits or only discrete points each at fixed
> +	       step size between the limits. The firmware provides
> +	       mechanism to discover them.
> +	arm,scmi-perf-domains:
> +		These are OPPs(not just simple clocks), i.e. discrete
> +		performance levels that are supported by the platform.
> +		Again the firmware provides mechanism to discover the
> +		performance and other attributes associated with the
> +		levels.
> +
> +Other required properties for all clocks(all from common clock binding):
> +- #clock-cells : Should be 1. Contains the Clock ID value used by SCMI commands.
> +- clock-indices: The identifying number for the clocks(i.e.clock_id) in the
> +	node. It can be non linear and hence provide the mapping of
> +	identifiers.
> +
> +Power domain bindings for the power domains based on SCMI Message Protocol
> +------------------------------------------------------------
> +
> +This binding uses the generic power domain binding[4].
> +
> +PM domain providers
> +===================
> +
> +Required properties:
> + - #power-domain-cells : Should be 1. Contains the device or the power
> +			 domain ID value used by SCMI commands.
> +
> +PM domain consumers
> +===================
> +
> +Required properties:
> + - power-domains : A phandle and PM domain specifier as defined by bindings of
> +                   the power controller specified by phandle.
> +
> +Sensor bindings for the sensors based on SCMI Message Protocol
> +--------------------------------------------------------------
> +SCMI provides an API to access the various sensors on the SoC.
> +
> +Required properties:
> +- compatible : should be "arm,scmi-sensors".
> +- #thermal-sensor-cells: should be set to 1. This property follows the
> +			 thermal device tree bindings[2].
> +
> +			 Valid cell values are raw identifiers (Sensor ID)
> +			 as used by the firmware. Refer to  platform details
> +			 for your implementation for the IDs to use.
> +
> +SRAM and Shared Memory for SCMI
> +-------------------------------
> +
> +A small area of SRAM is reserved for SCMI communication between application
> +processors and SCP.
> +
> +The properties should follow the generic mmio-sram description found in [3]
> +
> +Each sub-node represents the reserved area for SCMI.
> +
> +Required sub-node properties:
> +- reg : The base offset and size of the reserved area with the SRAM
> +- compatible : should be "arm,scp-shmem" for Non-secure SRAM based
> +	       shared memory
> +
> +[0] http://infocenter.arm.com/help/topic/com.arm.doc.den0056a/index.html
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/thermal/thermal.txt
> +[3] Documentation/devicetree/bindings/sram/sram.txt
> +[4] Documentation/devicetree/bindings/power/power_domain.txt
> +
> +Example:
> +
> +sram: sram@50000000 {
> +	compatible = "arm,juno-sram-ns", "mmio-sram";
> +	reg = <0x0 0x50000000 0x0 0x10000>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0 0x0 0x50000000 0x10000>;
> +
> +	cpu_scp_lpri: scp-shmem@0 {
> +		compatible = "arm,juno-scp-shmem";
> +		reg = <0x0 0x200>;
> +	};
> +
> +	cpu_scp_hpri: scp-shmem@200 {
> +		compatible = "arm,juno-scp-shmem";
> +		reg = <0x200 0x200>;
> +	};
> +};
> +
> +mailbox: mailbox0@40000000 {
> +	....
> +	#mbox-cells = <1>;
> +};
> +
> +scmi_protocol: scmi@2e000000 {
> +	compatible = "arm,scmi";
> +	mboxes = <&mailbox 0 &mailbox 1>;
> +	shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
> +
> +	scmi_dvfs: clocks@0 {
> +		compatible = "arm,scmi-perf-domains";
> +		#clock-cells = <1>;
> +		clock-indices = <0>, <1>, <2>;
> +	};
> +	scmi_clk: clocks@3 {
> +		compatible = "arm,scmi-clocks";
> +		#clock-cells = <1>;
> +		clock-indices = <3>, <4>;
> +	};
> +
> +	scmi_sensors: sensors {
> +		compatible = "arm,scmi-sensors";
> +		#thermal-sensor-cells = <1>;
> +	};
> +
> +	scmi_devpd: power-domains {
> +		compatible = "arm,scmi-power-domains";
> +		#power-domain-cells = <1>;
> +	};
> +};
> +
> +cpu@0 {
> +	...
> +	reg = <0 0>;
> +	clocks = <&scmi_dvfs 0>;
> +};
> +
> +hdlcd@7ff60000 {
> +	...
> +	reg = <0 0x7ff60000 0 0x1000>;
> +	clocks = <&scmi_clk 4>;
> +	power-domains = <&scmi_devpd 1>;
> +};
> +
> +thermal-zones {
> +	soc_thermal {
> +		polling-delay-passive = <100>;
> +		polling-delay = <1000>;
> +
> +				/* sensor         ID */
> +		thermal-sensors = <&scmi_sensors0 3>;
> +		...
> +	};
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
