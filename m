From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ZynqMP: Align gic ranges for 64k in device tree
Date: Mon, 16 May 2016 09:17:32 +0200
Message-ID: <5739740C.10901@xilinx.com>
References: <1463053441-57572-1-git-send-email-agraf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1463053441-57572-1-git-send-email-agraf@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Graf <agraf@suse.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 12.5.2016 13:44, Alexander Graf wrote:
> The GIC ranges in the zynqmp device tree are only 4kb aligned. Since
> commit 12e14066f we automatically deal with aliases GIC regions though,
> so we can map them transparently into guests even on 64kb page size
> systems.
> 
> This patch makes use of that features and sets GICC and GICV to 64kb
> aligned and sized regions.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index e595f22..38c4310 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -81,9 +81,9 @@
>  			compatible = "arm,gic-400", "arm,cortex-a15-gic";
>  			#interrupt-cells = <3>;
>  			reg = <0x0 0xf9010000 0x10000>,
> -			      <0x0 0xf902f000 0x2000>,
> +			      <0x0 0xf9020000 0x20000>,
>  			      <0x0 0xf9040000 0x20000>,
> -			      <0x0 0xf906f000 0x2000>;
> +			      <0x0 0xf9060000 0x20000>;
>  			interrupt-controller;
>  			interrupt-parent = <&gic>;
>  			interrupts = <1 9 0xf04>;
> 

Applied to zynqmp/dt with changed subject prefix ARM64: zynqmp:

Thanks,
Michal
