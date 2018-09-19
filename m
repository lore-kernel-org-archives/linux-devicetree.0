From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/7] Introduce STMFX I2C Multi-Function eXpander
Date: Wed, 19 Sep 2018 12:50:44 -0700
Message-ID: <CACRpkdYvqf165oGAZFXnFw6YwdZHejnOHXKb109N9YZ6kjEF9Q@mail.gmail.com>
References: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 6:28 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

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
> Changes in v2:
> - move to MFD parent driver for i2c stuff and chip initialization
> - improve regmap configuration
> - take advantage of the use of gpio-ranges

I'm very happy with this version, and Lee can merge it into the MFD tree
with my Reviewed-by tags once he is happy with the MFD core.

I hope the DT people are as happy as me so we can merge this for v4.20,
the GPIO/pinctrl parts are definately finished. any remaining snags can
be fixed in-tree.

Yours,
Linus Walleij
