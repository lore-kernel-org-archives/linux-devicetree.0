From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 16/17] MIPS: JZ4770: DTS: Add DMA nodes
Date: Thu, 19 Jul 2018 11:06:57 +0300
Message-ID: <b25df80b-2314-8ed1-6fdf-5bb9b49ec994@cogentembedded.com>
References: <20180718182023.8182-1-paul@crapouillou.net>
 <20180718182023.8182-17-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718182023.8182-17-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 7/18/2018 9:20 PM, Paul Cercueil wrote:

> Add the two devicetree nodes for the two DMA cores of the JZ4770 SoC,
> disabled by default, as currently there are no clients for the DMA
> driver (until the MMC driver and/or others get a devicetree node).
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> ---
>   arch/mips/boot/dts/ingenic/jz4770.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
>   v2: No change
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 7c2804f3f5f1..fda17beeb08b 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -196,6 +196,36 @@
>   		status = "disabled";
>   	};
>   
> +	dmac0: jz4770-dma@13420000 {

	dmac0: dma-controller@13420000 {

[...]

> +	dmac1: jz4770-dma@13420100 {

	dmac1: dma-controller@13420100 {

[...]

MBR, Sergei
