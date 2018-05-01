From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/27] dts: bindings: Document device tree binding for
 CATU
Date: Tue, 1 May 2018 08:10:57 -0500
Message-ID: <20180501131057.GA15706@rob-hp-laptop>
References: <1525165857-11096-1-git-send-email-suzuki.poulose@arm.com>
 <1525165857-11096-6-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525165857-11096-6-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, robert.walker@arm.com, mark.rutland@arm.com, will.deacon@arm.com, robin.murphy@arm.com, sudeep.holla@arm.com, frowand.list@gmail.com, john.horley@arm.com, devicetree@vger.kernel.org, Mathieu Poirier <mathieu.poirier@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 01, 2018 at 10:10:35AM +0100, Suzuki K Poulose wrote:
> Document CATU device-tree bindings. CATU augments the TMC-ETR
> by providing an improved Scatter Gather mechanism for streaming
> trace data to non-contiguous system RAM pages.
> 
> Cc: devicetree@vger.kernel.org
> Cc: frowand.list@gmail.com
> Cc: Rob Herring <robh@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Poirier <mathieu.poirier@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../devicetree/bindings/arm/coresight.txt          | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 15ac8e8..cdd84d0 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -39,6 +39,8 @@ its hardware characteristcs.
>  
>  		- System Trace Macrocell:
>  			"arm,coresight-stm", "arm,primecell"; [1]
> +		- Coresight Address Translation Unit (CATU)
> +			"arm, coresight-catu", "arm,primecell";

spurious space               ^

>  
>  	* reg: physical base address and length of the register
>  	  set(s) of the component.
> @@ -86,6 +88,9 @@ its hardware characteristcs.
>  	* arm,buffer-size: size of contiguous buffer space for TMC ETR
>  	 (embedded trace router)
>  
> +* Optional property for CATU :
> +	* interrupts : Exactly one SPI may be listed for reporting the address
> +	  error

Somewhere you need to define the ports for the CATU.

>  
>  Example:
>  
> @@ -118,6 +123,35 @@ Example:
>  		};
>  	};
>  
> +	etr@20070000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0 0x20070000 0 0x1000>;
> +
> +		clocks = <&oscclk6a>;
> +		clock-names = "apb_pclk";
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* input port */
> +			port@0 {
> +				reg =  <0>;
> +				etr_in_port: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&replicator2_out_port0>;
> +				};
> +			};
> +
> +			/* CATU link represented by output port */
> +			port@1 {
> +				reg = <0>;

While common in the Coresight bindings, having unit-address and reg not 
match is an error. Mathieu and I discussed this a bit as dtc now warns 
on these.

Either reg should be 1 here, or 'ports' needs to be split into input and 
output ports. My preference would be the former, but Mathieu objected to 
this not reflecting the the h/w numbering.

Rob
