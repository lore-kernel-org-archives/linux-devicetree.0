From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: sprd: Change to use SoC compatible string
Date: Thu, 21 Feb 2019 13:19:14 +0100
Message-ID: <CACRpkdbctA2T8iAXT30cAUr_RFntSSsd4ksH+_dDMd+w7ORZ3w@mail.gmail.com>
References: <70f5476004b2f4e4b444bf8425f21a3c993edf47.1550543288.git.baolin.wang@linaro.org>
 <d0f8377078efc1af13fa81c5d6837f3f26ddc1fb.1550543288.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d0f8377078efc1af13fa81c5d6837f3f26ddc1fb.1550543288.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 3:30 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Change to use SoC compatible string instead of wildcard string.
>
> The Spreadtrum SC9860 platform device trees and drivers' development
> are still in progress, and now we will always recompile and ship
> device trees at the same time as we will compile and ship the kernel,
> so we do not need care about the backwards compatibility.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v2:
>  - Add some comments to explain why we do not care backwards compatibility.

Patch applied.

Yours,
Linus Walleij
