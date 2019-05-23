From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Thu, 23 May 2019 09:28:25 -0700 (PDT)
Message-ID: <20190523.092825.2184612182055559835.davem@davemloft.net>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yash.shah@sifive.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, paul.walmsley@sifive.com, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org


Please be consistent in your subsystem prefixes used in your Subject lines.
You use "net: macb:" then "net/macb:"  Really, plain "macb: " is sufficient.

Thank you.
