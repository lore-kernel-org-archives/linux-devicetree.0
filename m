From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v2 0/4] Add STM32 MDMA driver
Date: Thu, 20 Jul 2017 09:37:48 +0000
Message-ID: <1fda0cc8-0b3c-70b0-0b34-b9b9a3ca6121@st.com>
References: <1499343941-6375-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499343941-6375-1-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
Content-ID: <29F3FC0544D02C4A87EA5D3BB7FF0677@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba
 Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien
 DESSENNE <fabien.dessenne@st.com>, Amelie DELAUNAY <amelie.delaunay@st.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 07/06/2017 02:25 PM, Pierre-Yves MORDRET wrote:
> This patchset adds support for the STM32 MDMA controller.
> The Master Direct memory access (MDMA) provides high-speed data transfer
> between memory and memory or between peripherals and memory.
> Contrary to STM32 DMA, the STM32 MDMA controller supports hardware LLI and
> uses a larger integrated FIFO (128 vs 16 bytes)

Gentle ping for driver review since DT Bindings has been acked by Rob
Herring.

Thanks
Py

> ---
>    Version history:
>       v2:
>           * change compatible into st,stm32h7-mdma to be more SoC specific
>           * Add MDMA support in DT for H7
>           * Add MDMA support in STM32 defconfig
> ---
> Pierre-Yves MORDRET (4):
>    dt-bindings: Document the STM32 MDMA bindings
>    dmaengine: Add STM32 MDMA driver
>    ARM: dts: stm32: Add MDMA support for STM32H743 SoC
>    ARM: configs: stm32: Add MDMA support in STM32 defconfig
> 
>   .../devicetree/bindings/dma/stm32-mdma.txt         |   94 ++
>   arch/arm/boot/dts/stm32h743.dtsi                   |   10 +
>   arch/arm/configs/stm32_defconfig                   |    1 +
>   drivers/dma/Kconfig                                |   12 +
>   drivers/dma/Makefile                               |    1 +
>   drivers/dma/stm32-mdma.c                           | 1536 ++++++++++++++++++++
>   6 files changed, 1654 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt
>   create mode 100644 drivers/dma/stm32-mdma.c
> 
