From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: stm32: check node status before new gpio
 bank registering
Date: Sun, 29 Jul 2018 22:11:36 +0200
Message-ID: <CACRpkdaDy5MGPMxh3GYFHL9VqTv44=t6J=xu_0sdXc4OHFo84g@mail.gmail.com>
References: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com> <1531745857-5561-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531745857-5561-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2018 at 2:57 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Register a new GPIO bank only if GPIO bank node is enabled. This patch also
> adds checks on ranges which are defined only if a bank is registered.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied.

Alexandre can you check the discussion we've had about using
GPIOLIB_IRQCHIP for multi-bank GPIOs with several IRQ
lines as per drivers/gpio/gpio-tegra186.c?

Is this approach applicable for STM32 so we can pull
more stuff in under GPIOLIB_IRQCHIP?

Yours,
Linus Walleij
