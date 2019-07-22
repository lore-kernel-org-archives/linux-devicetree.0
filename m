From: fugang.duan@nxp.com
Subject: [PATCH arm64/dts 0/2] arm64: dts: imx8qxp: add lpuart ports
Date: Mon, 22 Jul 2019 16:28:22 +0800
Message-ID: <20190722082824.15022-1-fugang.duan@nxp.com>
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
To: festevam@gmail.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, daniel.baluta@gmail.com, fugang.duan@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Add lpuart baud clock and add serial alias for imx8qxp lpuart ports,
to let lpuart work on imx8qxp platform.

V2:
- separate v1 patch to two patches, one is to add baud clock,
  the other is to add serial alias property.

Fugang Duan (2):
  arm64: dts: imx8qxp: add lpuart baud clock
  arm64: dts: imx8qxp: add serial alias

 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

-- 
2.7.4
