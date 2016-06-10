From: Han Xu <han.xu@nxp.com>
Subject: [PATCH v2 0/6] support gpmi on i.MX6UL/7D and HW bitflip on i.MX6QP/7D
Date: Fri, 10 Jun 2016 12:01:28 -0500
Message-ID: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
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
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add support for gpmi nand on i.MX6UL and i.MX7D, document the related
properties in DT and add the HW bitflip detection and correction for
i.MX6QP and i.MX7D.

v1 ---> v2:
fix several indent and open parenthesis issues
drop off the void cast
rebase to latest code and adopt to SW bitflip code
split bitflip and i.MX6QP code

Han Xu (6):
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  mtd: nand: gpmi: document the clocks and clock-names in DT property
  mtd: nand: gpmi: add GPMI NAND support for i.MX6QP
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL
  mtd: nand: gpmi: document the new supported chip in DT

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 12 +++-
 drivers/mtd/nand/gpmi-nand/bch-regs.h              | 24 +++++--
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              | 15 +++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 75 ++++++++++++++++++++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             | 15 ++++-
 5 files changed, 119 insertions(+), 22 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
