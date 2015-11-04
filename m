From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 3/3] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Tue, 3 Nov 2015 19:07:19 -0500
Message-ID: <56394C37.4060603@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-4-git-send-email-okaya@codeaurora.org>
 <CAHp75VdBy+_ZYfg6PqyfwMfLa6Sr6nVX_PqkQERc4h7X7b4VCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdBy+_ZYfg6PqyfwMfLa6Sr6nVX_PqkQERc4h7X7b4VCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 11/3/2015 5:10 AM, Andy Shevchenko wrote:
> On Mon, Nov 2, 2015 at 8:07 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
>> This patch adds support for hidma engine. The driver
>> consists of two logical blocks. The DMA engine interface
>> and the low-level interface. The hardware only supports
>> memcpy/memset and this driver only support memcpy
>> interface. HW and driver doesn't support slave interface.
>
>> +/* Linux Foundation elects GPLv2 license only.
>> + */
>
> One line?
ok

>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dma-mapping.h>
>> +#include <asm/dma.h>
>
> Do you need this one explicitly?

got rid of it

>
>> +#include <linux/atomic.h>
>> +#include <linux/pm_runtime.h>
>
> + empty line?
ok
>
>> +#include <asm/div64.h>
>
> + empty line?
ok
>
>> +#include "dmaengine.h"
>> +#include "qcom_hidma.h"
>> +
>> +/* Default idle time is 2 seconds. This parameter can
>> + * be overridden by changing the following
>> + * /sys/bus/platform/devices/QCOM8061:<xy>/power/autosuspend_delay_ms
>> + * during kernel boot.
>> + */
>
ok

> Block comments usually like
> /*
>   * text
>   */
>

