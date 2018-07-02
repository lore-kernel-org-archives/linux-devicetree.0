From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 0/2] clk: meson-axg: add pcie related clocks
Date: Mon, 2 Jul 2018 21:31:16 +0000
Message-ID: <20180702213118.19222-1-yixun.lan@amlogic.com>
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
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series try to add clocks for the pcie driver,
Due to ASIC desigin, the mipi clock is also required by the pcie
controller, so we also added in this patch series.


Changes since v1 at [1]:
  -- Separate dt-binding header files
  -- use table to exclude unwanted clock parent

[1] https://lkml.kernel.org/r/20180621122620.13195-1-yixun.lan@amlogic.com

Yixun Lan (2):
  clk: meson-axg: add pcie and mipi clock bindings
  clk: meson-axg: add clocks required by pcie driver

 drivers/clk/meson/axg.c              | 148 +++++++++++++++++++++++++++
 drivers/clk/meson/axg.h              |   6 +-
 include/dt-bindings/clock/axg-clkc.h |   3 +
 3 files changed, 156 insertions(+), 1 deletion(-)

-- 
2.18.0
