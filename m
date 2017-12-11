From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] ARM: stm32: prepare stm32 family to welcome armv7 architecture
Date: Mon, 11 Dec 2017 11:25:09 +0100
Message-ID: <CACRpkdaKZk5N9F=_nYSzKWyXgW4xQ9Ltft7-UNM+a-nOpqq2xg@mail.gmail.com>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com> <1512742277-28205-2-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512742277-28205-2-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 3:11 PM, Ludovic Barre <ludovic.Barre@st.com> wrote:

> From: Ludovic Barre <ludovic.barre@st.com>
>
> This patch prepares the STM32 machine for the integration of Cortex-A
> based microprocessor (MPU), on top of the existing Cortex-M
> microcontroller family (MCU). Since both MCUs and MPUs are sharing
> common hardware blocks we can keep using ARCH_STM32 flag for most of
> them. If a hardware block is specific to one family we can use either
> ARCH_STM32_MCU or ARCH_STM32_MPU flag.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

So yesterdays application processors are todays MCU processors.

I said this on a lecture for control systems a while back and
stated it as a reason I think RTOSes are not really seeing a bright
future compared to Linux.

It happened quicker than I thought though, interesting.

Yours,
Linus Walleij
