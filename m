From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 3/5] ARM: dts: stm32ap: Add watchdog support for
 STM32F429 SoC
Date: Wed, 22 Mar 2017 14:50:20 +0100
Message-ID: <70b47d08-9628-f0c6-094f-c3712527bda8@st.com>
References: <1490189786-19232-1-git-send-email-yannick.fertre@st.com>
 <1490189786-19232-4-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490189786-19232-4-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yannick Fertre <yannick.fertre@st.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

On 03/22/2017 02:36 PM, Yannick Fertre wrote:
> Signed-off-by: Yannick FERTRE <yannick.fertre@st.com>
> ---

Please add a commit message, and change commit header as following:

ARM: dts: stm32: ...

>  arch/arm/boot/dts/stm32f429.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index ee0da97..148273b 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -65,7 +65,7 @@
>  			clock-frequency = <32768>;
>  		};
>
> -		clk-lsi {
> +		clk_lsi: clk-lsi {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
>  			clock-frequency = <32000>;
> @@ -812,6 +812,13 @@
>  			clocks = <&rcc 0 STM32F4_AHB2_CLOCK(RNG)>;
>
>  		};
> +
> +		iwdg: iwdg@40003000 {
Please try to keep nodes ordered.

> +			compatible = "st,stm32-iwdg";
> +			reg = <0x40003000 0x400>;
> +			clocks = <&clk_lsi>;
> +			status = "disabled";
> +		};
>  	};
>  };
>
>
