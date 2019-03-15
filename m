From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add YAML description for Allwinner boards
Date: Fri, 15 Mar 2019 08:53:15 -0500
Message-ID: <CAL_JsqLCbTjjoAfDqcs=dqEo7AX5OPbXjb4v0D6R4XwWihuB4g@mail.gmail.com>
References: <20190315093651.24978-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315093651.24978-1-maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 4:36 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> We've never had a board compatibles documentation for the Allwinner boards
> so far.
>
> Let's create a json-schema for them.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/arm/sunxi.yaml        | 792 ++++++++++++++++++
>  1 file changed, 792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/sunxi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
