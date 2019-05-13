From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add a
 'drive-strength-microamp' property
Date: Mon, 13 May 2019 10:24:51 -0500
Message-ID: <20190513152451.GA25690@bogus>
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-2-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190510082324.21181-2-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 May 2019 10:23:19 +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
