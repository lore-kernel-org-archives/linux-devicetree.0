From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: Add ls1028a device specify function.
Date: Sat, 3 Aug 2019 00:19:59 +0200
Message-ID: <CACRpkdYRg8mMe5yxu=+tC1uz_usyNyVjn7NFobSUZi0rR5uGjw@mail.gmail.com>
References: <20190718094902.15562-1-hui.song_1@nxp.com> <20190718094902.15562-2-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094902.15562-2-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 11:58 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> There is a device specify register(named GPIO_IBE)
> on ls1028a need to enable in initial stage.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied.

As noted on patch 1/2, send a separate patch to add the
device tree bindings in Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt

Yours,
Linus Walleij
