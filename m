From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: meson: add g12a drive strength support
Date: Thu, 4 Apr 2019 10:41:04 +0700
Message-ID: <CACRpkdYdRfm=OLmfzZeJEXpfOdnxg=YE+yAexHTh_-EePBtxaA@mail.gmail.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Guillaume La Roque <glaroque@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2019 at 11:37 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> Now the slightly annoying part :(
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
>
> 1) Rounding down the value, we could be requesting a 0mA drive strength.
>    That would look weird.
> 2) Rounding up, we can't distinguish between 2.5mA and 3mA
>
> To solve this issue in this in this v1, we chose to document that, on Amlogic,
> drive-strength is expressed in uA instead of mA.
> It works well and there is no impact on the other platforms but I'm not sure this
> is really OK with the DT rules ?

I want the DT people to say what they think about this.

> Linus, if this is not OK with you, here are 2 other options we are
> considering. We would be very interested to get your opinion on the matter:
>
> 1) instead the generic 'drive-strength' property, we could add an amlogic
> specific property, 'amlogic,drive-strength'. It would be expressed in uA
> and parsed in amlogic specific code.
> I think this option is kind of overkill. Expressing drive strength in uA is
> not really amlogic specific so it does not make much sense, but it would
> work ...
>
> 2) Add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.

I would go for 2).

But we really need input from bindings people on this.

Yours,
Linus Walleij
