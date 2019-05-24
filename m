From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Fri, 24 May 2019 10:09:58 +0530
Message-ID: <CAJ2_jOEr5J7_-81MjUE63OSFKL-p9whEZ_FDBihojXP2wvadVg@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com> <mvmwoihfi9f.fsf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mvmwoihfi9f.fsf@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu, ynezz@true.cz, Paul Walmsley <paul.walmsley@sifive.com>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On Thu, May 23, 2019 at 6:19 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 23 2019, Yash Shah <yash.shah@sifive.com> wrote:
>
> > On FU540, the management IP block is tightly coupled with the Cadence
> > MACB IP block. It manages many of the boundary signals from the MACB IP
> > This patchset controls the tx_clk input signal to the MACB IP. It
> > switches between the local TX clock (125MHz) and PHY TX clocks. This
> > is necessary to toggle between 1Gb and 100/10Mb speeds.
>
> Doesn't work for me:
>
> [  365.842801] macb: probe of 10090000.ethernet failed with error -17
>

Make sure you have applied all the patches needed for testing found at
dev/yashs/ethernet branch of:
https://github.com/yashshah7/riscv-linux.git

In addition to that, make sure in your kernel config GPIO_SIFIVE=y
In v2 of this patch, I will add this select GPIO_SIFIVE config in the
Cadence Kconfig file.

- Yash
