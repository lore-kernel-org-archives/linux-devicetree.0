From: <sean.wang@mediatek.com>
Subject: [PATCH 0/2] media: rc: add support for IR receiver on MT7623 SoC
Date: Fri, 6 Jan 2017 00:06:22 +0800
Message-ID: <1483632384-8107-1-git-send-email-sean.wang@mediatek.com>
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

This patchset introduces Consumer IR (CIR) support for MT7623 SoC 
or other similar SoC and implements raw mode for more compatibility
with different protocols. The driver simply reports the duration of 
pulses and spaces to rc core logic to decode.

Sean Wang (2):
  Documentation: devicetree: Add document bindings for mtk-cir
  media: rc: add driver for IR remote receiver on MT7623 SoC

 .../devicetree/bindings/media/mtk-cir.txt          |  23 ++
 drivers/media/rc/Kconfig                           |  10 +
 drivers/media/rc/Makefile                          |   1 +
 drivers/media/rc/mtk-cir.c                         | 319 +++++++++++++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 linux-4.8.rc1_p0/Documentation/devicetree/bindings/media/mtk-cir.txt
 create mode 100644 linux-4.8.rc1_p0/drivers/media/rc/mtk-cir.c

-- 
1.9.1
