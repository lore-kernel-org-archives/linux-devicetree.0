From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: activate dma for qspi on stm32mp157
Date: Thu, 25 Jul 2019 11:33:04 +0200
Message-ID: <fe11664c-4419-7ec3-c700-c5992dcb3efe@st.com>
References: <1561637345-31441-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561637345-31441-1-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ludovic Barre <ludovic.Barre@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ludovic

On 6/27/19 2:09 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch activates dma for qspi on stm32mp157.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 2afeee6..205ea1d 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -1074,6 +1074,9 @@
>   			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>   			reg-names = "qspi", "qspi_mm";
>   			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
> +			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
> +			dma-names = "tx", "rx";
>   			clocks = <&rcc QSPI_K>;
>   			resets = <&rcc QSPI_R>;
>   			status = "disabled";
> 

Applied on stm32-next.

Thanks.
Alex
