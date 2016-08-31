From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Wed, 31 Aug 2016 11:16:51 -0500
Message-ID: <20160831161651.GA32012@rob-hp-laptop>
References: <20160823061745.8162-1-zajec5@gmail.com>
 <20160823062613.13865-1-zajec5@gmail.com>
 <20160823195528.GA17844@rob-hp-laptop>
 <CACna6rzeLdAW_mEpUN355Xrr3v-zjBtQW_4z-gV1kOrPS=wr8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rzeLdAW_mEpUN355Xrr3v-zjBtQW_4z-gV1kOrPS=wr8A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 25, 2016 at 02:42:52PM +0200, Rafał Miłecki wrote:
> On 23 August 2016 at 21:55, Rob Herring <robh@kernel.org> wrote:
> > On Tue, Aug 23, 2016 at 08:25:59AM +0200, Rafał Miłecki wrote:
> >> From: Rafał Miłecki <rafal@milecki.pl>
> >>
> >> This clock is present on BCM53573 devices (including BCM47189) that use
> >> Cortex-A7. ILP is a part of PMU (Power Management Unit) and so it should
> >> be defined as one of its subnodes (subdevices). For more details see
> >> Documentation entry.
> >>
> >> Unfortunately there isn't a set of registers related to ILP clock only.
> >> We use registers 0x66c, 0x674 and 0x6dc and between them there are e.g.
> >> "retention*" and "control_ext" regs. This is why this driver maps all
> >> 0x1000 B of space.
> >
> > Then describe the block as a syscon which has several functions of
> > which clocks are one.
> 
> This isn't clear to me, sorry, could you describe it? Would you like
> me to update commit message or documentation? Is code fine as is?

Let me put it another way, when you need to use the other registers, how 
do you plan to describe them in DT? We don't really want a node per 
register, nor do I want to get binding docs one by one as you add each 
function. Instead describe the block with all the misc functions as a 
whole. What would you call that block? Still ILP or something else? 

Also, you if you do have multiple drivers all needing to access this 
single block, then that is when you need syscon and regmap.

Rob
