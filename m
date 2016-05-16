From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add Oxford Semiconductor OXNAS
 pinctrl and gpio bindings
Date: Mon, 16 May 2016 09:52:57 -0500
Message-ID: <20160516145257.GA31044@rob-hp-laptop>
References: <1462952062-5316-1-git-send-email-narmstrong@baylibre.com>
 <1462952062-5316-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462952062-5316-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 09:34:22AM +0200, Neil Armstrong wrote:
> Add pinctrl and gpio DT bindings for Oxford Semiconductor OXNAS SoC Family.
> This version supports the ARM926EJ-S based OX810SE SoC with 34 IO pins.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/gpio/gpio_oxnas.txt        | 47 ++++++++++++++++++
>  .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 57 ++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt

Acked-by: Rob Herring <robh@kernel.org>
