From: <sean.wang@mediatek.com>
Subject: [PATCH v2 0/2] media: rc: add support for IR receiver on MT7623 SoC
Date: Tue, 10 Jan 2017 17:13:49 +0800
Message-ID: <1484039631-25120-1-git-send-email-sean.wang@mediatek.com>
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
To: mchehab@osg.samsung.com, hdegoede@redhat.com, hkallweit1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, keyhaede@gmail.com, sean@mess.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, hverkuil@xs4all.nl, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This patchset introduces consumer IR (CIR) support on MT7623 SoC 
that also works on other similar SoCs and implements raw mode for
more compatibility with different protocols. The driver simply
reports the duration of pulses and spaces to rc-core logic to
decode.

Changes since v1:
- change compatible string from "mediatek,mt7623-ir" into 
"mediatek,mt7623-cir"
- use KBUILD_MODNAME to provide consistent device name used in driver.
- remove unused fields in struct mtk_ir.
- use synchronize_irq to give protection between IRQ handler and 
remove handler.
- use devm_rc_allocate_device based on Andi Shyti's work.
- simplify error handling patch with devm_rc_register_device and devm_rc_allocate_device.
- remove unused spinlock.
- add comments about hardware limitation and related workarounds.
- enhance the caculation of sampling period for easiler assigned specific 
value.
- refine git description.
- fix IR message handling between IR hardware and rc-core.

Sean Wang (2):
  Documentation: devicetree: Add document bindings for mtk-cir
  media: rc: add driver for IR remote receiver on MT7623 SoC

 .../devicetree/bindings/media/mtk-cir.txt          |  24 ++
 drivers/media/rc/Kconfig                           |  11 +
 drivers/media/rc/Makefile                          |   1 +
 drivers/media/rc/mtk-cir.c                         | 326 +++++++++++++++++++++
 4 files changed, 362 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
 create mode 100644 drivers/media/rc/mtk-cir.c

-- 
2.7.4
