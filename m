From: Loc Ho <lho@apm.com>
Subject: [PATCH 2/2] power: arm64: Add DTS entry for APM X-Gene reboot driver.
Date: Tue,  2 Jul 2013 14:38:59 -0600
Message-ID: <1372797539-13111-3-git-send-email-lho@apm.com>
References: <1372797539-13111-1-git-send-email-lho@apm.com>
 <1372797539-13111-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372797539-13111-2-git-send-email-lho@apm.com>
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

power: arm64: Add DTS entry for APM X-Gene reboot driver.

Signed-off-by: Loc Ho <lho@apm.com>
Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Kumar Sankaran <ksankaran@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index d37d736..e686919 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -178,6 +178,12 @@
 			};
 		};
 
+                reboot@0x17000014 {
+                        compatible = "apm,xgene-reboot";
+                        reg = <0x0 0x17000014 0x0 0x100>;
+                        mask = <0x1>;
+                };
+
 		serial0: serial@1c020000 {
 			device_type = "serial";
 			compatible = "ns16550";
-- 
1.5.5
