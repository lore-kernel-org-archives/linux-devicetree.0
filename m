From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: clock: at91: new sckc bindings
Date: Mon, 25 Mar 2019 16:49:19 -0500
Message-ID: <20190325214919.GA31149@bogus>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
 <20190219170200.3608-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219170200.3608-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 19 Feb 2019 18:01:54 +0100, Alexandre Belloni wrote:
> Remove the need for child nodes in the sckc binding to be able to remove
> dtc warnings and have a more modern binding.
> 
> Also document optional properties.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/clock/at91-clock.txt  | 30 ++++++++-----------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
