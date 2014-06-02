From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 7/7] ARM: shmobile: r8a7791 dtsi: Enable DMA for QSPI
Date: Mon, 02 Jun 2014 14:53:01 +0100
Message-ID: <538C81BD.5090502@codethink.co.uk>
References: <1401716531-29794-1-git-send-email-geert+renesas@glider.be> <1401716531-29794-8-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1401716531-29794-8-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/06/14 14:42, Geert Uytterhoeven wrote:
> Add a DMA property to the QSPI node
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - QSPI needs to use 8-bit accesses for DMA, not 32-bit,
>   - Reorder: TX first, RX second.
> 
>  arch/arm/boot/dts/r8a7791.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 37685ef32ea0..6c285ffc46cb 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -917,6 +917,9 @@
>  		reg = <0 0xe6b10000 0 0x2c>;
>  		interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&mstp9_clks R8A7791_CLK_QSPI_MOD>;
> +		dmas = <&dma0 R8A7791_DMA_QSPI_TX CHCR_TX_8BIT>,
> +		       <&dma0 R8A7791_DMA_QSPI_RX CHCR_RX_8BIT>;
> +		dma-names = "tx", "rx";

I am hopeful that we can remove the CHCR settings, each driver
should configure the width when configuring the slave. V2 of
the patches will reflect this.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
