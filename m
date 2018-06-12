From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: arm: remove PMC bindings
Date: Tue, 12 Jun 2018 15:53:37 -0600
Message-ID: <20180612215337.GA6569@rob-hp-laptop>
References: <20180607084107.4461-1-alexandre.belloni@bootlin.com>
 <20180607084107.4461-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180607084107.4461-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 07, 2018 at 10:41:04AM +0200, Alexandre Belloni wrote:
> The PMC bindings are fully described in
> Documentation/devicetree/bindings/clock/at91-clock.txt. Remove the
> duplicate and incomplete documentation.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/arm/atmel-pmc.txt          | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/atmel-pmc.txt

Acked-by: Rob Herring <robh@kernel.org>
