From: Feng Kan <fkan@apm.com>
Subject: [PATCH V3 0/3] Enable X-Gene platform reboot driver.
Date: Tue, 14 Jan 2014 17:07:32 -0800
Message-ID: <1389748055-23534-1-git-send-email-fkan@apm.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Enable X-Gene platform driver for the X-Gene platform. Change the
driver to use syscon to access the system clock unit's system
reset register.

V2 Change:
	- Add support for using ACPI resource.

V3 Change:
	- Remove the reboot driver's use of acpi resource patch.
	- Change the reboot driver to use syscon to parse out 
	  system clock register. Remove the old method of getting
	  register from the reboot driver directly.
	- Remove documentation since its now simple.

Feng Kan (3):
  arm64: add reboot dts entry for X-Gene platform.
  arm64: Enable system reset via arch Kconfig for X-Gene system.
  power: reset: use syscon driver to parse reboot register from scu

 arch/arm64/Kconfig                 |    2 ++
 arch/arm64/boot/dts/apm-storm.dtsi |   10 ++++++++++
 drivers/power/reset/xgene-reboot.c |   33 +++++++++++++++++----------------
 3 files changed, 29 insertions(+), 16 deletions(-)

-- 
1.7.6.1
