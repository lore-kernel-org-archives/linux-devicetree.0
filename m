From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/9] soc: brcmstb: biuctrl updates for 64-bit chips
Date: Wed, 29 Nov 2017 12:18:40 -0800
Message-ID: <20171129201849.17522-1-f.fainelli@gmail.com>
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
To: bcm-kernel-feedback-list@broadcom.com
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series updates the Broadcom STB Bus Interface Unit controller to
support newer chips such as 7260, 7268, 7271 and 7278. These chips require
additional tuning in order to provide the expected bus throughput.

In the process, we need to re-organize the common.c file a little bit in order
to extract the family and product identifiers a little earlier.

Finally, by moving the biuctrl initialization an early_initcall level, we can
remove some code from the ARM-32bit machine descriptor file.

Provided that we are happy with these changes, I would route them through my
drivers/next branch and a subsequent Broadcom ARM SoC pull request.

Thank you

Florian Fainelli (9):
  dt-bindings: arm: Add entry for Broadcom Brahma-B53
  dt-bindings: arm: brcmstb: Correct BIUCTRL node documentation
  soc: brcmstb: Make CPU credit offset more parameterized
  soc: brcmstb: Correct CPU_CREDIT_REG offset for Brahma-B53 CPUs
  soc: brcmstb: biuctrl: Prepare for saving/restoring other registers
  soc: brcmstb: biuctrl: Wire-up new registers
  soc: brcmstb: biuctrl: Fine tune B53 MCP interface settings
  soc: brcmstb: Split initialization
  soc: brcmstb: biuctrl: Move to early_initcall

 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |  22 +--
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm/mach-bcm/brcmstb.c                        |   2 -
 drivers/soc/bcm/brcmstb/biuctrl.c                  | 176 +++++++++++++++++++--
 drivers/soc/bcm/brcmstb/common.c                   |  27 ++--
 include/linux/soc/brcmstb/brcmstb.h                |   6 -
 6 files changed, 186 insertions(+), 48 deletions(-)

-- 
2.9.3
