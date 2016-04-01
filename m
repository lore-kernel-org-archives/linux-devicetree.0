From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 0/2] fsl-mc binding and device tree updates
Date: Fri, 1 Apr 2016 15:54:12 -0500
Message-ID: <1459544052-19039-1-git-send-email-stuart.yoder@nxp.com>
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
Cc: mark.rutland@arm.com, german.rivera@freescale.com, linux-kernel@vger.kernel.org, Stuart Yoder <stuart.yoder@nxp.com>, robh+dt@kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

From: Stuart Yoder <stuart.yoder@nxp.com>

This patch series adds a few missing things from the binding
for the fsl-mc node on the ls2080a Soc-- msi-parent, ranges,
dpmac definition.  The ls2080a device tree is updated to
reflect the binding updates.

Stuart Yoder (2):
  Documentation: fsl-mc: binding updates for MSIs, ranges, PHYs
  arm64: dts: ls2080a: fsl-mc dt node updates

 .../devicetree/bindings/misc/fsl,qoriq-mc.txt      |   81 +++++++++++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |   87 ++++++++++++++++++++
 2 files changed, 167 insertions(+), 1 deletion(-)

-- 
1.7.9.5
