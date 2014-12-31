From: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Subject: [RFC PATCH v3 1/4] arm64: defconfig: increase NR_CPUS range to 2-4096.
Date: Wed, 31 Dec 2014 13:06:16 +0530
Message-ID: <1420011379-7116-2-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1420011379-7116-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420011379-7116-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, devicetree@vger.kernel.org, leif.lindholm@linaro.org, roy.franz@linaro.org, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, jchandra@broadcom.com, al.stone@linaro.org, arnd@arndb.de
Cc: gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

Raising the maximum limit to 4096.
This is to accomadate up-coming higher multi-core platforms.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
---
 arch/arm64/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 61fbd1f..242419d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -302,8 +302,8 @@ config SCHED_SMT
 	  places. If unsure say N here.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-64)"
-	range 2 64
+	int "Maximum number of CPUs (2-4096)"
+	range 2 4096
 	depends on SMP
 	# These have to remain sorted largest to smallest
 	default "64"
-- 
1.8.1.4
