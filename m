From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
Date: Thu, 13 Apr 2017 14:52:30 -0500
Message-ID: <20170413195230.oze5qsyunckajbk7@rob-hp-laptop>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407125902.15960-3-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 10:29:00PM +0930, Andrew Jeffery wrote:
> We need a reference to the HPLL to calculate debounce cycles. If the
> clocks property is not supplied in the GPIO node then the consumer
> should deny any debounce requests.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
