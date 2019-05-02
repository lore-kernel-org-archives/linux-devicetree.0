From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins
 number to GMAC node
Date: Thu, 2 May 2019 08:41:56 -0700
Message-ID: <56933076-879c-78a0-4bae-2613203b93b1@synopsys.com>
References: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

+CC Alexey, Eugeniy who maintain hsdk support !

On 5/2/19 8:12 AM, Jose Abreu wrote:
> GMAC controller on HSDK boards supports 256 Hash Table size so we need to
> add the multicast filter bins property. This allows for the Hash filter
> to work properly using stmmac driver.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/arc/boot/dts/hsdk.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 69bc1c9e8e50..b0f059377ab0 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -187,6 +187,7 @@
>  			interrupt-names = "macirq";
>  			phy-mode = "rgmii";
>  			snps,pbl = <32>;
> +			snps,multicast-filter-bins = <256>;
>  			clocks = <&gmacclk>;
>  			clock-names = "stmmaceth";
>  			phy-handle = <&phy0>;
> 
