From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/7] mfd: Add ST Multi-Function eXpander (STMFX) core driver
Date: Wed, 19 Sep 2018 12:40:04 -0700
Message-ID: <CACRpkdYLiBsCsFw90zGeYDpXh6wKyiqG4cJTuq+E7_2-9iXh1A@mail.gmail.com>
References: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com> <1537363669-25991-3-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537363669-25991-3-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 6:28 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
> using I2C for communication with the main MCU. Main features are:
> - 16 fast GPIOs individually configurable in input/output
> - 8 alternate GPIOs individually configurable in input/output when other
> STMFX functions are not used
> - Main MCU IDD measurement
> - Resistive touchscreen controller
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

This looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
