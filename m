From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 3/4] dt-bindings: arm: fsl: Add Kontron i.MX6UL N6310 compatibles
Date: Thu, 22 Aug 2019 12:56:20 -0500
Message-ID: <CAL_Jsq++LZ82v9WbyHK8pQg3WVQOxLvWcJ-qM0QAnhzKw033vA@mail.gmail.com>
References: <20190822060238.3887-1-krzk@kernel.org> <20190822060238.3887-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822060238.3887-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 1:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Add the compatibles for Kontron i.MX6UL N6310 SoM and boards.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v6:
> 1. Split entries to pass the dtbs_check.
>
> Changes since v5:
> New patch
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
