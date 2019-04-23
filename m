From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] ARM: dts: stm32: use dedicated files to manage
 stm32mp157 packages
Date: Tue, 23 Apr 2019 10:48:41 +0200
Message-ID: <CACRpkdYYPu=MGwJvswXFX1mb=nfDd7T9bBV+rugT=cBuFKjsUA@mail.gmail.com>
References: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com> <1554895824-25709-6-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554895824-25709-6-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2019 at 1:31 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Four packages exist for stm32mp157 die. As ball-out is different between
> them, this patch covers those differences by creating dedicated pinctrl
> dtsi files. Each dtsi pinctrl package file describes the package ball-out
> through gpio-ranges.
>
> stm32mp157a-dk1 / dk2 boards embed a STM32MP_PKG_AC (TFBGA361 (12*12))
> package.
>
> stm32mp157c-ed1 / ev1 boards embed a STM32MP_PKG_AA (LFBGA448 (18*18))
> package.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
