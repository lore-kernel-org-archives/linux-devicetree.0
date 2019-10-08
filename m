From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] clk: aspeed: Expose RMII RCLK gate for MACs 1-2 on AST2500
Date: Tue,  8 Oct 2019 22:05:21 +1030
Message-ID: <20191008113523.13601-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series is two small changes enable kernel support for controlling the RMII
RCLK gate on AST2500-based systems. Previously the kernel has assumed u-boot
has ungated RCLK for networking to function.

RMII is commonly used for NCSI, which itself is commonly used for BMC-based
designs to reduce cabling requirements for the platform.

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: clock: Add AST2500 RMII RCLK definitions
  clk: aspeed: Add RMII RCLK gates for both AST2500 MACs

 drivers/clk/clk-aspeed.c                 | 27 +++++++++++++++++++++++-
 include/dt-bindings/clock/aspeed-clock.h |  2 ++
 2 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.20.1
