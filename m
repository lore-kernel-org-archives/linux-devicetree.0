From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: gpio: max3191x: Document new driver
Date: Tue, 17 Oct 2017 15:30:28 -0500
Message-ID: <20171017203028.j3so5hrhsigolnq2@rob-hp-laptop>
References: <cover.1507797496.git.lukas@wunner.de>
 <57660f421f2080914940806394a9365ac959f5a8.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57660f421f2080914940806394a9365ac959f5a8.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 12:40:10PM +0200, Lukas Wunner wrote:
> Add device tree bindings for Maxim MAX3191x industrial serializer.
> 
> Cc: Mathias Duckeck <m.duckeck@kunbus.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Changes v1 -> v2:
> 
> - Add vendor prefix to GPIO identifiers, use boolean instead of
>   integer to select mode, rename boolean to ignore undervoltage
>   alarms, separate compatible strings with newlines. (Rob Herring)
> 
>  .../devicetree/bindings/gpio/gpio-max3191x.txt     | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt

Acked-by: Rob Herring <robh@kernel.org>

