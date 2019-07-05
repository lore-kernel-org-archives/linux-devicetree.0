MIME-Version: 1.0
Date: Fri, 5 Jul 2019 10:21:48 -0600
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
	<20190703095338.11266-2-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095338.11266-2-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqLb6ih7LHVVDZ230TgxrVzhyppEVcK7fZ=n4pcs3E-GcQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: sun6i-p2wi: Fix the binding example
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 3, 2019 at 3:53 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Even though the binding claims that the frequency can go up to 6MHz, the
> common i2c binding sets a limit at 3MHz, which then triggers a warning.
>
> Since the only SoC that uses that bus uses a frequency of 100kHz, and that
> this bus hasn't been found in an SoC for something like 5 years, let's just
> fix the example to have a frequency within the acceptable range for i2c.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
