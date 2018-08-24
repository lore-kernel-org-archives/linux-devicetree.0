From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/2] dmaengine: add UniPhier MIO DMAC driver
Date: Fri, 24 Aug 2018 10:41:11 +0900
Message-ID: <1535074873-15617-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


1/2: DT-binding
2/2: driver


Masahiro Yamada (2):
  dt-bindings: dmaengine: add DT binding for UniPhier MIO DMAC
  dmaengine: uniphier-mdmac: add UniPhier MIO DMAC driver

 .../devicetree/bindings/dma/uniphier-mio-dmac.txt  |  25 ++
 MAINTAINERS                                        |   1 +
 drivers/dma/Kconfig                                |  11 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/uniphier-mdmac.c                       | 481 +++++++++++++++++++++
 5 files changed, 519 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
 create mode 100644 drivers/dma/uniphier-mdmac.c

-- 
2.7.4
