From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Sun, 7 Oct 2018 23:00:28 +0200
Message-ID: <CACRpkdaqOQ7Dj1pf7ZQ0qgpEsu_pJng6gLoYOYs6kc_e=U6b=w@mail.gmail.com>
References: <20181004090654.32233-1-linus.walleij@linaro.org>
 <20181004105031.GD6412@sirena.org.uk> <CACRpkdZZHYSRXktPLHKRc4Afsegn4q3rOmcPMhXh5chC1jH-JQ@mail.gmail.com>
 <20181004135427.GE6412@sirena.org.uk> <CAL_Jsq+Dpv1NohnMaLEV3ZMdHYBwMZMaFtftc8z9X1wORCCT3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Dpv1NohnMaLEV3ZMdHYBwMZMaFtftc8z9X1wORCCT3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 5, 2018 at 10:17 PM Rob Herring <robh@kernel.org> wrote:

> BTW, 'enable-active-high' is also a bit strange as that should just be
> encoded into 'enable-gpio' flags. We should really deprecate that.

I have been struggling with this (and similar flags in other subsystems)
and the current plan is to contain them in current state, but push them
into the gpiolib-of.c to get it out of the respective subsystem.

The problem is that is "enable-active-high" is negative: if it is NOT
present the line is assumes to active low, which is NOT the case
for normal GPIOs (flag zero means active high).

Therefore the binding becomes ambigous: if the "enable-active-high"
is NOT present, and the gpio flag says it is active high, right
now it should result in active low behavior, and we have no way
of telling if a certain device tree want modern semantics instead,
specifying active high in the flag.

Hmmm...

We COULD enforce normal behaviour on a NEW property
"enable-gpios" though.

Let me think about that. That should be a clean migration path.

Yours,
Linus Walleij
