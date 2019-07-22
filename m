From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Mon, 22 Jul 2019 14:48:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907221446340.5793@viisi.sifive.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com> <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>, davem@davemloft.net
Cc: sagar.kadam@sifive.com, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, ynezz@true.cz, sachin.ghadi@sifive.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Fri, 19 Jul 2019, Yash Shah wrote:

> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Thanks, queuing this one for v5.3-rc with Andrew's suggested change to 
change phy1 to phy0.

Am assuming patches 1 and 2 will go in via -net.


- Paul
