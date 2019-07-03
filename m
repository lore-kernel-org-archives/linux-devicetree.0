MIME-Version: 1.0
Date: Wed, 3 Jul 2019 13:29:28 -0600
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqJPojy3y5yMwEpE0y131SqbjPx9KetgmyfFdAb=d_Oebw@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: net: mdio: Add a nodename pattern
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 3, 2019 at 3:55 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The node name of an MDIO controller should be MDIO. Let's add a rule for
> this.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/mdio.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Series applied. Thanks.

BTW, just some errors with Broadcom boards with the mdio schema.

Rob
