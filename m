From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: oxnas: Update Pinctrl and GPIO for
 OX820 Support
Date: Sat, 8 Oct 2016 20:29:24 -0500
Message-ID: <20161009012924.GU18158@rob-hp-laptop>
References: <20161004134148.23028-1-narmstrong@baylibre.com>
 <20161004134148.23028-4-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161004134148.23028-4-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gnurou@gmail.com, devicetree@vger.kernel.org, linux-oxnas@lists.tuxfamily.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 04, 2016 at 03:41:48PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio_oxnas.txt       | 2 +-
>  Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> index 928ed4f..9665147 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> @@ -3,7 +3,7 @@
>  Please refer to gpio.txt for generic information regarding GPIO bindings.
>  
>  Required properties:
> - - compatible: "oxsemi,ox810se-gpio"
> + - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"

It is preferred to have one per line, but it's fine unless you respin 
the series.

Acked-by: Rob Herring <robh@kernel.org>
