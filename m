From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: stm32: correct clock-names in dsi
 panel example
Date: Mon, 22 Jan 2018 08:30:59 -0600
Message-ID: <CAL_JsqKfeSW1R4aSjeUnJ6b=NeQK0qHTuEV7y9Y4sAFiyzHLzQ@mail.gmail.com>
References: <20180121205807.30677-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180121205807.30677-1-philippe.cornu@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mickael Reulier <mickael.reulier@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 21, 2018 at 2:58 PM, Philippe Cornu <philippe.cornu@st.com> wrote:
> In the dsi panel example, clock names in the "clock-names"
> field have been swapped:
> * "pclk" (peripheral clock) is <&rcc 1 CLK_F469_DSI> on stm32f4
> * "ref" (dsi phy pll ref clock) is <&clk_hse> on stm32f4
>
> Signed-off-by: Philippe Cornu <philippe.cornu@st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> index 029252253ad4..3eb1b48b47dd 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> @@ -98,7 +98,7 @@ Example 2: DSI panel
>                         compatible = "st,stm32-dsi";
>                         reg = <0x40016c00 0x800>;
>                         clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
> -                       clock-names = "ref", "pclk";
> +                       clock-names = "pclk", "ref";

There is no way to tell they are reversed because pclk is not even
documented. Please fix that too.

>                         resets = <&rcc STM32F4_APB2_RESET(DSI)>;
>                         reset-names = "apb";
>
> --
> 2.15.1
>
