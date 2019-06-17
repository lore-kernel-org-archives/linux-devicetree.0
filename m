From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 03:28:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906170324250.19994@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com> <mvmtvco62k9.fsf@suse.de> <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com> <CAJ2_jOH-CacU9+Lce80PQzG1ytxvSZmjfSMwL9=kbXpWxyU96Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJ2_jOH-CacU9+Lce80PQzG1ytxvSZmjfSMwL9=kbXpWxyU96Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: Andreas Schwab <schwab@suse.de>, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, =?ISO-8859-15?Q?Petr_=A6tetiar?= <ynezz@true.cz>, Sachin Ghadi <sachin.ghadi@sifive.com>, sagar.kadam@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jun 2019, Yash Shah wrote:

> On Mon, Jun 17, 2019 at 3:28 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > On Mon, 17 Jun 2019, Andreas Schwab wrote:
> >
> > > On Jun 17 2019, Yash Shah <yash.shah@sifive.com> wrote:
> > >
> > > > - Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
> > > >   driver. This is needed because on FU540, the macb driver depends on
> > > >   SiFive GPIO driver.
> > >
> > > This of course requires that the GPIO driver is upstreamed first.
> >
> > What's the impact of enabling CONFIG_MACB_SIFIVE_FU540 when the GPIO
> > driver isn't present?  (After modifying the Kconfig "depends" line
> > appropriately.)
> >
> > Looks to me that it shouldn't have an impact unless the DT string is
> > present, and even then, the impact might simply be that the MACB driver
> > may not work?
> 
> Yes, there won't be an impact other than MACB driver not working.

OK.  In that case, there doesn't seem much point to adding the Kconfig 
option.  Could you please post a new version without it?

> In any case, without GPIO driver, PHY won't get reset and the network
> interface won't come up.

Naturally, in the medium term, we want Linux to handle the reset.  But if 
there's no GPIO driver present, and the bootloader handles the PHY reset 
before the kernel starts, would the network driver work in that case?
 

- Paul
