From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 0/2] Disable subpage write for k2hk-evm
Date: Thu, 20 Mar 2014 00:15:43 +0200
Message-ID: <1395267345-27795-1-git-send-email-ivan.khoronzhuk@ti.com>
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
To: santosh.shilimkar@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

These patches disable subpage write for k2hk-evm.

Based on linux-next
tag: next-20140319

Ivan Khoronzhuk (2):
  mtd: davinci-nand: add dts property for NAND_NO_SUBPAGE_WRITE option
  ARM: dts: keystone: disable subpage write for davinci nand device

 Documentation/devicetree/bindings/mtd/davinci-nand.txt | 2 ++
 arch/arm/boot/dts/k2hk-evm.dts                         | 1 +
 drivers/mtd/nand/davinci_nand.c                        | 3 +++
 3 files changed, 6 insertions(+)

-- 
1.8.3.2
