From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH 0/2] mtd: fsl-quadspi: Update hwcap based on mode provided in
 dtsi file
Date: Thu, 25 Jan 2018 12:51:55 +0530
Message-ID: <1516864917-31969-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: boris.brezillon@free-electrons.com, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com, cyrille.pitchen@wedev4u.fr, han.xu@nxp.com, computersforpeace@gmail.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch-set added support to update hwcap of FSL QUADSPI controller
by reading values from the device tree files.

Updated the fsl-quadspi binding by adding spi-tx-bus-width,
spi-rx-bus-width binding needed to define mode of operation.

Depends on
 https://patchwork.ozlabs.org/project/linux-mtd/list/?series=25286

Yogesh Gaur (2):
  Documentation: binding: Update fsl-quadspi binding
  mtd: fsl-quadspi: Update hwcap based on mode provided in dtsi file

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  4 ++
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 46 ++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

-- 
1.9.1
