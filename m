From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: Add Cadence GPIO driver
Date: Fri, 21 Dec 2018 11:34:54 +0100
Message-ID: <CACRpkdbw9sQoE0R9=KBkkEfZgmLnS7mLGsthRZ98AqJjGhgvzw@mail.gmail.com>
References: <20181217153652.20056-1-jank@cadence.com> <20181217153652.20056-3-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217153652.20056-3-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 4:37 PM Jan Kotas <jank@cadence.com> wrote:

> This patch adds a driver for Cadence GPIO controller.
>
> It can be enabled with GPIO_CADENCE Kconfig option.
> It uses generic GPIO infrastructure and works
> as an interrupt controller.
> At the moment it only supports level sensitive irqs.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Patch applied.

Yours,
Linus Walleij
