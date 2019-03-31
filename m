From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: clocks: add ASR8751C bindings
Date: Sun, 31 Mar 2019 01:41:33 -0500
Message-ID: <5ca0611f.1c69fb81.662b9.c6a0@mx.google.com>
References: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
 <1553349688-1946-4-git-send-email-qiaozhou@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553349688-1946-4-git-send-email-qiaozhou@asrmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: qiaozhou <qiaozhou@asrmicro.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 23, 2019 at 10:01:24PM +0800, qiaozhou wrote:
> From: Qiao Zhou <qiaozhou@asrmicro.com>
> 
> Add binding documentation for ASR8751C clocks, which are general gating
> fixed rate and fixed ratio clocks derived from system PLL, external
> oscillator. These clocks control registers are distributed on different
> sub-controller-unit on SoCs, like APMU, MPMU, CIU etc.
> 
> Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
> ---
>  .../devicetree/bindings/clock/asr,clock.txt        | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/asr,clock.txt

Patch 5 can be combined with this one. It is part of the binding.

> 
> diff --git a/Documentation/devicetree/bindings/clock/asr,clock.txt b/Documentation/devicetree/bindings/clock/asr,clock.txt
> new file mode 100644
> index 0000000..93082a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/asr,clock.txt
> @@ -0,0 +1,31 @@
> +* Clock Controller of ASR8751C SoCs
> +
> +clock subsystem generates and supplies clock to various controllers within the
> +ASR8751C SoC.
> +
> +Required Properties:
> +
> +- compatible: should be "asr,8751c-clock"
> +
> +- reg: iomem address and length of the clock subsystem. There are 7 places in
> +  SOC has clock control logic: "mpmu", "apmu", "apbc", "apbs", "ciu", "dciu",
> +  "ddrc".

You should probably have a node for each of these blocks if they are 
separate blocks. DT nodes should match h/w blocks.

> +- reg-names: register names of each sub control logic.
> +- interrupts : Should be the interrupt number

However, how do all the blocks have a single interrupt unless it's a 
shared interrupt.

> +- #clock-cells: should be 1.

Clock controllers need some input clocks to have any output clocks.

> +
> +Example:
> +
> +	soc_clocks: clocks@d4050000{
> +		compatible = "asr,8751c-clock";
> +		reg = <0x0 0xd4050000 0x0 0x209c>,
> +		      <0x0 0xd4282800 0x0 0x400>,
> +		      <0x0 0xd4015000 0x0 0x1000>,
> +		      <0x0 0xd4090000 0x0 0x1000>,
> +		      <0x0 0xd4282c00 0x0 0x400>,
> +		      <0x0 0xd8440000 0x0 0x98>,
> +		      <0x0 0xd4200000 0x0 0x4280>;
> +		reg-names = "mpmu", "apmu", "apbc", "apbs", "ciu", "dciu", "ddrc";
> +		interrupts = <0 96 IRQ_TYPE_LEVEL_HIGH>;
> +		#clock-cells = <1>;
> +	};
> -- 
> 2.7.4
> 
