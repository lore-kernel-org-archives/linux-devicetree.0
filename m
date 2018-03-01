From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: artpec6: add missing pin group uart5nocts
Date: Thu, 1 Mar 2018 21:58:26 +0100
Message-ID: <CACRpkdbns2=v53+cypYu0RhrsWnFUsd-og6WeGS0shDXg55StA@mail.gmail.com>
References: <20180222152247.10554-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180222152247.10554-1-niklas.cassel@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 22, 2018 at 4:22 PM, Niklas Cassel <niklas.cassel@axis.com> wrote:

> Add missing pin group uart5nocts (all pins except cts), which has been
> supported by the artpec6 pinctrl driver since its initial submission.
>
> Fixes: 00df0582eab1 ("pinctrl: Add pincontrol driver for ARTPEC-6 SoC")
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>

Patch applied.

Yours,
Linus Walleij
