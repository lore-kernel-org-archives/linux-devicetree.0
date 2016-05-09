From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/4] clk: Add drivers for Aspeed BMC SoCs
Date: Mon,  9 May 2016 22:01:47 +0930
Message-ID: <1462797111-14271-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, heiko@sntech.de, arnd@arndb.de, benh@kernel.crashing.org, jk@ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

This adds support for the Aspeed ast2400 and ast2500 BMC SoCs. The drivers are
basic in that they only create clock devices so other drivers know what
frequency they are clocked at; there is no support for modifying the clocks.

Heiko and I exchanged some mail about the structure of the drivers. Thanks for
the review Hieko! However, I still think the layout matches the hardware as we
understand it so I did not make significant changes.

Cheers,

Joel

Joel Stanley (4):
  doc/devicetree: Add Aspeed clock bindings
  drvers/clk: Support fourth generation Aspeed SoCs
  drvers/clk: Support fifth generation Aspeed SoCs
  drivers/clk: Support Aspeed UART clock divisor

 .../devicetree/bindings/clock/aspeed-clock.txt     | 156 +++++++++++++++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/aspeed/Makefile                        |   3 +
 drivers/clk/aspeed/clk-g4.c                        | 109 ++++++++++++
 drivers/clk/aspeed/clk-g5.c                        | 189 +++++++++++++++++++++
 drivers/clk/aspeed/clk-uart.c                      |  52 ++++++
 6 files changed, 510 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/aspeed-clock.txt
 create mode 100644 drivers/clk/aspeed/Makefile
 create mode 100644 drivers/clk/aspeed/clk-g4.c
 create mode 100644 drivers/clk/aspeed/clk-g5.c
 create mode 100644 drivers/clk/aspeed/clk-uart.c

-- 
2.8.1
