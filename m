From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 23/23] phy: Add support for Qualcomm's USB HS phy
Date: Tue, 18 Oct 2016 11:46:09 -0500
Message-ID: <20161018164609.g4lfe4zgxviwgr3n@rob-hp-laptop>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018015636.11701-24-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161018015636.11701-24-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 06:56:36PM -0700, Stephen Boyd wrote:
> The high-speed phy on qcom SoCs is controlled via the ULPI
> viewport.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: <devicetree@vger.kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hs-phy.txt    |  86 +++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-qcom-usb-hs.c                      | 286 +++++++++++++++++++++
>  4 files changed, 381 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-usb-hs.c
