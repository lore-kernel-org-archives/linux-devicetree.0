From: "Christian Daudt" <csd@broadcom.com>
Subject: [GIT PULL] ARM: bcm281xx firmware tags
Date: Wed, 10 Apr 2013 10:33:37 -0700
Message-ID: <5165A271.6060407@broadcom.com>
References: <1362451632-18806-1-git-send-email-csd@broadcom.com>
 <201303060631.03782.arnd@arndb.de> <5136F816.2070909@broadcom.com>
 <201303061128.57127.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201303061128.57127.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: csd_b@daudt.org, devicetree-discuss@lists.ozlabs.org, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Olof,
  Please pull the branch below - it contains the BCM281xx l2 cache 
enabling code.

  Thanks,
    csd


The following changes since commit 07961ac7c0ee8b546658717034fe692fd12eefa9:

   Linux 3.9-rc5 (2013-03-31 15:12:43 -0700)

are available in the git repository at:

   git://github.com/broadcom/bcm11351.git tags/fw-for-3.10

for you to fetch changes up to 7f6c62e2695bcb1547afdeb4ad3bcdf8c610be2c:

   ARM: bcm281xx: Add DT support for SMC handler (2013-04-09 09:21:59 -0700)

----------------------------------------------------------------
l2cache driver for bcm281xx SoC

----------------------------------------------------------------
Christian Daudt (2):
       ARM: bcm281xx: Add L2 cache enable code
       ARM: bcm281xx: Add DT support for SMC handler

  Documentation/devicetree/bindings/misc/smc.txt |   14 +++++++++++
  arch/arm/boot/dts/bcm11351.dtsi                |    5 ++++
  arch/arm/mach-bcm/Makefile                     |    4 +++-
  arch/arm/mach-bcm/bcm_kona_smc.c               |  118 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/mach-bcm/bcm_kona_smc.h               |   80 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/mach-bcm/bcm_kona_smc_asm.S           |   41 
++++++++++++++++++++++++++++++++
  arch/arm/mach-bcm/board_bcm.c                  |   23 ++++++++++++++++++
  7 files changed, 284 insertions(+), 1 deletion(-)
  create mode 100644 Documentation/devicetree/bindings/misc/smc.txt
  create mode 100644 arch/arm/mach-bcm/bcm_kona_smc.c
  create mode 100644 arch/arm/mach-bcm/bcm_kona_smc.h
  create mode 100644 arch/arm/mach-bcm/bcm_kona_smc_asm.S
