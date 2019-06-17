From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 16:45:44 +0530
Message-ID: <CAJ2_jOEdejgb-ryx3og5gzWP7wSw0tp1Enk-pjD2rZqJ4JcO3A@mail.gmail.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de> <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
 <CAJ2_jOH-CacU9+Lce80PQzG1ytxvSZmjfSMwL9=kbXpWxyU96Q@mail.gmail.com> <alpine.DEB.2.21.9999.1906170324250.19994@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906170324250.19994@viisi.sifive.com>
Sender: netdev-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Andreas Schwab <schwab@suse.de>, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, Sachin Ghadi <sachin.ghadi@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 3:58 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 17 Jun 2019, Yash Shah wrote:
>
> > On Mon, Jun 17, 2019 at 3:28 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > > On Mon, 17 Jun 2019, Andreas Schwab wrote:
> > >
> > > > On Jun 17 2019, Yash Shah <yash.shah@sifive.com> wrote:
> > > >
> > > > > - Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
> > > > >   driver. This is needed because on FU540, the macb driver depends on
> > > > >   SiFive GPIO driver.
> > > >
> > > > This of course requires that the GPIO driver is upstreamed first.
> > >
> > > What's the impact of enabling CONFIG_MACB_SIFIVE_FU540 when the GPIO
> > > driver isn't present?  (After modifying the Kconfig "depends" line
> > > appropriately.)
> > >
> > > Looks to me that it shouldn't have an impact unless the DT string is
> > > present, and even then, the impact might simply be that the MACB driver
> > > may not work?
> >
> > Yes, there won't be an impact other than MACB driver not working.
>
> OK.  In that case, there doesn't seem much point to adding the Kconfig
> option.  Could you please post a new version without it?

Sure, will do that.

>
> > In any case, without GPIO driver, PHY won't get reset and the network
> > interface won't come up.
>
> Naturally, in the medium term, we want Linux to handle the reset.  But if
> there's no GPIO driver present, and the bootloader handles the PHY reset
> before the kernel starts, would the network driver work in that case?

Yes, if bootloader handles the PHY reset then the network driver will
work in that case.
I will post a new version without the GPIO driver dependency.

>
>
> - Paul
