From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH 0/2] ARM: bcm281xx: Board specific reboot code
Date: Fri, 28 Jun 2013 13:56:56 -0700
Message-ID: <1372453018-5830-1-git-send-email-markus.mayer@linaro.org>
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
To: ARM Kernel List <linux-arm-kernel@lists.infradead.org>
Cc: Markus Mayer <markus.mayer@linaro.org>, Device Tree List <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

This patch series adds reboot code and related device tree bindings needed
for the bcm281xx family.

Markus Mayer (2):
  ARM: bcm281xx: Board specific reboot code
  ARM: bcm281xx: DT changes for reboot code

 .../devicetree/bindings/arm/bcm/bcm,kona-wdt.txt   |   15 ++++++
 arch/arm/boot/dts/bcm11351.dtsi                    |    7 ++-
 arch/arm/mach-bcm/Makefile                         |    4 +-
 arch/arm/mach-bcm/board_bcm.c                      |   20 ++++++--
 arch/arm/mach-bcm/kona.c                           |   54 ++++++++++++++++++++
 arch/arm/mach-bcm/kona.h                           |   15 ++++++
 6 files changed, 109 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
 create mode 100644 arch/arm/mach-bcm/kona.c
 create mode 100644 arch/arm/mach-bcm/kona.h

-- 
1.7.9.5
