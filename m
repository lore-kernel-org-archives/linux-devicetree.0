From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RESEND v8 1/4] arm64: arch_timer: Add device tree binding
 for hisilicon-161010101 erratum
Date: Thu, 19 Jan 2017 12:10:08 +0000
Message-ID: <20170119121008.GE11176@leverpostej>
References: <1484826406-16348-1-git-send-email-dingtianhong@huawei.com>
 <1484826406-16348-2-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484826406-16348-2-git-send-email-dingtianhong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ding Tianhong <dingtianhong@huawei.com>
Cc: devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, stuart.yoder@nxp.com, linuxarm@huawei.com, oss@buserror.net, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 07:46:43PM +0800, Ding Tianhong wrote:
> This erratum describes a bug in logic outside the core, so MIDR can't be
> used to identify its presence, and reading an SoC-specific revision
> register from common arch timer code would be awkward.  So, describe it
> in the device tree.
> 
> Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
> index ad440a2..9116934 100644
> --- a/Documentation/devicetree/bindings/arm/arch_timer.txt
> +++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
> @@ -31,6 +31,14 @@ to deliver its interrupts via SPIs.
>    This also affects writes to the tval register, due to the implicit
>    counter read.
>  
> +- hisilicon,erratum-161010101 : A boolean property. Indicates the presence of
> +  erratum 161010101, which says that reading the counter is unreliable unless
> +  reading twice on the register and the value of the second read is larger
> +  than the first by less than 32. If the verification is unsuccessful, then
> +  discard the value of this read and repeat this procedure until the verification
> +  is successful.  This also affects writes to the tval register, due to the
> +  implicit counter read.

This describes the workaround, which shouldn't be necessary.

My understanding (from the cover letter) is that reads of the
{virtual,physical} counters may return a value precisely 32 above the
true value.

So it would be better to say:

- hisilicon,erratum-161010101 : A boolean property. Indicates the
  presence of Hisilicon erratum 161010101, which says that reading the
  counters is unreliable in some cases, and reads may return a value 32
  beyond the correct value. This also affects writes to the tval
  registers, due to the implicit counter read.

Thanks,
Mark.
