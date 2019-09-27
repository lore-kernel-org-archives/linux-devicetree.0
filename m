From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: Document the Xylon LogiCVC
 GPIO controller
Date: Fri, 27 Sep 2019 17:16:19 -0500
Message-ID: <20190927221619.GA22004@bogus>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-5-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927100407.1863293-5-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, 27 Sep 2019 12:04:06 +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a separate entity.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/gpio/xylon,logicvc-gpio.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
