From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: ux500: Remove ab8500_ldo_usb regulator from
 device tree
Date: Thu, 22 Aug 2019 17:16:38 +0200
Message-ID: <CACRpkdY49Yz-39gz2V8BwZBJmKQHd975+_Pi5oTrZTRwc+ngQQ@mail.gmail.com>
References: <20190822110720.118828-1-stephan@gerhold.net> <20190822110720.118828-2-stephan@gerhold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822110720.118828-2-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 1:08 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> Support for the USB regulator of AB8500 was removed in
> commit 41a06aa738ad ("regulator: ab8500: Remove USB regulator").
> However, the configuration was never removed from the device tree.
>
> It does no longer have any effect, remove it from the device tree.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied to the Ux500 tree!

Thanks!
Linus Walleij
