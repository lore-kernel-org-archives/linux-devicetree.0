From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/3] coresight: bindings for debug module
Date: Wed, 1 Mar 2017 08:45:50 -0700
Message-ID: <20170301154550.GA4009@linaro.org>
References: <1488294420-14188-1-git-send-email-leo.yan@linaro.org>
 <1488294420-14188-2-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488294420-14188-2-git-send-email-leo.yan@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 11:06:58PM +0800, Leo Yan wrote:
> According to ARMv8 architecture reference manual (ARM DDI 0487A.k)
> Chapter 'Part H: External debug', the CPU can integrate debug module
> and it can support self-hosted debug and external debug. Especially
> for supporting self-hosted debug, this means the program can access
> the debug module from mmio region; and usually the mmio region is
> integrated with coresight.
> 
> So add document for binding debug component, includes binding to APB
> clock; and also need specify the CPU node which the debug module is
> dedicated to specific CPU.
> 
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../devicetree/bindings/arm/coresight-debug.txt    | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-debug.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight-debug.txt b/Documentation/devicetree/bindings/arm/coresight-debug.txt
> new file mode 100644
> index 0000000..89820d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight-debug.txt
> @@ -0,0 +1,40 @@
> +* CoreSight Debug Component:
> +
> +CoreSight debug component are compliant with the ARMv8 architecture reference
> +manual (ARM DDI 0487A.k) Chapter 'Part H: External debug'. The external debug
> +module is mainly used for two modes: self-hosted debug and external debug, and
> +it can be accessed from mmio region from Coresight and eventually the debug
> +module connects with CPU for debugging. And the debug module provides
> +sample-based profiling extension, which can be used to sample CPU program
> +counter, secure state and exception level, etc; usually every CPU has one
> +dedicated debug module to be connected.
> +
> +Required properties:
> +
> +- compatible : should be
> +	     * "arm,coresight-debug", "arm,primecell"; supplemented with
> +	       "arm,primecell" as driver is using the AMBA bus interface.

             * "arm,coresight-debug"; supplemented with "arm,primecell" since
               this driver is using the AMBA bus interface.

> +
> +- reg : physical base address and length of the register set.
> +
> +- clocks : the clock associated to this component.
> +
> +- clock-names : the name of the clock referenced by the code. Since we are
> +                using the AMBA framework, the name of the clock providing
> +		the interconnect should be "apb_pclk" and the clock is
> +		mandatory. The interface between the debug logic and the
> +		processor core is clocked by the internal CPU clock, so it
> +		is enabled with CPU clock by default.
> +
> +- cpu : the cpu phandle the debug module is affined to. When omitted
> +	the source is considered to belong to CPU0.

s/source/module

With those change:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
> +Example:
> +
> +	debug@f6590000 {
> +		compatible = "arm,coresight-debug","arm,primecell";
> +		reg = <0 0xf6590000 0 0x1000>;
> +		clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu0>;
> +	};
> -- 
> 2.7.4
> 
