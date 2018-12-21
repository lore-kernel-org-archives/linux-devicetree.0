From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: Add Cadence GPIO driver
Date: Fri, 21 Dec 2018 11:41:27 +0100
Message-ID: <CACRpkdat7h2xWXm-1Hr46rYywy5Bdd751qu4yKk3i7f72nG9xA@mail.gmail.com>
References: <20181218161042.16366-1-jank@cadence.com> <20181218161042.16366-3-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218161042.16366-3-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 5:11 PM Jan Kotas <jank@cadence.com> wrote:

> This patch adds a driver for Cadence GPIO controller.
>
> It can be enabled with GPIO_CADENCE Kconfig option.
> It uses generic GPIO infrastructure and works
> as an interrupt controller.
> At the moment it only supports level sensitive irqs.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Pulled out the v2 and applied this v3 instead.

Yours,
Linus Walleij
