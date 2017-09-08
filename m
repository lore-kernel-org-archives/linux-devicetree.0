From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 0/2] ARM: dts: keystone-k2g-evm: Add USB nodes and enable
 USB on K2G EVM
Date: Fri, 8 Sep 2017 13:41:30 -0500
Message-ID: <20170908184132.6155-1-fcooper@ti.com>
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
To: ssantosh@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rogerq@ti.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Add USB nodes to 66AK2G dtsi. Also enable the two USB nodes that are on
the K2G EVM.

Roger Quadros (1):
  ARM: dts: k2g-evm: Enable USB 0 and 1

Vitaly Andrianov (1):
  ARM: dts: k2g: Add USB instances

 arch/arm/boot/dts/keystone-k2g-evm.dts | 26 ++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    | 56 ++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
2.9.4.dirty
