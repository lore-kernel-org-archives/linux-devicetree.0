From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Mon, 27 May 2019 17:22:27 +0530
Message-ID: <CAJ2_jOH344oH=mvo1n9RJDPjT4ArMNBaogqy0dLCOwCcY7Fwuw@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <mvmwoihfi9f.fsf@suse.de>
 <CAJ2_jOEr5J7_-81MjUE63OSFKL-p9whEZ_FDBihojXP2wvadVg@mail.gmail.com>
 <mvm36l0fhm3.fsf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <mvm36l0fhm3.fsf@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Andreas Schwab <schwab@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, netdev <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Sachin Ghadi <sachin.ghadi@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, linux-riscv@lists.infradead.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 1:34 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 24 2019, Yash Shah <yash.shah@sifive.com> wrote:
>
> > Hi Andreas,
> >
> > On Thu, May 23, 2019 at 6:19 PM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Mai 23 2019, Yash Shah <yash.shah@sifive.com> wrote:
> >>
> >> > On FU540, the management IP block is tightly coupled with the Cadence
> >> > MACB IP block. It manages many of the boundary signals from the MACB IP
> >> > This patchset controls the tx_clk input signal to the MACB IP. It
> >> > switches between the local TX clock (125MHz) and PHY TX clocks. This
> >> > is necessary to toggle between 1Gb and 100/10Mb speeds.
> >>
> >> Doesn't work for me:
> >>
> >> [  365.842801] macb: probe of 10090000.ethernet failed with error -17
> >>
> >
> > Make sure you have applied all the patches needed for testing found at
> > dev/yashs/ethernet branch of:
>
> Nope, try reloading the module.

Yes, I could see the error on reloading the module.
Thanks for the catch. I will fix this in the next version of this patch.

- Yash
