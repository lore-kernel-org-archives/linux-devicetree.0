From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/7] ARM: Kconfig: Introduce MACH_STM32F469 flag
Date: Mon, 24 Apr 2017 14:30:37 +0200
Message-ID: <CACRpkdZmWFKaZWB8qZaH=jB61xdwvJ=TC8idYH9kJdi=HEZRAA@mail.gmail.com>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com> <1491568984-20169-7-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1491568984-20169-7-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Jonathan Corbet <corbet@lwn.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 2:43 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> This patch introduces the MACH_STM32F469 to make possible to only select
> STM32F469 pinctrl driver
>
> By default, all the MACH_STM32Fxxx flags will be set with STM32 defconfig.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through the ARM SoC tree.

Yours,
Linus Walleij
