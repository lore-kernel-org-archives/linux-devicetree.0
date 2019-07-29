From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: stm32: add syscfg to ADC on stm32mp157c
Date: Mon, 29 Jul 2019 09:23:06 +0200
Message-ID: <0687ec4c-0930-058d-4a55-c4cf712ab83c@st.com>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
 <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
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
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi fabrice

On 7/3/19 12:08 PM, Fabrice Gasnier wrote:
> On stm32mp157c, the ADC inputs are multiplexed with analog switches which
> have reduced performances when their supply is below 2.7V (vdda by
> default).
> Add syscfg registers that can be used on stm32mp157c, to get full ADC
> analog performances.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 2dd5162..b9a5b58 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -862,6 +862,7 @@
>   			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>   			clock-names = "bus", "adc";
>   			interrupt-controller;
> +			st,syscfg = <&syscfg>;
>   			#interrupt-cells = <1>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> 


Applied on stm32-next.

Thanks.
Alex
