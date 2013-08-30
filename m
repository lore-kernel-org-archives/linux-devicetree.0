From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: dts: vexpress: Add CCI node to TC2 device-tree
Date: Fri, 30 Aug 2013 17:13:28 +0100
Message-ID: <20130830161327.GA10045@e102568-lin.cambridge.arm.com>
References: <1377872760.3655.48.camel@linaro1.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377872760.3655.48.camel@linaro1.home>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2013 at 03:26:00PM +0100, Jon Medhurst (Tixy) wrote:
> The Versatile Express V2P-CA15_A7 (aka TC2) has a CCI-400 which is
> needed to get Multi-Cluster Power Management (MCPM) working.
> 
> Signed-off-by: Jon Medhurst <tixy@linaro.org>
> ---
> 
> I was unsure if the devicetree list should be cc'd when making use of
> already agreed and documented bindings, so I erred on the side of
> caution and added it. Please say if this is unnecessary noise, or is
> expected for all device-tree changes, thanks.
> 
>  arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts |   25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> index d2803be..12bd4ea 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> @@ -37,30 +37,35 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a15";
>  			reg = <0>;
> +			cci-control-port = <&cci_control1>;
>  		};
>  
>  		cpu1: cpu@1 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a15";
>  			reg = <1>;
> +			cci-control-port = <&cci_control1>;
>  		};
>  
>  		cpu2: cpu@2 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a7";
>  			reg = <0x100>;
> +			cci-control-port = <&cci_control2>;
>  		};
>  
>  		cpu3: cpu@3 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a7";
>  			reg = <0x101>;
> +			cci-control-port = <&cci_control2>;
>  		};
>  
>  		cpu4: cpu@4 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a7";
>  			reg = <0x102>;
> +			cci-control-port = <&cci_control2>;
>  		};
>  	};
>  
> @@ -104,6 +109,26 @@
>  		interrupts = <1 9 0xf04>;
>  	};
>  
> +	cci@2c090000 {
> +		compatible = "arm,cci-400";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0 0x2c090000 0 0x1000>;
> +		ranges = <0x0 0x0 0x2c090000 0x10000>;
> +
> +		cci_control1: slave-if@4000 {
> +			compatible = "arm,cci-400-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x4000 0x1000>;
> +		};
> +
> +		cci_control2: slave-if@5000 {
> +			compatible = "arm,cci-400-ctrl-if";
> +			interface-type = "ace";
> +			reg = <0x5000 0x1000>;
> +		};
> +	};
> +
>  	memory-controller@7ffd0000 {
>  		compatible = "arm,pl354", "arm,primecell";
>  		reg = <0 0x7ffd0000 0 0x1000>;

Now that MCPM and CPU idle are heading to mainline, it should get queued asap,
thanks for that, probably as a fix at -rc1, since it is quite late now.

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
