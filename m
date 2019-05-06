From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH] arm64: dts: sprd: Add clock properties for serial devices
Date: Mon, 6 May 2019 14:36:49 +0800
Message-ID: <CAMz4ku+1-w8va__JNkBME5tPuG0AdhzksVbNbYomqY94JggPVg@mail.gmail.com>
References: <1246f7a9ce912458ea3b889b0c0e392897a664c8.1554879978.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1246f7a9ce912458ea3b889b0c0e392897a664c8.1554879978.git.baolin.wang@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: DTML <devicetree@vger.kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, LKML <linux-kernel@vger.kernel.org>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

On Wed, 10 Apr 2019 at 15:23, Baolin Wang <baolin.wang@linaro.org> wrote:
>
> We've introduced power management logics for the Spreadtrum serial
> controller by commit 062ec2774c8a ("serial: sprd: Add power management
> for the Spreadtrum serial controller"), thus add related clock properties
> to support this feature.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---

Could you take this patch through the arm-soc tree if no objections
from you? Thanks.

>  arch/arm64/boot/dts/sprd/whale2.dtsi |   16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
> index 34b6ca0..b5c5dce 100644
> --- a/arch/arm64/boot/dts/sprd/whale2.dtsi
> +++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
> @@ -75,7 +75,9 @@
>                                              "sprd,sc9836-uart";
>                                 reg = <0x0 0x100>;
>                                 interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> -                               clocks = <&ext_26m>;
> +                               clock-names = "enable", "uart", "source";
> +                               clocks = <&apapb_gate CLK_UART0_EB>,
> +                                      <&ap_clk CLK_UART0>, <&ext_26m>;
>                                 status = "disabled";
>                         };
>
> @@ -84,7 +86,9 @@
>                                              "sprd,sc9836-uart";
>                                 reg = <0x100000 0x100>;
>                                 interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> -                               clocks = <&ext_26m>;
> +                               clock-names = "enable", "uart", "source";
> +                               clocks = <&apapb_gate CLK_UART1_EB>,
> +                                      <&ap_clk CLK_UART1>, <&ext_26m>;
>                                 status = "disabled";
>                         };
>
> @@ -93,7 +97,9 @@
>                                              "sprd,sc9836-uart";
>                                 reg = <0x200000 0x100>;
>                                 interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> -                               clocks = <&ext_26m>;
> +                               clock-names = "enable", "uart", "source";
> +                               clocks = <&apapb_gate CLK_UART2_EB>,
> +                                      <&ap_clk CLK_UART2>, <&ext_26m>;
>                                 status = "disabled";
>                         };
>
> @@ -102,7 +108,9 @@
>                                              "sprd,sc9836-uart";
>                                 reg = <0x300000 0x100>;
>                                 interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> -                               clocks = <&ext_26m>;
> +                               clock-names = "enable", "uart", "source";
> +                               clocks = <&apapb_gate CLK_UART3_EB>,
> +                                      <&ap_clk CLK_UART3>, <&ext_26m>;
>                                 status = "disabled";
>                         };
>                 };
> --
> 1.7.9.5
>


-- 
Baolin Wang
Best Regards
