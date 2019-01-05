From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 2/3] qcom: spmi-gpio: add support for hierarchical IRQ
 chip
Date: Sat, 5 Jan 2019 07:51:15 -0500
Message-ID: <20190105125115.GA2647@basecamp>
References: <20181229114755.8711-1-masneyb@onstation.org>
 <20181229114755.8711-3-masneyb@onstation.org>
 <154656291378.15366.8661245319757182529@swboyd.mtv.corp.google.com>
 <20190105120844.GA2298@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190105120844.GA2298@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 05, 2019 at 07:08:44AM -0500, Brian Masney wrote:
> > I also seem to recall that GPIO numbering starts from 1 instead of
> > 0, so please keep that in mind.
> 
> I'm using the pinctrl numbering, which is zero based.
> 
> / # head /sys/kernel/debug/pinctrl/fc4cf000.spmi\:pm8941@0\:gpios@c000/pins 
> registered pins: 36
> pin 0 (gpio1) 
> pin 1 (gpio2) 
> pin 2 (gpio3) 
> pin 3 (gpio4) 
> pin 4 (gpio5) 
> pin 5 (gpio6) 
> pin 6 (gpio7) 
> pin 7 (gpio8) 
> pin 8 (gpio9) 

After more thought: the pin numbering from pinctrl is an implementation
detail that device tree should not be aware of. This needs to be the
GPIO pin number. I'll correct this in v2.

Brian
