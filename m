From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 6/6] ARM: dts: stm32f429: Add QSPI clock
Date: Thu, 3 Nov 2016 17:45:05 +0100
Message-ID: <25482d71-4d19-997c-656a-75fbe1f43131@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <1476436699-21879-7-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476436699-21879-7-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

On 10/14/2016 11:18 AM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This patch adds the QSPI clock for stm32f469 discovery board.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> index e911af8..4052023 100644
> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> @@ -66,6 +66,10 @@
>  	};
>  };
>
> +&rcc {
> +	compatible = "st,stm32f469-rcc", "st,stm32-rcc";
> +};
> +

With this patch, stm32f469-disco doesn't boot if clk drivers patch are 
not applied.
Can you please send a new version to keep compatibility with older clk 
driver.

&rcc {
 > +	compatible = "st,stm32f469-rcc", "st,stm32-rcc";
-> compatible = "st,stm32f469-rcc", "st,stm32f42xx-rcc", "st,stm32-rcc";
 > +};
 > +
I will take it in next pull request round.


Regards
Alex


>  &clk_hse {
>  	clock-frequency = <8000000>;
>  };
>
