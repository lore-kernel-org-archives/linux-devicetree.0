From: Loc Ho <lho@apm.com>
Subject: [PATCH 0/2] power: Add APM X-Gene SoC system reboot driver.
Date: Tue,  2 Jul 2013 14:38:57 -0600
Message-ID: <1372797539-13111-1-git-send-email-lho@apm.com>
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
To: cbou@mail.ru, dwmw2@infradead.org, fkan@apm.com, ksankaran@apm.com
Cc: Catalin.Marinas@arm.com, devicetree-discuss@lists.ozlabs.org, Loc Ho <lho@apm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add APM X-Gene SoC system reboot driver. This driver only supports system
reboot. System shutdown is board specific and will be handled by board specific
driver or GPIO based driver.

Loc Ho (2):
  power: Add APM X-Gene SoC system reboot driver. This driver handles
    only
  power: arm64: Add DTS entry for APM X-Gene reboot driver.

 arch/arm64/boot/dts/apm-storm.dtsi |    6 ++
 drivers/power/reset/Kconfig        |    7 +++
 drivers/power/reset/Makefile       |    1 +
 drivers/power/reset/xgene-reboot.c |  101 ++++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+), 0 deletions(-)
 create mode 100755 drivers/power/reset/xgene-reboot.c
