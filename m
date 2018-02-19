Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 18:10:17 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed-lpc: Document LPC Host Interface
 Controller
Message-ID: <20180219001017.cnei34oijn7ybh72@rob-hp-laptop>
References: <20180212070847.32387-1-joel@jms.id.au>
 <20180212070847.32387-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180212070847.32387-2-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 12, 2018 at 05:38:45PM +1030, Joel Stanley wrote:
> The LPC Host Interface Controller is part of a BMC SoC that is used for
> communication with the host.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
