From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/2] Add macb support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 22:02:51 -0400 (EDT)
Message-ID: <20190618.220251.295948387700018458.davem@davemloft.net>
References: <1560844568-4746-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560844568-4746-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yash.shah@sifive.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 18 Jun 2019 13:26:06 +0530

> On FU540, the management IP block is tightly coupled with the Cadence
> MACB IP block. It manages many of the boundary signals from the MACB IP
> This patchset controls the tx_clk input signal to the MACB IP. It
> switches between the local TX clock (125MHz) and PHY TX clocks. This
> is necessary to toggle between 1Gb and 100/10Mb speeds.
> 
> Future patches may add support for monitoring or controlling other IP
> boundary signals.
> 
> This patchset is mostly based on work done by
> Wesley Terpstra <wesley@sifive.com>
> 
> This patchset is based on Linux v5.2-rc1 and tested on HiFive Unleashed
> board with additional board related patches needed for testing can be
> found at dev/yashs/ethernet_v3 branch of:
> https://github.com/yashshah7/riscv-linux.git
> 
> Change History:
 ...

Series applied, thank you.
