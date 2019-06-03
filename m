From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 1/2] DT: mailbox: add binding doc for the ARM SMC
 mailbox
Date: Mon, 3 Jun 2019 09:22:16 -0700
Message-ID: <ae4c79f0-4aec-250e-e312-20aba5554665@gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-2-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603083005.4304-2-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: peng.fan@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, jassisinghbrar@gmail.com, sudeep.holla@arm.com
Cc: kernel@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.przywara@arm.com, van.freenix@gmail.com
List-Id: devicetree@vger.kernel.org

On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The ARM SMC mailbox binding describes a firmware interface to trigger
> actions in software layers running in the EL2 or EL3 exception levels.
> The term "ARM" here relates to the SMC instruction as part of the ARM
> instruction set, not as a standard endorsed by ARM Ltd.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
> Introduce interrupts as a property.
> 
> V1:
> arm,func-ids is still kept as an optional property, because there is no
> defined SMC funciton id passed from SCMI. So in my test, I still use
> arm,func-ids for ARM SIP service.
> 
>  .../devicetree/bindings/mailbox/arm-smc.txt        | 101 +++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> new file mode 100644
> index 000000000000..401887118c09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> @@ -0,0 +1,101 @@
> +ARM SMC Mailbox Interface
> +=========================
> +
> +This mailbox uses the ARM smc (secure monitor call) instruction to trigger
> +a mailbox-connected activity in firmware, executing on the very same core
> +as the caller.

The binding defines both hvc and smc as being valid methods for the mailbox.

> By nature this operation is synchronous and this mailbox
> +provides no way for asynchronous messages to be delivered the other way
> +round, from firmware to the OS, but asynchronous notification could also
> +be supported. However the value of r0/w0/x0 the firmware returns after
> +the smc call is delivered as a received message to the mailbox framework,
> +so a synchronous communication can be established, for a asynchronous
> +notification, no value will be returned. The exact meaning of both the
> +action the mailbox triggers as well as the return value is defined by
> +their users and is not subject to this binding.
> +
> +One use case of this mailbox is the SCMI interface, which uses shared memory
> +to transfer commands and parameters, and a mailbox to trigger a function
> +call. This allows SoCs without a separate management processor (or when
> +such a processor is not available or used) to use this standardized
> +interface anyway.
> +
> +This binding describes no hardware, but establishes a firmware interface.
> +Upon receiving an SMC using one of the described SMC function identifiers,
> +the firmware is expected to trigger some mailbox connected functionality.
> +The communication follows the ARM SMC calling convention[1].
> +Firmware expects an SMC function identifier in r0 or w0. The supported
> +identifiers are passed from consumers, or listed in the the arm,func-ids
> +properties as described below. The firmware can return one value in
> +the first SMC result register, it is expected to be an error value,
> +which shall be propagated to the mailbox client.
> +
> +Any core which supports the SMC or HVC instruction can be used, as long as
> +a firmware component running in EL3 or EL2 is handling these calls.
> +
> +Mailbox Device Node:
> +====================
> +
> +This node is expected to be a child of the /firmware node.
> +
> +Required properties:
> +--------------------
> +- compatible:		Shall be "arm,smc-mbox"
> +- #mbox-cells		Shall be 1 - the index of the channel needed.
> +- arm,num-chans		The number of channels supported.
> +- method:		A string, either:
> +			"hvc": if the driver shall use an HVC call, or
> +			"smc": if the driver shall use an SMC call.
> +
> +Optional properties:
> +- arm,func-ids		An array of 32-bit values specifying the function
> +			IDs used by each mailbox channel. Those function IDs
> +			follow the ARM SMC calling convention standard [1].
> +			There is one identifier per channel and the number
> +			of supported channels is determined by the length
> +			of this array.
> +- interrupts		SPI interrupts may be listed for notification,
> +			each channel should use a dedicated interrupt
> +			line.

I would not go about defining a specific kind of interrupt, since SPI is
a GIC terminology, this firmware interface could be used in premise with
any parent interrupt controller, for which the concept of a SPI/PPI/SGI
may not be relevant.

> +
> +Example:
> +--------
> +
> +	sram@910000 {
> +		compatible = "mmio-sram";
> +		reg = <0x0 0x93f000 0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0x93f000 0x1000>;
> +
> +		cpu_scp_lpri: scp-shmem@0 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x200>;
> +		};
> +
> +		cpu_scp_hpri: scp-shmem@200 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x200 0x200>;
> +		};
> +	};
> +
> +	smc_mbox: mailbox {
> +		#mbox-cells = <1>;
> +		compatible = "arm,smc-mbox";
> +		method = "smc";
> +		arm,num-chans = <0x2>;
> +		/* Optional */
> +		arm,func-ids = <0xc20000fe>, <0xc20000ff>;
> +	};
> +
> +	firmware {
> +		scmi {
> +			compatible = "arm,scmi";
> +			mboxes = <&mailbox 0 &mailbox 1>;

It is visually nicer (and more consistent with yoyr arm,func-ids example
to use:
			mboxes = <&mailbox 0>, <&mailbox 1>;

> +			mbox-names = "tx", "rx";
> +			shmem = <&cpu_scp_lpri &cpu_scp_hpri>;

			shmem = <&cpu_scp_lpri>, <&cpu_scp_hpri>;

Other than those, LGTM!
-- 
Florian
