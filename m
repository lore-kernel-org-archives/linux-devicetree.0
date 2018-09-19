From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/7] Introduce STMFX I2C Multi-Function eXpander
Date: Wed, 19 Sep 2018 18:20:44 +0200
Message-ID: <88843a86-3a2f-e354-21a1-c12627f54dc6@st.com>
References: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Amélie,

On 09/19/2018 03:27 PM, Amelie Delaunay wrote:
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
> registers a pinctrl MFD child.
> 
> ---

As soon as bindings will be accepted, I'll have a look on DT patches in 
order to merge them in stm32-next branch.

regards
Alex

> Changes in v2:
> - move to MFD parent driver for i2c stuff and chip initialization
> - improve regmap configuration
> - take advantage of the use of gpio-ranges
> 
> 
> Amelie Delaunay (7):
>    dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
>    mfd: Add ST Multi-Function eXpander (STMFX) core driver
>    dt-bindings: pinctrl: document the STMFX pinctrl bindings
>    pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
>    ARM: dts: stm32: add STMFX support on stm32746g-eval
>    ARM: dts: stm32: add joystick support on stm32746g-eval
>    ARM: dts: stm32: add orange and blue leds on stm32746g-eval
> 
>   Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
>   .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
>   arch/arm/boot/dts/stm32746g-eval.dts               |  66 ++
>   drivers/mfd/Kconfig                                |  14 +
>   drivers/mfd/Makefile                               |   2 +-
>   drivers/mfd/stmfx.c                                | 626 ++++++++++++++++
>   drivers/pinctrl/Kconfig                            |  12 +
>   drivers/pinctrl/Makefile                           |   1 +
>   drivers/pinctrl/pinctrl-stmfx.c                    | 821 +++++++++++++++++++++
>   include/linux/mfd/stmfx.h                          |  27 +
>   10 files changed, 1712 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
>   create mode 100644 drivers/mfd/stmfx.c
>   create mode 100644 drivers/pinctrl/pinctrl-stmfx.c
>   create mode 100644 include/linux/mfd/stmfx.h
> 
