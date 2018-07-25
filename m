From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/16] clk: at91: add new DT lookup function
Date: Wed, 25 Jul 2018 13:10:34 -0600
Message-ID: <20180725191034.GA29658@rob-hp-laptop>
References: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
 <20180717222757.10253-10-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180717222757.10253-10-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 12:27:50AM +0200, Alexandre Belloni wrote:
> Add a new DT lookup function to lookup for PMC clocks.
> 
> Note that the #ifndef AT91_PMC_MOSCS section will be removed once all the
> platforms are converted.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/clk/at91/pmc.c           | 34 ++++++++++++++++++++++++++++++++

>  include/dt-bindings/clock/at91.h | 14 +++++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 48 insertions(+)
