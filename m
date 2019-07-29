From: Roger Lu <roger.lu@mediatek.com>
Subject: PM / AVS: SVS: Introduce SVS engine
Date: Mon, 29 Jul 2019 16:20:30 +0800
Message-ID: <20190729082032.13661-1-roger.lu@mediatek.com>
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
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>, linux-kernel@vger.kernel.org, HenryC Chen <HenryC.Chen@mediatek.com>, yt.lee@mediatek.com, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SVS driver use OPP adjust event in [1] to update OPP table voltage part.

[1] https://patchwork.kernel.org/patch/10946069/

changes since v3:
- return -ENOMEM when kmalloc() cannot allocate memory.
- Refine SVS debug log format for SVS designer request.

Roger Lu (2):
  dt-bindings: soc: add mtk svs dt-bindings
  PM / AVS: SVS: Introduce SVS engine

 .../devicetree/bindings/power/mtk-svs.txt     |   88 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2075 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 5 files changed, 2197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h
