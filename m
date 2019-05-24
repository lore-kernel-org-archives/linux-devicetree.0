From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] net: macb: Add support for SiFive FU540-C000
Date: Fri, 24 May 2019 10:22:06 +0530
Message-ID: <CAJ2_jOE0-zK1csRNeiAmag9kEbvOGhbvRa-5ESYif7e15gpRcQ@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-3-git-send-email-yash.shah@sifive.com>
 <20190523145417.GD19369@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190523145417.GD19369@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, davem@davemloft.net, netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, ynezz@true.cz, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 8:24 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                               unsigned long parent_rate)
> > +{
> > +     rate = fu540_macb_tx_round_rate(hw, rate, &parent_rate);
> > +     iowrite32(rate != 125000000, mgmt->reg);
>
> That looks odd. Writing the result of a comparison to a register?

The idea was to write "1" to the register if the value of rate is
anything else than 125000000.
To make it easier to read, I will change this to below:
    - iowrite32(rate != 125000000, mgmt->reg);
    + if (rate != 125000000)
    +     iowrite32(1, mgmt->reg);
    + else
    +     iowrite32(0, mgmt->reg);

Hope that's fine. Thanks for your comment
- Yash

>
>      Andrew
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
