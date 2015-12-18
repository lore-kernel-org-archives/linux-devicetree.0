From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/3] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Sat, 19 Dec 2015 00:51:26 +0300
Message-ID: <56747FDE.9040308@cogentembedded.com>
References: <1450474676-10210-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450474676-10210-1-git-send-email-jonmason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/19/2015 12:37 AM, Jon Mason wrote:

> Add support for the ARM TWD Watchdog to the bcm5301x device tree.  The
> ARM TWD timer allocated the register space for the WDT, so this patch
> necessitated shrinking that.  Also, the GIC masks were added for these.
>
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---
>   arch/arm/boot/dts/bcm5301x.dtsi | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
> index 65a1309..c31fafe 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -66,10 +66,19 @@
>   			clocks = <&periph_clk>;
>   		};
>
> -		local-timer@20600 {
> +		twd-timer@20600 {

    Please just "timer". The node names should be very generic, according to 
the ePAPR standard.

>   			compatible = "arm,cortex-a9-twd-timer";
> -			reg = <0x20600 0x100>;
> -			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x20600 0x20>;
> +			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +						  IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks = <&periph_clk>;
> +		};
> +
> +		twd-watchdog@20620 {

    Please, just "watchdog".

MBR, Sergei
