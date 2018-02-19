Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 14:41:25 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed-lpc: Add reset controller
Message-ID: <20180219204125.ralfeo6rm7wzkcnq@rob-hp-laptop>
References: <20180219065438.19933-1-joel@jms.id.au>
 <20180219065438.19933-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180219065438.19933-2-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 05:24:36PM +1030, Joel Stanley wrote:
> This describes the reset controller present in the LPC address space.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt          | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
