Return-Path: <robherring2@gmail.com>
Date: Wed, 24 Oct 2018 13:39:00 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Message-ID: <20181024183900.GA22215@bogus>
References: <20181019134030.10472-1-chris.brandt@renesas.com>
 <20181019134030.10472-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181019134030.10472-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, jacopo mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 19 Oct 2018 08:40:30 -0500, Chris Brandt wrote:
> Add device tree binding documentation and header file for Renesas R7S9210
> (RZ/A2) SoCs.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Moved gpio-controller to required
>  * Wrote a better description of what the sub-nodes are for
>  * Added pinmux property description
>  * Changed macro RZA2_PIN_ID to RZA2_PIN
> ---
>  .../bindings/pinctrl/renesas,rza2-pinctrl.txt      | 88 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/r7s9210-pinctrl.h      | 47 ++++++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
>  create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
