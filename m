From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/16] dt-bindings: clk: at91: Document new PMC binding
Date: Wed, 25 Jul 2018 13:09:30 -0600
Message-ID: <20180725190930.GA27482@rob-hp-laptop>
References: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
 <20180717222757.10253-9-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180717222757.10253-9-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 12:27:49AM +0200, Alexandre Belloni wrote:
> Document the new PMC binding with only one PMC node for all the PMC clocks
> instead of one node per clock as this proved to be problematic.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/clock/at91-clock.txt  | 523 +-----------------
>  1 file changed, 21 insertions(+), 502 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
