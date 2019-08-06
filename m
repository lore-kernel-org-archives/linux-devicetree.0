From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mpc8xxx: Add new platforms GPIO DT node description
Date: Tue, 6 Aug 2019 14:48:54 +0200
Message-ID: <CACRpkdZ7hW+hSC41JqjqfLrwWvRY80+_8sXC89OhN7SwVtU7MA@mail.gmail.com>
References: <20190806024923.34355-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806024923.34355-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Hui,

On Tue, Aug 6, 2019 at 4:59 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> Update the NXP GPIO node dt-binding file for QorIQ and
> Layerscape platforms, and add one more example with
> ls1028a GPIO node.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
(...)
> +Example of gpio-controller node for a ls1028a SoC:
> +
> +gpio1: gpio@2300000 {
> +       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";

What you need to do is to add "fsl,ls1028a-gpio" to the list
of compatible values at the top of the file "Required properties".
Please send a v2 with this fixed.

Yours,
Linus Walleij
