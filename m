Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 16:15:21 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: meson: add support for the
 Meson8m2 SoC
Message-ID: <20180427211521.rfjtwx4zorf3ipde@rob-hp-laptop>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
 <20180422105330.4712-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180422105330.4712-2-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 22, 2018 at 12:53:28PM +0200, Martin Blumenstingl wrote:
> The Meson8m2 SoC is a variant of Meson8 with some updates from Meson8b
> (such as the Gigabit capable DesignWare MAC).
> It is mostly pin compatible with Meson8, only 10 (existing) CBUS pins
> get an additional function (four of these are Ethernet RXD2, RXD3, TXD2
> and TXD3 which are required when the board uses an RGMII PHY).
> The AOBUS pins seem to be identical on Meson8 and Meson8m2.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
