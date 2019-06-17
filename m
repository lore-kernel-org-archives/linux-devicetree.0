From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 02:58:20 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com> <mvmtvco62k9.fsf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <mvmtvco62k9.fsf@suse.de>
Sender: netdev-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: Andreas Schwab <schwab@suse.de>, davem@davemloft.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

Hi Yash,

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Yash Shah <yash.shah@sifive.com> wrote:
> 
> > - Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
> >   driver. This is needed because on FU540, the macb driver depends on
> >   SiFive GPIO driver.
> 
> This of course requires that the GPIO driver is upstreamed first.

What's the impact of enabling CONFIG_MACB_SIFIVE_FU540 when the GPIO 
driver isn't present?  (After modifying the Kconfig "depends" line 
appropriately.)

Looks to me that it shouldn't have an impact unless the DT string is 
present, and even then, the impact might simply be that the MACB driver 
may not work?


- Paul
