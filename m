From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl-mcp23s08: Fix property-name in dt-example
Date: Mon, 2 Sep 2019 15:40:22 +0100
Message-ID: <20190902144022.GA24928@bogus>
References: <20190828195609.4176-1-peter.vernia@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828195609.4176-1-peter.vernia@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: peter.vernia@gmail.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, poeschel@lemonage.de
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2019 15:56:09 -0400, Peter Vernia wrote:
> The device-tree properties documentation-file specifies the property
> "microchip,spi-present-mask" as required for MCP23SXX chips. However,
> the device-tree-source example below it uses only "spi-present-mask".
> Without "microchip," on the front, the driver will print "missing
> spi-present-mask" when it initializes.
> 
> Update the device-tree example with the correct property-name.
> 
> Signed-off-by: Peter Vernia <peter.vernia@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
