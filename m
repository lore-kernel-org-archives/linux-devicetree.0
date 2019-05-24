From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Date: Fri, 24 May 2019 13:38:17 +0200
Message-ID: <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
References: <20190514005033.15593-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514005033.15593-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, viresh kumar <viresh.kumar@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:

> Convert the Arm PL061 GPIO controller binding to json-schema format.
>
> As I'm the author for all but the gpio-ranges line, make the schema dual
> GPL/BSD license.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied. As you know I am already a big fan of this scheme.

> This warns on a few platforms missing clocks, interrupt-controller
> and/or #interrupt-cells. We could not make those required, but really
> they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> aren't too active, so I don't know that we want to fix them.

What works for you works for me.

We could add dummy fixed clocks in the DTS files if
we wanted I suppose. The #interrupt-cells and interrupt-controller
things we can just fix, but I wonder what the maintainers of these
platforms are up to? Isn't Calxeda yours, and could Viresh fix
up the SPEAr?

Yours,
Linus Walleij
