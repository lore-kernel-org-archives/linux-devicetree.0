From: Hoan Tran <hotran@apm.com>
Subject: [PATCH 0/3] clk: xgene: Add PMD clock support
Date: Tue, 23 Aug 2016 08:52:38 -0700
Message-ID: <1471967561-23634-1-git-send-email-hotran@apm.com>
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
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Hoan Tran <hotran@apm.com>, Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org, lho@apm.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add X-Gene PMD clock support.

PMD clock is implemented for a single register field.
  Output rate = parent_rate * (denominator - scale) / denominator
with
  - denominator = bitmask of register field + 1
  - scale = value of register field

For example, for bitmask is 0x7, denominator will be 8 and scale
will be computed and programmed accordingly.

Hoan Tran (3):
  Documentation: dtb: xgene: Add PMD clock binding
  clk: xgene: Add PMD clock
  arm64: dts: xgene: Add DT node for APM X-Gene 2 CPU clocks

 Documentation/devicetree/bindings/clock/xgene.txt |  22 +++
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        |  64 +++++++
 drivers/clk/clk-xgene.c                           | 223 ++++++++++++++++++++++
 3 files changed, 309 insertions(+)

-- 
1.9.1
