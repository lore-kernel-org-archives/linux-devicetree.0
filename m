From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/3] dts: Updated devicetree bindings for Zynq 7000
 platform
Date: Mon, 12 Oct 2015 11:32:44 +0200
Message-ID: <561B7E3C.4060908@xilinx.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444344307-22509-3-git-send-email-moritz.fischer@ettus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Moritz Fischer <moritz.fischer@ettus.com>, michal.simek@xilinx.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, atull@opensource.altera.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, dinguyen@opensource.altera.com, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

On 10/09/2015 12:45 AM, Moritz Fischer wrote:
> Added addtional bindings required for FPGA Manager operation
> of the Xilinx Zynq Devc configuration interface.
> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index dc0457e..1a5220e 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -294,6 +294,11 @@
>  		devcfg: devcfg@f8007000 {
>  			compatible = "xlnx,zynq-devcfg-1.0";
>  			reg = <0xf8007000 0x100>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <0 8 4>;
> +			clocks = <&clkc 12>;
> +			clock-names = "ref_clk";
> +			syscon = <&slcr>;
>  		};
>  
>  		global_timer: timer@f8f00200 {
> 

This patch should go via arm-soc tree. That's why please remove it from
this patchset.

Thanks,
Michal
