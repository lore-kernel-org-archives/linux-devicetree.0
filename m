From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Tue, 3 Jul 2018 10:59:50 -0600
Message-ID: <20180703165950.GA23752@rob-hp-laptop>
References: <1530532746-619-1-git-send-email-abel.vesa@nxp.com>
 <1530532746-619-2-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530532746-619-2-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 02, 2018 at 02:59:05PM +0300, Abel Vesa wrote:
> This adds the binding for the i.MX8MQ pin controller, in the same
> fashion as earlier i.MX SoCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt

Reviewed-by: Rob Herring <robh@kernel.org>
