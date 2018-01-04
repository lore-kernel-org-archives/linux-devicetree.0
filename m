From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 06/12] arm64: dts: mt7622: add cpufreq related device
 nodes
Date: Thu, 4 Jan 2018 15:15:26 +0530
Message-ID: <20180104094526.GC19742@vireshk-i7>
References: <cover.1515057696.git.sean.wang@mediatek.com>
 <7e61305594b7bbcdefe31f64ca5603cbdbd9f4cf.1515057696.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e61305594b7bbcdefe31f64ca5603cbdbd9f4cf.1515057696.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04-01-18, 17:40, sean.wang@mediatek.com wrote:
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 5b7f0a3..90b2761 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -18,6 +18,50 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	cpu_opp_table: opp_table {

Rob recently asked me to do name the nodes with "-" instead of "_". So
this becomes "cpu_opp_table: opp-table {" then.

-- 
viresh
