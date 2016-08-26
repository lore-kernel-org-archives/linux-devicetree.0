From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 0/2] arm64: dts: ls1043a/ls2080a serial updates
Date: Fri, 26 Aug 2016 15:46:19 -0500
Message-ID: <1472244381-1766-1-git-send-email-stuart.yoder@nxp.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: shawnguo@kernel.org, Stuart Yoder <stuart.yoder@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series serial aliases for ls2080a-rdb/qds and ls1043a-rdb,
fixes the aliases in ls1043a-qds and sets stdout-path for all the
boards.

Stuart Yoder (2):
  arm64: dts: updates serial aliases for ls1043a rdb and qds boards
  arm64: dts: add stdout-path to chosen node for ls2080a/ls1043a boards

 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 14 ++++++++------
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts |  8 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts |  3 +++
 arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts |  4 ++++
 4 files changed, 23 insertions(+), 6 deletions(-)

-- 
1.9.0
