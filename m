From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Thu, 23 May 2019 14:49:16 +0200
Message-ID: <mvmwoihfi9f.fsf@suse.de>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558611952-13295-1-git-send-email-yash.shah@sifive.com> (Yash
        Shah's message of "Thu, 23 May 2019 17:15:50 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, paul.walmsley@sifive.com, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mai 23 2019, Yash Shah <yash.shah@sifive.com> wrote:

> On FU540, the management IP block is tightly coupled with the Cadence
> MACB IP block. It manages many of the boundary signals from the MACB IP
> This patchset controls the tx_clk input signal to the MACB IP. It
> switches between the local TX clock (125MHz) and PHY TX clocks. This
> is necessary to toggle between 1Gb and 100/10Mb speeds.

Doesn't work for me:

[  365.842801] macb: probe of 10090000.ethernet failed with error -17

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
