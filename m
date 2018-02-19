Return-Path: <SRS0=f5IU=FN=huawei.com=john.garry@kernel.org>
From: John Garry <john.garry@huawei.com>
Subject: [PATCH 5/8] scsi: hisi_sas: increase timer expire of internal abort task
Date: Tue, 20 Feb 2018 03:13:28 +0800
Message-ID: <1519067611-206638-6-git-send-email-john.garry@huawei.com>
In-Reply-To: <1519067611-206638-1-git-send-email-john.garry@huawei.com>
References: <1519067611-206638-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, Xiaofei Tan <tanxiaofei@huawei.com>, John Garry <john.garry@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Xiaofei Tan <tanxiaofei@huawei.com>

The current 110ms expiry time is not long enough for the internal
abort task.

The reason is that the internal abort task could be blocked in HW
if the HW is retrying to set up link. The internal abort task will
be executed only when the retry process finished.

The maximum time is 5s for the retry of setting up link. So, the timer
expire should be more than 5s. This patch increases it from 110ms to 6s.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/scsi/hisi_sas/hisi_sas_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 9d16372..9ff8790 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -871,6 +871,7 @@ static void hisi_sas_tmf_timedout(struct timer_list *t)
 
 #define TASK_TIMEOUT 20
 #define TASK_RETRY 3
+#define INTERNAL_ABORT_TIMEOUT 6
 static int hisi_sas_exec_internal_tmf_task(struct domain_device *device,
 					   void *parameter, u32 para_len,
 					   struct hisi_sas_tmf_task *tmf)
@@ -1574,7 +1575,7 @@ static int hisi_sas_query_task(struct sas_task *task)
 	task->task_proto = device->tproto;
 	task->task_done = hisi_sas_task_done;
 	task->slow_task->timer.function = hisi_sas_tmf_timedout;
-	task->slow_task->timer.expires = jiffies + msecs_to_jiffies(110);
+	task->slow_task->timer.expires = jiffies + INTERNAL_ABORT_TIMEOUT*HZ;
 	add_timer(&task->slow_task->timer);
 
 	res = hisi_sas_internal_abort_task_exec(hisi_hba, sas_dev->device_id,
-- 
1.9.1
