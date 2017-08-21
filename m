From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v6 1/6] perf: Export perf_event_update_userpage
Date: Mon, 21 Aug 2017 18:55:04 +0100
Message-ID: <1503338109-32540-2-git-send-email-suzuki.poulose@arm.com>
References: <1503338109-32540-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503338109-32540-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: will.deacon@arm.com, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, mathieu.poirier@linaro.org, peterz@infradead.org, Jonathan.Cameron@huawei.com, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

Export perf_event_update_userpage() so that PMU driver using them,
can be built as modules.

Cc: Peter Zilstra <peterz@infradead.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index ee20d4c..309ad68 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4977,6 +4977,7 @@ void perf_event_update_userpage(struct perf_event *event)
 unlock:
 	rcu_read_unlock();
 }
+EXPORT_SYMBOL_GPL(perf_event_update_userpage);
 
 static int perf_mmap_fault(struct vm_fault *vmf)
 {
-- 
2.7.5
