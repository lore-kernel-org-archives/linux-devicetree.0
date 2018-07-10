From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 0/2]  reset: uniphier: add USB3 core reset support
Date: Tue, 10 Jul 2018 10:14:15 +0900
Message-ID: <1531185257-16444-1-git-send-email-hayashi.kunihiko@socionext.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series add new USB3 core reset control support for UniPhier SoCs.
This reset line belongs to USB3 glue layer.

Changes since v1:
- dt-bindings: fix a typo, not "clock-names" but "reset-names"
- dt-bindings: add description of glue layer
- reuse soc_data for pxs2, ld20 and pxs3
- put reset_simple_data into uniphier_usb3_reset_priv
- replace clk operations with clk_bulk
- move nclks and nrsts to soc_data
- rewrite a header with C++ comment style
- change the subject 'USB3 controller reset' to 'USB3 core reset'

Kunihiko Hayashi (2):
  dt-bindings: reset: uniphier: add USB3 core reset support
  reset: uniphier: add USB3 core reset control

 .../devicetree/bindings/reset/uniphier-reset.txt   |  56 +++++++
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-uniphier-usb3.c                | 171 +++++++++++++++++++++
 4 files changed, 238 insertions(+)
 create mode 100644 drivers/reset/reset-uniphier-usb3.c

-- 
2.7.4
