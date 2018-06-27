From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V5 4/5] ARM: dts: stm32: add iwdg2 support for
 stm32mp157c-ed1
Date: Tue, 26 Jun 2018 17:46:50 -0700
Message-ID: <2c5091b6-bea7-827a-a37a-c679ecbfcc07@roeck-us.net>
References: <1529941383-8653-1-git-send-email-ludovic.Barre@st.com>
 <1529941383-8653-5-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529941383-8653-5-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/25/2018 08:43 AM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch activates independent watchdog support for
> stm32mp157c board.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/arm/boot/dts/stm32mp157c-ed1.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index ae33653..8af263a 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -68,6 +68,11 @@
>   	status = "okay";
>   };
>   
> +&iwdg2 {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
>   &uart4 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart4_pins_a>;
> 
