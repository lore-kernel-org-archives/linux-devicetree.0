From: Hoan Tran <hotran@apm.com>
Subject: [PATCH 0/2] clk: Add fractional scale clock support
Date: Thu, 16 Jun 2016 16:40:31 -0700
Message-ID: <1466120433-30648-1-git-send-email-hotran@apm.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, lho@apm.com, Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds fractional scale clock support.
Fractional scale clock is implemented for a single register field.
  Output rate = parent_rate * scale / denominator
For example, for 1 / 8 fractional scale, denominator will be 8 and scale
will be computed and programmed accordingly.

Hoan Tran (2):
  Documentation: dt: clock: Add fractional scale binding
  clk: Add fractional scale clock support

 .../bindings/clock/fractional-scale-clock.txt      |  31 +++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-fractional-scale.c                 | 253 +++++++++++++++++++++
 include/linux/clk-provider.h                       |  41 ++++
 4 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fractional-scale-clock.txt
 create mode 100644 drivers/clk/clk-fractional-scale.c

-- 
1.9.1