>> +struct hidma_chan {
>> +       bool                            paused;
>> +       bool                            allocated;
>> +       char                            name[16];
>
> So, do you need specific name? There is already one in struct dma_chan.
OK, removed.

>> +/* process completed descriptors */
>> +static void hidma_process_completed(struct hidma_dev *mdma)
>> +{
>> +       dma_cookie_t last_cookie = 0;
>> +       struct hidma_chan *mchan;
>> +       struct hidma_desc *mdesc;
>> +       struct dma_async_tx_descriptor *desc;
>> +       unsigned long irqflags;
>> +       LIST_HEAD(list);
>> +       struct dma_chan *dmach = NULL;
>> +
>> +       list_for_each_entry(dmach, &mdma->ddev.channels,
>> +                       device_node) {
>> +               mchan = to_hidma_chan(dmach);
>> +
Found a bug here now. I should have initialized the list on each 
iteration of the loop.

>> +               /* Get all completed descriptors */
>> +               spin_lock_irqsave(&mchan->lock, irqflags);
>> +               if (!list_empty(&mchan->completed))

Removed this one.

>> +                       list_splice_tail_init(&mchan->completed, &list);
>> +               spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +               if (list_empty(&list))
>> +                       continue;
>

> Redundant check. It's done in both list_for_each_entry() and
> list_splice_tail_init().

ok
>
>> +
>> +               /* Execute callbacks and run dependencies */
>> +               list_for_each_entry(mdesc, &list, node) {
>> +                       desc = &mdesc->desc;
>> +
>> +                       spin_lock_irqsave(&mchan->lock, irqflags);
>> +                       dma_cookie_complete(desc);
>> +                       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +                       if (desc->callback &&
>> +                               (hidma_ll_status(mdma->lldev, mdesc->tre_ch)
>> +                               == DMA_COMPLETE))
>> +                               desc->callback(desc->callback_param);
>> +
>> +                       last_cookie = desc->cookie;
>> +                       dma_run_dependencies(desc);
>> +               }
>> +
>> +               /* Free descriptors */
>> +               spin_lock_irqsave(&mchan->lock, irqflags);
>> +               list_splice_tail_init(&list, &mchan->free);
>> +               spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +       }
>> +}
>> +
>> +/*
>> + * Execute all queued DMA descriptors.
>> + * This function is called either on the first transfer attempt in tx_submit
>> + * or from the callback routine when one transfer is finished. It can only be
>> + * called from a single location since both of places check active list to be
>> + * empty and will immediately fill the active list while lock is held.
>> + *
>> + * Following requirements must be met while calling hidma_execute():
>> + *     a) mchan->lock is locked,
>> + *     b) mchan->active list contains multiple entries.
>> + *     c) pm protected
>> + */
>> +static int hidma_execute(struct hidma_chan *mchan)
>> +{
>> +       struct hidma_dev *mdma = mchan->dmadev;
>> +       int rc;
>> +
>> +       if (!hidma_ll_isenabled(mdma->lldev))
>> +               return -ENODEV;
>> +
>> +       /* Start the transfer */
>> +       if (!list_empty(&mchan->active))
>> +               rc = hidma_ll_start(mdma->lldev);
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Called once for each submitted descriptor.
>> + * PM is locked once for each descriptor that is currently
>> + * in execution.
>> + */
>> +static void hidma_callback(void *data)
>> +{
>> +       struct hidma_desc *mdesc = data;
>> +       struct hidma_chan *mchan = to_hidma_chan(mdesc->desc.chan);
>> +       unsigned long irqflags;
>> +       struct dma_device *ddev = mchan->chan.device;
>> +       struct hidma_dev *dmadev = to_hidma_dev(ddev);
>> +       bool queued = false;
>> +
>> +       dev_dbg(dmadev->ddev.dev, "callback: data:0x%p\n", data);
>> +
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +
>> +       if (mdesc->node.next) {
>> +               /* Delete from the active list, add to completed list */
>> +               list_move_tail(&mdesc->node, &mchan->completed);
>> +               queued = true;
>> +       }
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       hidma_process_completed(dmadev);
>> +
>> +       if (queued) {
>> +               pm_runtime_mark_last_busy(dmadev->ddev.dev);
>> +               pm_runtime_put_autosuspend(dmadev->ddev.dev);
>> +       }
>> +}
>> +
>> +static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
>> +{
>> +       struct hidma_chan *mchan;
>> +       struct dma_device *ddev;
>> +
>> +       mchan = devm_kzalloc(dmadev->ddev.dev, sizeof(*mchan), GFP_KERNEL);
>> +       if (!mchan)
>> +               return -ENOMEM;
>> +
>> +       ddev = &dmadev->ddev;
>> +       mchan->dma_sig = dma_sig;
>> +       mchan->dmadev = dmadev;
>> +       mchan->chan.device = ddev;
>> +       dma_cookie_init(&mchan->chan);
>> +
>> +       INIT_LIST_HEAD(&mchan->free);
>> +       INIT_LIST_HEAD(&mchan->prepared);
>> +       INIT_LIST_HEAD(&mchan->active);
>> +       INIT_LIST_HEAD(&mchan->completed);
>> +
>> +       spin_lock_init(&mchan->lock);
>> +       list_add_tail(&mchan->chan.device_node, &ddev->channels);
>> +       dmadev->ddev.chancnt++;
>> +       return 0;
>> +}
>> +
>> +static void hidma_issue_pending(struct dma_chan *dmach)
>> +{
>
> Wrong. It should actually start the transfer. tx_submit() just puts
> the descriptor to a queue.
>
Depends on the design.

I started from the Freescale driver (mpc512x_dma.c). It follows the same 
model.

I'll just drop the same comment into this code too.


/*
* We are posting descriptors to the hardware as soon as
* they are ready, so this function does nothing.
*/

>> +}
>> +
>> +static enum dma_status hidma_tx_status(struct dma_chan *dmach,
>> +                                       dma_cookie_t cookie,
>> +                                       struct dma_tx_state *txstate)
>> +{
>> +       enum dma_status ret;
>> +       unsigned long irqflags;
>> +       struct hidma_chan *mchan = to_hidma_chan(dmach);
>> +
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>
> So, what are you protecting here? paused member, right?

yes.

>
>> +       if (mchan->paused)
>> +               ret = DMA_PAUSED;
>> +       else
>> +               ret = dma_cookie_status(dmach, cookie, txstate);
>
> This one has no need to be under spin lock.
ok, will remove it. Apparently, other drivers are not using locks either 
in this routine.
>
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       return ret;
>> +}
>> +
>> +/*
>> + * Submit descriptor to hardware.
>> + * Lock the PM for each descriptor we are sending.
>> + */
>> +static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
>> +{
>> +       struct hidma_chan *mchan = to_hidma_chan(txd->chan);
>> +       struct hidma_dev *dmadev = mchan->dmadev;
>> +       struct hidma_desc *mdesc;
>> +       unsigned long irqflags;
>> +       dma_cookie_t cookie;
>> +
>> +       if (!hidma_ll_isenabled(dmadev->lldev))
>> +               return -ENODEV;
>> +
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>
> No point to do it here. It should be done on the function that
> actually starts the transfer (see issue pending).
>
comment above

>> +       mdesc = container_of(txd, struct hidma_desc, desc);
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +
>> +       /* Move descriptor to active */
>> +       list_move_tail(&mdesc->node, &mchan->active);
>> +
>> +       /* Update cookie */
>> +       cookie = dma_cookie_assign(txd);
>> +
>> +       hidma_ll_queue_request(dmadev->lldev, mdesc->tre_ch);
>> +       hidma_execute(mchan);
>> +
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       return cookie;
>> +}
>> +
>> +static int hidma_alloc_chan_resources(struct dma_chan *dmach)
>> +{
>> +       struct hidma_chan *mchan = to_hidma_chan(dmach);
>> +       struct hidma_dev *dmadev = mchan->dmadev;
>> +       int rc = 0;
>> +       struct hidma_desc *mdesc, *tmp;
>> +       unsigned long irqflags;
>> +       LIST_HEAD(descs);
>> +       u32 i;
>> +
>> +       if (mchan->allocated)
>> +               return 0;
>> +
>> +       /* Alloc descriptors for this channel */
>> +       for (i = 0; i < dmadev->nr_descriptors; i++) {
>> +               mdesc = kzalloc(sizeof(struct hidma_desc), GFP_KERNEL);
>> +               if (!mdesc) {
>> +                       dev_err(dmadev->ddev.dev, "Memory allocation error. ");
>> +                       rc = -ENOMEM;
>> +                       break;
>> +               }
>> +               dma_async_tx_descriptor_init(&mdesc->desc, dmach);
>> +               mdesc->desc.flags = DMA_CTRL_ACK;
>> +               mdesc->desc.tx_submit = hidma_tx_submit;
>> +
>> +               rc = hidma_ll_request(dmadev->lldev,
>> +                               mchan->dma_sig, "DMA engine", hidma_callback,
>> +                               mdesc, &mdesc->tre_ch);
>> +               if (rc != 1) {
>
> if (rc < 1) {

I'll fix hidma_ll_request instead and return 0 on success and change 
this line as if (rc)

>
>> +                       dev_err(dmach->device->dev,
>> +                               "channel alloc failed at %u\n", i);
>
>> +                       kfree(mdesc);
>> +                       break;
>> +               }
>> +               list_add_tail(&mdesc->node, &descs);
>> +       }
>> +
>> +       if (rc != 1) {
>
> if (rc < 1)

Fixed this too
>
>> +               /* return the allocated descriptors */
>> +               list_for_each_entry_safe(mdesc, tmp, &descs, node) {
>> +                       hidma_ll_free(dmadev->lldev, mdesc->tre_ch);
>> +                       kfree(mdesc);
>> +               }
>> +               return rc;
>> +       }
>> +
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +       list_splice_tail_init(&descs, &mchan->free);
>> +       mchan->allocated = true;
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +       dev_dbg(dmadev->ddev.dev,
>> +               "allocated channel for %u\n", mchan->dma_sig);
>> +       return rc;
>> +}
>> +
>> +static void hidma_free_chan_resources(struct dma_chan *dmach)
>> +{
>> +       struct hidma_chan *mchan = to_hidma_chan(dmach);
>> +       struct hidma_dev *mdma = mchan->dmadev;
>> +       struct hidma_desc *mdesc, *tmp;
>> +       unsigned long irqflags;
>> +       LIST_HEAD(descs);
>> +
>> +       if (!list_empty(&mchan->prepared) ||
>> +               !list_empty(&mchan->active) ||
>> +               !list_empty(&mchan->completed)) {
>> +               /* We have unfinished requests waiting.
>> +                * Terminate the request from the hardware.
>> +                */
>> +               hidma_cleanup_pending_tre(mdma->lldev, 0x77, 0x77);
>
> 0x77 is magic.

Changing with meaningful macros.

>
>> +
>> +               /* Give enough time for completions to be called. */
>> +               msleep(100);
>> +       }
>> +
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +       /* Channel must be idle */
>> +       WARN_ON(!list_empty(&mchan->prepared));
>> +       WARN_ON(!list_empty(&mchan->active));
>> +       WARN_ON(!list_empty(&mchan->completed));
>> +
>> +       /* Move data */
>> +       list_splice_tail_init(&mchan->free, &descs);
>> +
>> +       /* Free descriptors */
>> +       list_for_each_entry_safe(mdesc, tmp, &descs, node) {
>> +               hidma_ll_free(mdma->lldev, mdesc->tre_ch);
>> +               list_del(&mdesc->node);
>> +               kfree(mdesc);
>> +       }
>> +
>> +       mchan->allocated = 0;
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +       dev_dbg(mdma->ddev.dev, "freed channel for %u\n", mchan->dma_sig);
>> +}
>> +
>> +
>> +static struct dma_async_tx_descriptor *
>> +hidma_prep_dma_memcpy(struct dma_chan *dmach, dma_addr_t dma_dest,
>> +                       dma_addr_t dma_src, size_t len, unsigned long flags)
>> +{
>> +       struct hidma_chan *mchan = to_hidma_chan(dmach);
>> +       struct hidma_desc *mdesc = NULL;
>> +       struct hidma_dev *mdma = mchan->dmadev;
>> +       unsigned long irqflags;
>> +
>> +       dev_dbg(mdma->ddev.dev,
>> +               "memcpy: chan:%p dest:%pad src:%pad len:%zu\n", mchan,
>> +               &dma_dest, &dma_src, len);
>> +
>> +       /* Get free descriptor */
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +       if (!list_empty(&mchan->free)) {
>> +               mdesc = list_first_entry(&mchan->free, struct hidma_desc,
>> +                                       node);
>> +               list_del(&mdesc->node);
>> +       }
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       if (!mdesc)
>> +               return NULL;
>> +
>> +       hidma_ll_set_transfer_params(mdma->lldev, mdesc->tre_ch,
>> +                       dma_src, dma_dest, len, flags);
>> +
>> +       /* Place descriptor in prepared list */
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +       list_add_tail(&mdesc->node, &mchan->prepared);
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       return &mdesc->desc;
>> +}
>> +
>> +static int hidma_terminate_all(struct dma_chan *chan)
>> +{
>> +       struct hidma_dev *dmadev;
>> +       LIST_HEAD(head);
>> +       unsigned long irqflags;
>> +       LIST_HEAD(list);
>> +       struct hidma_desc *tmp, *mdesc = NULL;
>> +       int rc = 0;
>
> Useless assignment.

removed.

>
>> +       struct hidma_chan *mchan;
>> +
>> +       mchan = to_hidma_chan(chan);
>> +       dmadev = to_hidma_dev(mchan->chan.device);
>> +       dev_dbg(dmadev->ddev.dev, "terminateall: chan:0x%p\n", mchan);
>> +
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>> +       /* give completed requests a chance to finish */
>> +       hidma_process_completed(dmadev);
>> +
>> +       spin_lock_irqsave(&mchan->lock, irqflags);
>> +       list_splice_init(&mchan->active, &list);
>> +       list_splice_init(&mchan->prepared, &list);
>> +       list_splice_init(&mchan->completed, &list);
>> +       spin_unlock_irqrestore(&mchan->lock, irqflags);
>> +
>> +       /* this suspends the existing transfer */
>> +       rc = hidma_ll_pause(dmadev->lldev);
>> +       if (rc) {
>> +               dev_err(dmadev->ddev.dev, "channel did not pause\n");
>> +               goto out;
>> +       }
>> +
>> +       /* return all user requests */
>> +       list_for_each_entry_safe(mdesc, tmp, &list, node) {
>> +               struct dma_async_tx_descriptor  *txd = &mdesc->desc;
>> +               dma_async_tx_callback callback = mdesc->desc.callback;
>> +               void *param = mdesc->desc.callback_param;
>> +               enum dma_status status;
>> +
>> +               dma_descriptor_unmap(txd);
>> +
>> +               status = hidma_ll_status(dmadev->lldev, mdesc->tre_ch);
>> +               /*
>> +                * The API requires that no submissions are done from a
>> +                * callback, so we don't need to drop the lock here
>> +                */
>> +               if (callback && (status == DMA_COMPLETE))
>> +                       callback(param);
>> +
>> +               dma_run_dependencies(txd);
>> +
>> +               /* move myself to free_list */
>> +               list_move(&mdesc->node, &mchan->free);
>> +       }
>> +
>> +       /* reinitialize the hardware */
>> +       rc = hidma_ll_setup(dmadev->lldev);
>> +
>> +out:
>> +       pm_runtime_mark_last_busy(dmadev->ddev.dev);
>> +       pm_runtime_put_autosuspend(dmadev->ddev.dev);
>> +       return rc;
>> +}
>> +
>> +static int hidma_pause(struct dma_chan *chan)
>> +{
>> +       struct hidma_chan *mchan;
>> +       struct hidma_dev *dmadev;
>> +
>> +       mchan = to_hidma_chan(chan);
>> +       dmadev = to_hidma_dev(mchan->chan.device);
>> +       dev_dbg(dmadev->ddev.dev, "pause: chan:0x%p\n", mchan);
>> +
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>
> Why it's here? Here is nothing to do with the device, move it to _pause().
>

I'll move it inside the if statement. hidma_ll_pause touches the hardware.

>> +       if (!mchan->paused) {
>> +               if (hidma_ll_pause(dmadev->lldev))
>> +                       dev_warn(dmadev->ddev.dev, "channel did not stop\n");
>> +               mchan->paused = true;
>> +       }
>> +       pm_runtime_mark_last_busy(dmadev->ddev.dev);
>> +       pm_runtime_put_autosuspend(dmadev->ddev.dev);
>> +       return 0;
>> +}
>> +
>> +static int hidma_resume(struct dma_chan *chan)
>> +{
>> +       struct hidma_chan *mchan;
>> +       struct hidma_dev *dmadev;
>> +       int rc = 0;
>> +
>> +       mchan = to_hidma_chan(chan);
>> +       dmadev = to_hidma_dev(mchan->chan.device);
>> +       dev_dbg(dmadev->ddev.dev, "resume: chan:0x%p\n", mchan);
>> +
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>
> Ditto.
>

I'll do the samething as pause.

>> +       if (mchan->paused) {
>> +               rc = hidma_ll_resume(dmadev->lldev);
>> +               if (!rc)
>> +                       mchan->paused = false;
>> +               else
>> +                       dev_err(dmadev->ddev.dev,
>> +                                       "failed to resume the channel");
>> +       }
>> +       pm_runtime_mark_last_busy(dmadev->ddev.dev);
>> +       pm_runtime_put_autosuspend(dmadev->ddev.dev);
>> +       return rc;
>> +}
>> +
>> +static irqreturn_t hidma_chirq_handler(int chirq, void *arg)
>> +{
>> +       struct hidma_lldev **lldev_ptr = arg;
>> +       irqreturn_t ret;
>> +       struct hidma_dev *dmadev = to_hidma_dev_from_lldev(lldev_ptr);
>> +
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>
> Hmm... Do you have shared IRQ line or wakeup able one?
> Otherwise I can't see ways how device can generate interrupts.
> If there is a case other than described, put comment why it might happen.
>

All interrupts are request driven. HW doesn't send an interrupt by 
itself. I'll put some comment in the code.

>> +       ret = hidma_ll_inthandler(chirq, *lldev_ptr);
>> +       pm_runtime_mark_last_busy(dmadev->ddev.dev);
>> +       pm_runtime_put_autosuspend(dmadev->ddev.dev);
>> +       return ret;
>> +}
>> +
>> +static int hidma_probe(struct platform_device *pdev)
>> +{
>> +       struct hidma_dev *dmadev;
>> +       int rc = 0;
>> +       struct resource *trca_resource;
>> +       struct resource *evca_resource;
>> +       int chirq;
>> +       int current_channel_index = atomic_read(&channel_ref_count);
>> +
>> +       pm_runtime_set_autosuspend_delay(&pdev->dev, AUTOSUSPEND_TIMEOUT);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>> +       pm_runtime_set_active(&pdev->dev);
>> +       pm_runtime_enable(&pdev->dev);
>> +
>> +       trca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!trca_resource) {
>> +               rc = -ENODEV;
>> +               goto bailout;
>> +       }
>> +
>> +       evca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +       if (!evca_resource) {
>> +               rc = -ENODEV;
>> +               goto bailout;
>> +       }
>
>
> Consolidate these with devm_ioremap_resource();
>

ok

>> +
>> +       /* This driver only handles the channel IRQs.
>> +        * Common IRQ is handled by the management driver.
>> +        */
>> +       chirq = platform_get_irq(pdev, 0);
>> +       if (chirq < 0) {
>> +               rc = -ENODEV;
>> +               goto bailout;
>> +       }
>> +
>> +       dmadev = devm_kzalloc(&pdev->dev, sizeof(*dmadev), GFP_KERNEL);
>> +       if (!dmadev) {
>> +               rc = -ENOMEM;
>> +               goto bailout;
>> +       }
>> +
>> +       INIT_LIST_HEAD(&dmadev->ddev.channels);
>> +       spin_lock_init(&dmadev->lock);
>> +       dmadev->ddev.dev = &pdev->dev;
>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>> +
>> +       dma_cap_set(DMA_MEMCPY, dmadev->ddev.cap_mask);
>> +       if (WARN_ON(!pdev->dev.dma_mask)) {
>> +               rc = -ENXIO;
>> +               goto dmafree;
>> +       }
>> +
>> +       dmadev->dev_evca = devm_ioremap_resource(&pdev->dev,
>> +                                               evca_resource);
>> +       if (IS_ERR(dmadev->dev_evca)) {
>> +               rc = -ENOMEM;
>> +               goto dmafree;
>> +       }
>> +
>> +       dmadev->dev_trca = devm_ioremap_resource(&pdev->dev,
>> +                                               trca_resource);
>> +       if (IS_ERR(dmadev->dev_trca)) {
>> +               rc = -ENOMEM;
>> +               goto dmafree;
>> +       }
>> +       dmadev->ddev.device_prep_dma_memcpy = hidma_prep_dma_memcpy;
>> +       dmadev->ddev.device_alloc_chan_resources =
>> +               hidma_alloc_chan_resources;
>> +       dmadev->ddev.device_free_chan_resources = hidma_free_chan_resources;
>> +       dmadev->ddev.device_tx_status = hidma_tx_status;
>> +       dmadev->ddev.device_issue_pending = hidma_issue_pending;
>> +       dmadev->ddev.device_pause = hidma_pause;
>> +       dmadev->ddev.device_resume = hidma_resume;
>> +       dmadev->ddev.device_terminate_all = hidma_terminate_all;
>> +       dmadev->ddev.copy_align = 8;
>> +
>> +       device_property_read_u32(&pdev->dev, "desc-count",
>> +                               &dmadev->nr_descriptors);
>> +
>> +       if (!dmadev->nr_descriptors && nr_desc_prm)
>> +               dmadev->nr_descriptors = nr_desc_prm;
>> +
>> +       if (!dmadev->nr_descriptors)
>> +               goto dmafree;
>> +
>> +       if (current_channel_index > MAX_HIDMA_CHANNELS)
>> +               goto dmafree;
>> +
>> +       dmadev->evridx = -1;
>> +       device_property_read_u32(&pdev->dev, "event-channel", &dmadev->evridx);
>> +
>> +       /* kernel command line override for the guest machine */
>> +       if (event_channel_idx[current_channel_index] != -1)
>> +               dmadev->evridx = event_channel_idx[current_channel_index];
>> +
>> +       if (dmadev->evridx == -1)
>> +               goto dmafree;
>> +
>> +       /* Set DMA mask to 64 bits. */
>> +       rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>> +       if (rc) {
>> +               dev_warn(&pdev->dev, "unable to set coherent mask to 64");
>> +               rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +       }
>> +       if (rc)
>> +               goto dmafree;
>> +
>> +       dmadev->lldev = hidma_ll_init(dmadev->ddev.dev,
>> +                               dmadev->nr_descriptors, dmadev->dev_trca,
>> +                               dmadev->dev_evca, dmadev->evridx);
>> +       if (!dmadev->lldev) {
>> +               rc = -EPROBE_DEFER;
>> +               goto dmafree;
>> +       }
>> +
>> +       rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler, 0,
>> +                             "qcom-hidma", &dmadev->lldev);
>
> Better to use request_irq().
>

why? I thought we favored managed functions over standalone functions in 
simplify the exit path.

>> +       if (rc)
>> +               goto uninit;
>> +
>> +       INIT_LIST_HEAD(&dmadev->ddev.channels);
>> +       rc = hidma_chan_init(dmadev, 0);
>> +       if (rc)
>> +               goto uninit;
>> +
>> +       rc = dma_selftest_memcpy(&dmadev->ddev);

Thanks for the review.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
