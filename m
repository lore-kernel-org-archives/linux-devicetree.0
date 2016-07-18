From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 21/22] phy: Add support for Qualcomm's USB HSIC phy
Date: Sun, 17 Jul 2016 21:27:38 -0500
Message-ID: <20160718022738.GA14825@rob-hp-laptop>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-22-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160707222114.1673-22-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 03:21:12PM -0700, Stephen Boyd wrote:
> The HSIC USB controller on qcom SoCs has an integrated all
> digital phy controlled via the ULPI viewport.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hsic-phy.txt  |  72 +++++++++
>  drivers/phy/Kconfig                                |   7 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-qcom-usb-hsic.c                    | 167 +++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-usb-hsic.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
> new file mode 100644
> index 000000000000..97191f31d6f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.txt
> @@ -0,0 +1,72 @@
> +Qualcomm's USB HSIC PHY
> +
> +PROPERTIES
> +
> +- compatible:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Should contain "qcom,usb-hsic-phy"

Add a chip specific compatible please.

Rob
