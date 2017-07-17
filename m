From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [RFC PATCH] ARM: dts: stm32: change pinctrl bindings definition
Date: Mon, 17 Jul 2017 13:19:11 +0200
Message-ID: <25cebb45-b770-c0b4-a478-13b01b5cfd0e@st.com>
References: <1500289258-3700-1-git-send-email-alexandre.torgue@st.com>
 <1500289258-3700-2-git-send-email-alexandre.torgue@st.com>
 <CAK8P3a2tfCjWyOGoatXGydVU21pfAxVf96JsRVgMHFpG5sCWeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2tfCjWyOGoatXGydVU21pfAxVf96JsRVgMHFpG5sCWeg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

On 07/17/2017 01:15 PM, Arnd Bergmann wrote:
> On Mon, Jul 17, 2017 at 1:00 PM, Alexandre TORGUE
> <alexandre.torgue@st.com> wrote:
>> blabla
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
> 
> You may want to provide a little more detail here ;-)
> 
Oh!! Sorry, I changed it but no sent the good commit :).

Please translate blablable by:

Initially each pin was declared in 
"include/dt-bindings/stm32f429-pinfunc.h"and each definition contained 
SOC names (ex: STM32F429_PA9_FUNC_USART1_TX).
Since this approach was approved, the number of supported MCU has
increased (STM32F429/STM32F469/STM32f746/STM32H743). To avoid to add a 
new file in "include/dt-bindings" each time a new STM32 SOC arrives I 
propose a new approach which consist to use a macro to define pin muxing 
in device tree. All STM32 will use the common macro to define pinmux. 
Furthermore, it will make easy maintenance and integration of new SOC.

Regards
Alex



>           Arnd
> 
