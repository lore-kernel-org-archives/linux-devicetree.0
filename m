MIME-Version: 1.0
Date: Fri, 5 Jul 2019 10:22:10 -0600
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095338.11266-1-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqLej_OAetF35vG7eraN5BheLu9fkit8Fw7NS0Ckx_HvZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 3, 2019 at 3:53 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> One example has a compatible that isn't a valid combination according to
> the binding, and now that the examples are validated as well, this
> generates a warning.
>
> Let's fix this.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
