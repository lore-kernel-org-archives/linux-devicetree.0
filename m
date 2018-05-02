From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add reset binding on stm32mp157c
Date: Wed, 2 May 2018 14:19:25 +0200
Message-ID: <a49de02e-5ea3-0ac7-9ae0-75add5806c6a@st.com>
References: <1524215347-10600-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215347-10600-1-git-send-email-gabriel.fernandez@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

On 04/20/2018 11:09 AM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch adds reset binding file.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index bc3eddc..7e91fd6 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -5,6 +5,7 @@
>    */
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/stm32mp1-clks.h>
> +#include <dt-bindings/reset/stm32mp1-resets.h>
>   
>   / {
>   	#address-cells = <1>;
> 

Applied on stm32-next.

Thanks.
Alex
