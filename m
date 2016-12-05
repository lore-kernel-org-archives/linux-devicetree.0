From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: zx: add pcu_domain node for zx296718
Date: Mon, 5 Dec 2016 16:54:13 +0800
Message-ID: <20161205085411.GB2749@dragon>
References: <1480925871-20855-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1480925871-20855-1-git-send-email-baoyou.xie@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, xie.baoyou@zte.com.cn, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, chen.chaokai@zte.com.cn, viresh.kumar@linaro.org, wang.qiang01@zte.com.cn, jun.nie@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2016 at 04:17:51PM +0800, Baoyou Xie wrote:
> This patch adds the pcu_domain node, so it can be used
> by zte-soc's power domain driver.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>

I'm fine with the patch itself, but I need to wait the driver and
bindings being accepted to apply it.

Shawn

> ---
>  arch/arm64/boot/dts/zte/zx296718.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
> index b44d1d1..1aa0587 100644
> --- a/arch/arm64/boot/dts/zte/zx296718.dtsi
> +++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
> @@ -302,6 +302,11 @@
>  			reg = <0x116000 0x1000>;
>  		};
>  
> +		pcu_domain: pcu@117000 {
> +			compatible = "zte,zx296718-pcu";
> +			reg = <0x00117000 0x1000>;
> +		};
> +
>  		uart0: uart@11f000 {
>  			compatible = "arm,pl011", "arm,primecell";
>  			arm,primecell-periphid = <0x001feffe>;
> -- 
> 2.7.4
> 
