From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 0/3] Fix NAND propeties for k2hk-evm
Date: Thu, 20 Mar 2014 19:06:21 +0200
Message-ID: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, galak@codeaurora.org, santosh.shilimkar@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, rob@landley.net, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series is intedent to fix problems founded when checked NAND flash
for k2hk-emv board rev2.0. Whithout this series we cannot use ubifs and
whole volume of present NAND memory.

Based on linux-next tag: next-20140320

Murali Karicheri (3):
  ARM: dts: k2hk-evm: set ubifs partition size for 512M NAND
  mtd: davinci-nand: add dts property for NAND_NO_SUBPAGE_WRITE option
  ARM: dts: k2hk-evm: disable subpage write for davinci nand device

 Documentation/devicetree/bindings/mtd/davinci-nand.txt | 2 ++
 arch/arm/boot/dts/k2hk-evm.dts                         | 3 ++-
 drivers/mtd/nand/davinci_nand.c                        | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
1.8.3.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
