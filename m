From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Thu, 2 Mar 2017 19:54:22 +0100
Message-ID: <de705b40-1a8a-faef-846e-3635682671f6@gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Mason <jon.mason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/28/2017 09:31 PM, Jon Mason wrote:
> From: Jon Mason <jonmason@broadcom.com>
>
> Add support for the ARM TWD Watchdog to the bcm5301x device tree.  The
> ARM TWD timer allocated the register space for the WDT, so this patch
> necessitated shrinking that.  Also, the GIC masks were added for these.
>
> Signed-off-by: Jon Mason <jonmason@broadcom.com>
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
> index 4fbb089..3fbc450 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -70,10 +70,19 @@
>  			clocks = <&periph_clk>;
>  		};
>
> -		local-timer@20600 {
> +		timer@20600 {
>  			compatible = "arm,cortex-a9-twd-timer";
> -			reg = <0x20600 0x100>;
> -			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x20600 0x20>;
> +			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +						  IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks = <&periph_clk>;
> +		};

If you follow my recent e-mail thread:
BCM5301X: GIC: PPI11 is secure or misconfigured (same for PPI13)
you'll see IRQ_TYPE_LEVEL_HIGH type isn't correct. It should be
IRQ_TYPE_EDGE_RISING.

I believe patch switching to IRQ_TYPE_EDGE_RISING should be sent with Cc stable
for kernels 4.8+.

The same change is needed for "arm,cortex-a9-global-timer".

Would you find time to revise this patch?
