From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v6 0/9] Introduce STMFX I2C Multi-Function eXpander
Date: Tue, 21 May 2019 10:13:34 +0200
Message-ID: <0a9bf716-addc-9342-09fe-06ff048ff7d7@st.com>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Amélie,

On 5/9/19 10:58 AM, Amelie Delaunay wrote:
> This series adds support for STMicroelectronics Multi-Function eXpander
> (STMFX), used on some STM32 discovery and evaluation boards.
> 
> STMFX is an STM32L152 slave controller whose firmware embeds the following
> features:
> - I/O expander (16 GPIOs + 8 extra if the other features are not enabled),
> - resistive touchscreen controller,
> - IDD measurement.
> 
> I2C stuff and chip initialization is based on an MFD parent driver, which
> registers STMFX features MFD children.

...

> Amelie Delaunay (9):
>    dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
>    mfd: Add ST Multi-Function eXpander (STMFX) core driver
>    dt-bindings: pinctrl: document the STMFX pinctrl bindings
>    pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
>    ARM: dts: stm32: add STMFX support on stm32746g-eval
>    ARM: dts: stm32: add joystick support on stm32746g-eval
>    ARM: dts: stm32: add orange and blue leds on stm32746g-eval
>    ARM: dts: stm32: add STMFX support on stm32mp157c-ev1
>    ARM: dts: stm32: add joystick support on stm32mp157c-ev1

Device tree patches (5 to 9) applied on stm32-next.

Thanks
Alex
