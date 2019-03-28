From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: Document the new imx8mq-sdma compatible string
Date: Thu, 28 Mar 2019 17:18:03 +0200
Message-ID: <CAEnQRZDegwSih4BDsPiYHmoSCjtxCvO3-U+g1X27C6c_KE8fgw@mail.gmail.com>
References: <20190328133828.20999-1-angus@akkea.ca> <20190328133828.20999-4-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328133828.20999-4-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 3:41 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> The imx8mq needs to be specified to check the clk ratio.
>
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> index 3c9a57a8443b..9d8bbac27d8b 100644
> --- a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> @@ -9,6 +9,7 @@ Required properties:
>        "fsl,imx53-sdma"
>        "fsl,imx6q-sdma"
>        "fsl,imx7d-sdma"
> +      "fsl,imx8mq-sdma"

You can drop this patch. It is already in Shwan's for-next branch.

The joy of working in parallel on similar things.

thanks,
Daniel.
