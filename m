From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 15:52:16 +0530
Message-ID: <CAJ2_jOH-CacU9+Lce80PQzG1ytxvSZmjfSMwL9=kbXpWxyU96Q@mail.gmail.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Sachin Ghadi <sachin.ghadi@sifive.com>, Rob Herring <robh+dt@kernel.org>, netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 3:28 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hi Yash,
>
> On Mon, 17 Jun 2019, Andreas Schwab wrote:
>
> > On Jun 17 2019, Yash Shah <yash.shah@sifive.com> wrote:
> >
> > > - Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
> > >   driver. This is needed because on FU540, the macb driver depends on
> > >   SiFive GPIO driver.
> >
> > This of course requires that the GPIO driver is upstreamed first.
>
> What's the impact of enabling CONFIG_MACB_SIFIVE_FU540 when the GPIO
> driver isn't present?  (After modifying the Kconfig "depends" line
> appropriately.)
>
> Looks to me that it shouldn't have an impact unless the DT string is
> present, and even then, the impact might simply be that the MACB driver
> may not work?

Yes, there won't be an impact other than MACB driver not working.
In any case, without GPIO driver, PHY won't get reset and the network
interface won't come up.

>
>
> - Paul
