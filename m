From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/2] 66AK2G: Add DT entry for UART1 and UART2
Date: Tue, 5 Dec 2017 12:18:10 +0530
Message-ID: <20171205064812.15758-1-vigneshr@ti.com>
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
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Vignesh R <vigneshr@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds DT entry for the remaining two UART instances on 66AK2G
SoC.

Based on linux-next.

Franklin S Cooper Jr (2):
  ARM: dts: keystone-k2g: Add UART 1 and 2 instances
  ARM: dts: keystone-k2g-evm: Enable UART 2

 arch/arm/boot/dts/keystone-k2g-evm.dts | 13 +++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    | 29 ++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.15.0
