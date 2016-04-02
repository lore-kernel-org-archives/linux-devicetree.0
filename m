From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
Date: Fri, 1 Apr 2016 18:14:36 -0700
Message-ID: <20160402011436.GA18567@codeaurora.org>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160319235905.GA16539@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160319235905.GA16539@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: yassinjaffer@gmail.com, dev@linux-sunxi.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Hans de Goede <hdegoede@redhat.com>, Reinder de Haan <patchesrdh@mveas.com>, Jens Kuske <jenskuske@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/19, Rob Herring wrote:
> On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassinjaffer@gmail.com wrote:
> > From: Yassin Jaffer <yassinjaffer@gmail.com>
> > 
> > This patch adds a composite clock type consisting of
> > a clock gate, mux, configurable dividers, and a reset control.
> > 
> > Signed-off-by: Yassin Jaffer <yassinjaffer@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
> 
> I wish someone would just add all the sunxi clocks in one pass instead 
> of one by one.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Me too!

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
