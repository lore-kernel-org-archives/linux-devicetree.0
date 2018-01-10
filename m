From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: Export gpiochip_irqchip_irq_valid() to drivers
Date: Wed, 10 Jan 2018 14:22:18 +0100
Message-ID: <CACRpkdbW0cKwfzwVu4dz3pe2qvdT=Pkr6Lxq0FW12S0NfcHd6Q@mail.gmail.com>
References: <20180110015848.11480-1-sboyd@codeaurora.org> <20180110015848.11480-2-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180110015848.11480-2-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Timur Tabi <timur@codeaurora.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 2:58 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Some pinctrl drivers can use the gpiochip irq valid information
> to figure out if certain gpios are exposed to the kernel for
> usage or not. Expose this API so we can use it in the
> pinmux_ops::request ops.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Makes a lot of sense.

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
