From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: snps,dwmac: update reg
 minItems maxItems
Date: Tue, 20 Aug 2019 22:17:48 +0200
Message-ID: <CAFBinCDP898fhoqh8wApfrsqAuv1dEQSoxy0yDA2hHKxoFsr+g@mail.gmail.com>
References: <20190820075742.14857-1-narmstrong@baylibre.com> <20190820075742.14857-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820075742.14857-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 9:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
> glue registers, thus update the reg minItems/maxItems to allow more
> than a single reg cell.
>
> Also update the allwinner,sun7i-a20-gmac.yaml derivative schema to specify
> maxItems to 1.
this looks good to me because:
- allwinner,sun7i-a20-gmac.yaml now restricts reg to maxItems 1
- allwinner,sun8i-a83t-emac.yaml already restricts reg to maxItems 1
- amlogic,meson-dwmac.yaml (introduced in patch 2 from this series)
will need maxItems 2
- (these are all yaml based schemas for DWMAC IP)

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
