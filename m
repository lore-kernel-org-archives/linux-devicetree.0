MIME-Version: 1.0
Date: Thu, 16 May 2019 21:31:00 -0500
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
	<20190509155834.22838-2-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-2-m.felsch@pengutronix.de>
Message-ID: <CAL_JsqKiiP+dmRiQSgR_VxtXDB832JtaNc-3d61uNH-vD677nw@mail.gmail.com>
Subject: Re: [PATCH 01/17] dt-bindings: add Kontron vendor prefix
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, Schrempf Frieder <frieder.schrempf@kontron.de>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 9, 2019 at 10:58 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Kontron is a leading embedded computer supplier. More information can be
> found on: https://www.kontron.de/
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

I've converted this file to json-schema as of v5.2-rc1. See commit
8122de54602e. Sorry, but you will have to rework this patch.


Rob
