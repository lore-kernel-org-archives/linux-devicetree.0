From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: snps,dwmac: update reg minItems
 maxItems
Date: Wed, 7 Aug 2019 14:04:45 +0200
Message-ID: <20190807120445.yje57g6mwcmyztki@flea>
References: <20190806125041.16105-1-narmstrong@baylibre.com>
 <20190806125041.16105-2-narmstrong@baylibre.com>
 <CAL_Jsq+6kCO8x53d1670VjgEjfs5opKY+R3OgsAo0WsXqq512Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+6kCO8x53d1670VjgEjfs5opKY+R3OgsAo0WsXqq512Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 06, 2019 at 09:22:12AM -0600, Rob Herring wrote:
> +Maxime
>
> On Tue, Aug 6, 2019 at 6:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > The Amlogic Meson DWMAC glue bindings needs a second reg cells for the
> > glue registers, thus update the reg minItems/maxItems to allow more
> > than a single reg cell.
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> I haven't checked, but the derivative schema could be assuming this
> schema enforced reg is 1 item.

Yeah, we do for
Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
(but somehow not allwinner,sun8i-a83t-emac.yaml)

Neil, can you add it to sun7i-a20-gmac?

> I don't think that's a major issue
> though.
>
> Acked-by: Rob Herring <robh@kernel.org>

With that fixed,
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
