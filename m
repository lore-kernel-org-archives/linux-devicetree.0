From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 1/4] ARM: dts: stm32: add FMC2 NAND controller support on
 stm32mp157c
Date: Wed, 24 Jul 2019 18:38:05 +0200
Message-ID: <4b6a8df1-593e-44b2-4bb3-2af9f732396c@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
 <1561128590-14621-2-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561128590-14621-2-git-send-email-christophe.kerello@st.com>
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
To: Christophe Kerello <christophe.kerello@st.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Christophe

On 6/21/19 4:49 PM, Christophe Kerello wrote:
> This patch adds FMC2 NAND controller support used by stm32mp157c SOC.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 0c4e6eb..f2bda28 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -1239,6 +1239,25 @@
>   			dma-requests = <48>;
>   		};
>   
> +		fmc: nand-controller@58002000 {
> +			compatible = "st,stm32mp15-fmc2";
> +			reg = <0x58002000 0x1000>,
> +			      <0x80000000 0x1000>,
> +			      <0x88010000 0x1000>,
> +			      <0x88020000 0x1000>,
> +			      <0x81000000 0x1000>,
> +			      <0x89010000 0x1000>,
> +			      <0x89020000 0x1000>;
> +			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 20 0x10 0x12000A02 0x0 0x0>,
> +			       <&mdma1 20 0x10 0x12000A08 0x0 0x0>,
> +			       <&mdma1 21 0x10 0x12000A0A 0x0 0x0>;

Please, don't use capital letter here.

> +			dma-names = "tx", "rx", "ecc";
> +			clocks = <&rcc FMC_K>;
> +			resets = <&rcc FMC_R>;
> +			status = "disabled";
> +		};
> +
>   		qspi: spi@58003000 {
>   			compatible = "st,stm32f469-qspi";
>   			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
> 
