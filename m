From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH 0/2] add support for Spreadtrum's FM driver
Date: Tue, 4 Jul 2017 18:15:06 +0800
Message-ID: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org, Zhongping Tan <zhongping.tan@spreadtrum.com>, Songhe Wei <songhe.wei@spreadtrum.com>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

According to GregKH's suggestion [1], we tried to simply sort out the
FM driver source code which has been using in the internal projects.

Hopes it can help for fixing the problem raised in [1].

[1] https://lkml.org/lkml/2017/6/28/222

Chunyan Zhang (2):
  arm64: dts: add Spreadtrum's fm support
  misc: added Spreadtrum's radio driver

 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts      |    4 +
 drivers/misc/Kconfig                           |    1 +
 drivers/misc/Makefile                          |    1 +
 drivers/misc/sprd-wcn/Kconfig                  |   14 +
 drivers/misc/sprd-wcn/Makefile                 |    1 +
 drivers/misc/sprd-wcn/radio/Kconfig            |    8 +
 drivers/misc/sprd-wcn/radio/Makefile           |    2 +
 drivers/misc/sprd-wcn/radio/fmdrv.h            |  595 +++++++++++
 drivers/misc/sprd-wcn/radio/fmdrv_main.c       | 1245 ++++++++++++++++++++++++
 drivers/misc/sprd-wcn/radio/fmdrv_main.h       |  117 +++
 drivers/misc/sprd-wcn/radio/fmdrv_ops.c        |  447 +++++++++
 drivers/misc/sprd-wcn/radio/fmdrv_ops.h        |   17 +
 drivers/misc/sprd-wcn/radio/fmdrv_rds_parser.c |  753 ++++++++++++++
 drivers/misc/sprd-wcn/radio/fmdrv_rds_parser.h |  103 ++
 14 files changed, 3308 insertions(+)
 create mode 100644 drivers/misc/sprd-wcn/Kconfig
 create mode 100644 drivers/misc/sprd-wcn/Makefile
 create mode 100644 drivers/misc/sprd-wcn/radio/Kconfig
 create mode 100644 drivers/misc/sprd-wcn/radio/Makefile
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv.h
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_main.c
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_main.h
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_ops.c
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_ops.h
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_rds_parser.c
 create mode 100644 drivers/misc/sprd-wcn/radio/fmdrv_rds_parser.h

-- 
2.7.4
