From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 5/9] Documentation: dt-bindings: Add IRQ related
 properties of STM32 pinctrl
Date: Tue, 13 Sep 2016 10:18:20 +0200
Message-ID: <CACRpkdbZtNscuJ0bQMYt09ZKACQ0PBG8XMmGo7XnDy5fMGk9_g@mail.gmail.com>
References: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com> <1473432124-6784-6-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473432124-6784-6-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 4:42 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
> index 587bffb..a0eed99 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
> @@ -14,6 +14,9 @@ Required properies:
>   - #size-cells : The value of this property must be 1
>   - ranges      : defines mapping between pin controller node (parent) to
>     gpio-bank node (children).
> + - interrupt-parent: phandle of the interrupt parent to which the external
> +   GPIO interrupts are forwarded to.
> + - st,syscfg: phandle of the syscfg node used for IRQ mux selection.

Actually this doc is incomplete.

This is a phandle + offset, not just a phandle.

It is a small detail so I don't care much, either send a patch to
fix up this doc (I have already merged it) or patch the driver
to not retrieve the offset and instead use
#define SYSCFG_OFFSET 0x08
or something...

Yours,
Linus Walleij
