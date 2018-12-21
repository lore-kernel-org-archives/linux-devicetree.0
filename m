From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add bindings for Cadence GPIO
Date: Fri, 21 Dec 2018 11:40:29 +0100
Message-ID: <CACRpkdYbTraTy_5qWagp26peuBzCP_K1u61C1OU2FufsoL2nXQ@mail.gmail.com>
References: <20181218161042.16366-1-jank@cadence.com> <20181218161042.16366-2-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218161042.16366-2-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 5:11 PM Jan Kotas <jank@cadence.com> wrote:

> This patch adds a DT binding documentation for
> Cadence GPIO controller.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Patch applied stripping interrupt-parent as requested by Rob
and applied his ACK from v2 (assume it's the same patch +/-).

Yours,
Linus Walleij
