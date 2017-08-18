From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: [PATCH v2 15/16] dmaengine: bcm-sba-raid: Add debugfs support
Date: Fri, 18 Aug 2017 10:33:54 +0530
Message-ID: <CAALAos_SXTMms8XmhEC28gxx4qvvr0z3wqQ=o_-BohMpcXwQTw@mail.gmail.com>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
 <1501583880-32072-16-git-send-email-anup.patel@broadcom.com> <20170817080142.GC3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170817080142.GC3053@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Device Tree <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 1:31 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Tue, Aug 01, 2017 at 04:07:59PM +0530, Anup Patel wrote:
>> This patch adds debugfs support to report stats via debugfs
>> which in-turn will help debug hang or error situations.
>>
>> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>  drivers/dma/bcm-sba-raid.c | 82 +++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 81 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
>> index f0a0e80..f9d110c 100644
>> --- a/drivers/dma/bcm-sba-raid.c
>> +++ b/drivers/dma/bcm-sba-raid.c
>> @@ -36,6 +36,7 @@
>>   */
>>
>>  #include <linux/bitops.h>
>> +#include <linux/debugfs.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dmaengine.h>
>>  #include <linux/list.h>
>> @@ -162,6 +163,9 @@ struct sba_device {
>>       struct list_head reqs_completed_list;
>>       struct list_head reqs_aborted_list;
>>       struct list_head reqs_free_list;
>> +     /* DebugFS directory entries */
>> +     struct dentry *root;
>> +     struct dentry *stats;
>>  };
>>
>>  /* ====== Command helper routines ===== */
>> @@ -486,6 +490,45 @@ static void sba_process_received_request(struct sba_device *sba,
>>       }
>>  }
>>
>> +static void sba_write_stats_in_seqfile(struct sba_device *sba,
>> +                                    struct seq_file *file)
>> +{
>> +     unsigned long flags;
>> +     struct sba_request *req;
>> +     u32 free_count = 0, alloced_count = 0, pending_count = 0;
>> +     u32 active_count = 0, aborted_count = 0, completed_count = 0;
>> +
>> +     spin_lock_irqsave(&sba->reqs_lock, flags);
>> +
>> +     list_for_each_entry(req, &sba->reqs_free_list, node)
>> +             free_count++;
>> +
>> +     list_for_each_entry(req, &sba->reqs_alloc_list, node)
>> +             alloced_count++;
>> +
>> +     list_for_each_entry(req, &sba->reqs_pending_list, node)
>> +             pending_count++;
>> +
>> +     list_for_each_entry(req, &sba->reqs_active_list, node)
>> +             active_count++;
>> +
>> +     list_for_each_entry(req, &sba->reqs_aborted_list, node)
>> +             aborted_count++;
>> +
>> +     list_for_each_entry(req, &sba->reqs_completed_list, node)
>> +             completed_count++;
>> +
>> +     spin_unlock_irqrestore(&sba->reqs_lock, flags);
>> +
>> +     seq_printf(file, "maximum requests   = %d\n", sba->max_req);
>> +     seq_printf(file, "free requests      = %d\n", free_count);
>> +     seq_printf(file, "alloced requests   = %d\n", alloced_count);
>> +     seq_printf(file, "pending requests   = %d\n", pending_count);
>> +     seq_printf(file, "active requests    = %d\n", active_count);
>> +     seq_printf(file, "aborted requests   = %d\n", aborted_count);
>> +     seq_printf(file, "completed requests = %d\n", completed_count);
>> +}
>> +
>>  /* ====== DMAENGINE callbacks ===== */
>>
>>  static void sba_free_chan_resources(struct dma_chan *dchan)
>> @@ -1451,6 +1494,19 @@ static void sba_receive_message(struct mbox_client *cl, void *msg)
>>       sba_process_received_request(sba, req);
>>  }
>>
>> +/* ====== Debugfs callbacks ====== */
>> +
>> +static int sba_debugfs_stats_show(struct seq_file *file, void *offset)
>> +{
>> +     struct platform_device *pdev = to_platform_device(file->private);
>> +     struct sba_device *sba = platform_get_drvdata(pdev);
>> +
>> +     /* Write stats in file */
>> +     sba_write_stats_in_seqfile(sba, file);
>> +
>> +     return 0;
>> +}
>> +
>>  /* ====== Platform driver routines ===== */
>>
>>  static int sba_prealloc_channel_resources(struct sba_device *sba)
>> @@ -1721,10 +1777,30 @@ static int sba_probe(struct platform_device *pdev)
>>       if (ret)
>>               goto fail_free_mchans;
>>
>> +     /* Check availability of debugfs */
>> +     if (!debugfs_initialized())
>> +             goto skip_debugfs;
>> +
>> +     /* Create debugfs root entry */
>> +     sba->root = debugfs_create_dir(dev_name(sba->dev), NULL);
>> +     if (IS_ERR_OR_NULL(sba->root)) {
>> +             ret = PTR_ERR_OR_ZERO(sba->root);
>> +             goto fail_free_resources;
>
> why fail, debugfs should be an optional thingy, why would you want to fail here?

Yes, we are handling the case when debugfs is not available
and skipping debugfs gracefully.

If debugfs is available then failure of debugfs_create_dir()
should be reported.

Regards,
Anup
