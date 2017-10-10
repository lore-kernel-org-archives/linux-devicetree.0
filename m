From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v8 1/8] perf: Export perf_event_update_userpage
Date: Tue, 10 Oct 2017 11:32:56 +0100
Message-ID: <20171010103303.32436-2-suzuki.poulose@arm.com>
References: <20171010103303.32436-1-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171010103303.32436-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, will.deacon@arm.com, sudeep.holla@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, Jonathan.Cameron@huawei.com, marc.zyngier@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Export perf_event_update_userpage() so that PMU driver using them,
can be built as modules.

Cc: Peter Zilstra <peterz@infradead.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6bc21e202ae4..162f5ba756a9 100644
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
