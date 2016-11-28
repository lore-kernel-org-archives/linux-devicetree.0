From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] devicetree: bindings: pinctrl: Add binding for
 ti,da850-pupd
Date: Mon, 28 Nov 2016 15:54:34 -0600
Message-ID: <20161128215434.2fxp7zjszj2sq3an@rob-hp-laptop>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479871767-20160-2-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Bartosz =?utf-8?Q?Go=C5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 09:29:25PM -0600, David Lechner wrote:
> Device-tree bindings for TI DA8XX/OMAP-L138/AM18XX pullup/pulldown
> pinconf controller.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  .../devicetree/bindings/pinctrl/ti,da850-pupd.txt  | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt

Acked-by: Rob Herring <robh@kernel.org>
