From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 3/6] mfd: lochnagar: Add initial binding documentation
Date: Tue, 13 Nov 2018 11:16:52 +0000
Message-ID: <20181113111652.GV16508@imbe.wolfsonmicro.main>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
 <20181108101405.14062-4-ckeepax@opensource.cirrus.com>
 <20181113082825.GB3513@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181113082825.GB3513@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 08:28:25AM +0000, Lee Jones wrote:
> On Thu, 08 Nov 2018, Charles Keepax wrote:
> 
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform. This driver supports the board
> > controller chip on the Lochnagar board.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > 
> > I have dropped Rob and Stephen's Acks from this patch on
> > account of the scale of the changes since v3.
> > 
> > Changes since v3:
> >  - Split the binding up into separate parts for the individual subsystems
> >  - Added documentation for the fixed clocks that are done through DT
> > 
> > Thanks,
> > Charles
> > 
> >  .../devicetree/bindings/clock/cirrus,lochnagar.txt |  89 +++++++++++++
> >  .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  70 ++++++++++
> 
> I think these should all be seperate patches.
> 

I will need to do a respin for the regulator changes anyway so
can split them up then.

Thanks,
Charles
