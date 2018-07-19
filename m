From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 17/17] MIPS: JZ4740: DTS: Add DMA nodes
Date: Thu, 19 Jul 2018 11:03:10 +0300
Message-ID: <d4a95b78-0fdf-a341-3fe9-91cb94ab164b@cogentembedded.com>
References: <20180718182023.8182-1-paul@crapouillou.net>
 <20180718182023.8182-18-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718182023.8182-18-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 7/18/2018 9:20 PM, Paul Cercueil wrote:

> Add the devicetree nodes for the DMA core of the JZ4740 SoC, disabled
> by default, as currently there are no clients for the DMA driver
> (until the MMC driver and/or others get a devicetree node).
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> ---
>   arch/mips/boot/dts/ingenic/jz4740.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
>   v2: New patch in this series
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 26c6b561d6f7..47d93f2597af 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -154,6 +154,21 @@
>   		clock-names = "baud", "module";
>   	};
>   
> +	dmac: dma@13020000 {

    The node must be named "dma-controller@13020000" according to the DT spec.

[...]

MBR, Sergei
