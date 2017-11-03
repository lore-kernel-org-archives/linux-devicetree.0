From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v10 1/8] perf: Export perf_event_update_userpage
Date: Fri,  3 Nov 2017 17:50:58 +0000
Message-ID: <20171103175105.23546-2-suzuki.poulose@arm.com>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103175105.23546-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, robh@kernel.org, sudeep.holla@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, frowand.list@gmail.com, Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Export perf_event_update_userpage() so that PMU driver using them,
can be built as modules.

Cc: Peter Zilstra <peterz@infradead.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9d93db81fa36..550015829db8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4982,6 +4982,7 @@ void perf_event_update_userpage(struct perf_event *event)
 unlock:
 	rcu_read_unlock();
 }
+EXPORT_SYMBOL_GPL(perf_event_update_userpage);
 
 static int perf_mmap_fault(struct vm_fault *vmf)
 {
-- 
2.13.6
