From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: stm32: Implement .get_direction gpio_chip callback
Date: Mon, 24 Apr 2017 14:37:52 +0200
Message-ID: <CACRpkdZG-yxMCzBqP2s37QThP7tgWKgd3pVgZGgceB+ihZs3nw@mail.gmail.com>
References: <1491577811-26989-1-git-send-email-alexandre.torgue@st.com> <1491577811-26989-4-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1491577811-26989-4-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 5:10 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> Add .get_direction() gpiochip callback in STM32 pinctrl driver.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

(...)
> +#include <linux/gpio.h>

No this is wrong, drivers should never include this file.
It is a deprecated consumer header.

> +       if ((alt == 0) && (mode == 0))
> +               ret = GPIOF_DIR_IN;
> +       else if ((alt == 0) && (mode == 1))
> +               ret = GPIOF_DIR_OUT;

Just return 0 or 1, that is the driver-internal API.

Yours,
Linus Walleij
