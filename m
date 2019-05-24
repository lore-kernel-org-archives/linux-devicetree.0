From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] net: macb: Add support for SiFive FU540-C000
Date: Fri, 24 May 2019 15:48:47 +0200
Message-ID: <20190524134847.GF2979@lunn.ch>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-3-git-send-email-yash.shah@sifive.com>
 <20190523145417.GD19369@lunn.ch>
 <CAJ2_jOE0-zK1csRNeiAmag9kEbvOGhbvRa-5ESYif7e15gpRcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ2_jOE0-zK1csRNeiAmag9kEbvOGhbvRa-5ESYif7e15gpRcQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, ynezz@true.cz, linux-riscv@lists.infradead.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 10:22:06AM +0530, Yash Shah wrote:
> On Thu, May 23, 2019 at 8:24 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +                               unsigned long parent_rate)
> > > +{
> > > +     rate = fu540_macb_tx_round_rate(hw, rate, &parent_rate);
> > > +     iowrite32(rate != 125000000, mgmt->reg);
> >
> > That looks odd. Writing the result of a comparison to a register?
> 
> The idea was to write "1" to the register if the value of rate is
> anything else than 125000000.

I'm not a language lawyer. Is it guaranteed that an expression like
this returns 1? Any value !0 is true, so maybe it actually returns 42?

> To make it easier to read, I will change this to below:
>     - iowrite32(rate != 125000000, mgmt->reg);
>     + if (rate != 125000000)
>     +     iowrite32(1, mgmt->reg);
>     + else
>     +     iowrite32(0, mgmt->reg);
> 
> Hope that's fine. Thanks for your comment

Yes, that is good.

     Andrew
