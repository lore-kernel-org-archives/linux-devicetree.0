From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v4 1/6] perf: Export perf_event_update_userpage
Date: Mon,  7 Aug 2017 10:52:35 +0100
Message-ID: <1502099560-6267-2-git-send-email-suzuki.poulose@arm.com>
References: <1502099560-6267-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1502099560-6267-1-git-send-email-suzuki.poulose@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh@kernel.org, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>, will.deacon@arm.com, linux-kernel@vger.kernel.org, peterz@infradead.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

Export perf_event_update_userpage() so that PMU driver using them,
can be built as modules.

Cc: Peter Zilstra <peterz@infradead.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 426c2ff..21aad7a 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4946,6 +4946,7 @@ void perf_event_update_userpage(struct perf_event *event)
 unlock:
 	rcu_read_unlock();
 }
+EXPORT_SYMBOL_GPL(perf_event_update_userpage);
 
 static int perf_mmap_fault(struct vm_fault *vmf)
 {
-- 
2.7.5
