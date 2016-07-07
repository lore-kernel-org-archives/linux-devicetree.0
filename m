From: Tai Nguyen <ttnguyen@apm.com>
Subject: [PATCH v7 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
Date: Wed,  6 Jul 2016 17:07:22 -0700
Message-ID: <1467850045-10584-2-git-send-email-ttnguyen@apm.com>
References: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com
Cc: devicetree@vger.kernel.org, patches@apm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tai Nguyen <ttnguyen@apm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tai Nguyen <ttnguyen@apm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4978dc1..3bd4143 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8593,6 +8593,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/pm8001/
 
+PMU-XGENE
+APPLIED MICRO (APM) X-GENE SOC PMU
+M:	Tai Nguyen <ttnguyen@apm.com>
+S:	Supported
+F:	drivers/perf/xgene_pmu.c
+F:	Documentation/perf/xgene-pmu.txt
+F:	Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
+
 POSIX CLOCKS and TIMERS
 M:	Thomas Gleixner <tglx@linutronix.de>
 L:	linux-kernel@vger.kernel.org
-- 
1.9.1
