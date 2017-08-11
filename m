From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: gpio: aspeed: Remove reference
 to clock name
Date: Thu, 10 Aug 2017 21:56:57 -0500
Message-ID: <20170811025657.bw7kngklmnz7vpf3@rob-hp-laptop>
References: <20170808061634.11857-1-andrew@aj.id.au>
 <20170808061634.11857-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170808061634.11857-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, joel@jms.id.au, ryan_chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 03:46:33PM +0930, Andrew Jeffery wrote:
> HPLL was in fact not the clock we need. Remove prescription of which
> clock to avoid further error. Please refer to your datasheet and double
> check like I should have.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
