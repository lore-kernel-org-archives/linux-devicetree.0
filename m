From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: stm32: add joystick support on stm32746g-eval
Date: Wed, 19 Sep 2018 12:47:57 -0700
Message-ID: <CACRpkdZ4nCV3g7Noi9eTQvvXpWhsR46d0Fygt=uUS3aJdjRtyw@mail.gmail.com>
References: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com> <1537363669-25991-7-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537363669-25991-7-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 6:28 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> The joystick (B3) on stm32746g-eval uses gpios on STMFX gpio expander.
> These gpios need a pin configuration (push-pull and bias-pull-up),
> described under stmfx_pinctrl node.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
