From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 4/9] pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
Date: Thu, 11 Apr 2019 15:29:58 +0200
Message-ID: <CACRpkdY8-JZkbKGx_vEwhqWAozH1a_pB0W-wULJoYizzBxPMBg@mail.gmail.com>
References: <1554794651-6874-1-git-send-email-amelie.delaunay@st.com> <1554794651-6874-5-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554794651-6874-5-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 9, 2019 at 9:24 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> This patch adds pinctrl/GPIO driver for STMicroelectronics
> Multi-Function eXpander (STMFX) GPIO expander.
> STMFX is an I2C slave controller, offering up to 24 GPIOs.
> The driver relies on generic pin config interface to configure the GPIOs.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

A very clean pin controller/GPIO combo.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
