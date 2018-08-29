From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Update pinctrl-ingenic for
 JZ4725B and GPIO merge
Date: Tue, 28 Aug 2018 19:32:35 -0500
Message-ID: <20180829003235.GA12527@bogus>
References: <20180821164236.21101-1-paul@crapouillou.net>
 <20180821164236.21101-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180821164236.21101-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 06:42:29PM +0200, Paul Cercueil wrote:
> The pinctrl-ingenic driver now supports the JZ4725B SoC.
> 
> Furthermore, the gpio-ingenic driver was dropped and the pinctrl-ingenic
> driver is now responsible for providing the GPIO functionality.

Driver changes aren't really valid reasons to change the binding. This 
is really just "combine the gpio binding with the pinctrl as it is all 
one block." In any case,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: New patch
> 
>  .../devicetree/bindings/gpio/ingenic,gpio.txt      | 46 ----------------------
>  .../bindings/pinctrl/ingenic,pinctrl.txt           | 39 ++++++++++++++++--
>  2 files changed, 35 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
