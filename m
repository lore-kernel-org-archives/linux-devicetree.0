From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/9] Add device tree support for on-chip SRAM
Date: Fri, 31 Aug 2012 11:26:55 +0200
Message-ID: <1346405224-20399-1-git-send-email-p.zabel@pengutronix.de>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

These patches add support to configure on-chip SRAM via device-tree
node and to obtain the resulting genalloc pool from a phandle pointing
at the node.
This allows drivers to allocate SRAM with the genalloc API without
hard-coding the genalloc pool address.

The on-chip SRAM on i.MX53 and i.MX6q is registered via device tree and
changed to use the simple generic SRAM driver:

		ocram: ocram@00900000 {
			compatible = "fsl,imx-ocram", "sram";
			reg = <0x00900000 0x3f000>;
 		};

A driver that needs to allocate SRAM buffers, like the video processing
unit on i.MX53, can retrieve the genalloc pool from a phandle in the
device tree using of_get_named_gen_pool(node, "iram", 0) from patch 5:

		vpu@63ff4000 {
			/* ... */
			iram = <&ocram>;
 		};

Changes since v1:
 - Added a generic SRAM driver in drivers/misc that does nothing but
   request/ioremap its given memory region and serve it via the genalloc
   API.
 - Renamed the i.MX device tree nodes from "iram" to "ocram".

regards
Philipp

---
 arch/arm/boot/dts/imx53.dtsi          |    5 ++
 arch/arm/boot/dts/imx6q.dtsi          |    5 ++
 arch/arm/plat-mxc/Kconfig             |    4 --
 arch/arm/plat-mxc/Makefile            |    1 -
 arch/arm/plat-mxc/include/mach/iram.h |   41 -------------
 arch/arm/plat-mxc/iram_alloc.c        |   73 -----------------------
 drivers/misc/Kconfig                  |    8 +++
 drivers/misc/Makefile                 |    1 +
 drivers/misc/sram.c                   |  105 +++++++++++++++++++++++++++++++++
 include/linux/genalloc.h              |   14 +++++
 lib/genalloc.c                        |   77 ++++++++++++++++++++++++
 11 files changed, 215 insertions(+), 119 deletions(-)
