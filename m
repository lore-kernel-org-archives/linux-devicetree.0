MIME-Version: 1.0
Date: Tue, 18 Jun 2019 08:04:13 -0600
References: <20190617161432.32268-1-m.felsch@pengutronix.de>
	<20190617161432.32268-2-m.felsch@pengutronix.de>
In-Reply-To: <20190617161432.32268-2-m.felsch@pengutronix.de>
Message-ID: <CAL_JsqLrm5cRh=uVs9rmfaoL97XFbRjJeCtP7w-si4i7jxfkhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: add Kontron vendor prefix
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, Schrempf Frieder <frieder.schrempf@kontron.de>, thomas.schaefer@kontron.com, Stefan.Nickl@kontron.com, Michael.Brunner@kontron.com, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Priit Laes <plaes@plaes.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 17, 2019 at 10:14 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Kontron is a leading embedded computer supplier. More information can be
> found on: https://www.kontron.de/
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
>  - convert from vendor-prefixes.txt to vendor-prefixes.yaml
>
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

I applied this one to avoid any merge conflicts as there's a few
changes in vendor-prefixes.yaml.

Rob
