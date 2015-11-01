From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Sun, 1 Nov 2015 13:50:53 -0500
Message-ID: <56365F0D.6010508@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <5741892.rRLhcI7KQG@wuerfel> <5633E442.3010003@codeaurora.org>
 <4552697.VhjWnxQoIo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4552697.VhjWnxQoIo@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


>>
>>> Also, if you waste CPU cycles for hundreds of milliseconds, it's unlikely
>>> that the function is so performance critical that it requires writel_relaxed().
>>>
>>> Just use writel() here.
ok, replaced writel_relaxed+wmb with writel.

>>
>> The issue is not writel_relaxed vs. writel. After I issue reset, I need
>> wait for some time to confirm reset was done. I can use readl_polling
>> instead of mdelay if we don't like mdelay.
>
> I meant that both _relaxed() and mdelay() are probably wrong here.

You are right about redundant writel_relaxed + wmb. They are effectively 
equal to writel.

However, after issuing the command; I still need to wait some amount of 
time until hardware acknowledges the commands like reset/enable/disable. 
These are relatively faster operations happening in microseconds. That's 
why, I have mdelay there.

I'll take a look at workqueues but it could turn out to be an overkill 
for few microseconds.

>
> readl_polling() would avoid the part with _relaxed(), but if that can
> still take more than a few microseconds, you should try to sleep inbetween
> rather than burn CPU cycles.
>
>>>> +/*
>>>> + * The interrupt handler for HIDMA will try to consume as many pending
>>>> + * EVRE from the event queue as possible. Each EVRE has an associated
>>>> + * TRE that holds the user interface parameters. EVRE reports the
>>>> + * result of the transaction. Hardware guarantees ordering between EVREs
>>>> + * and TREs. We use last processed offset to figure out which TRE is
>>>> + * associated with which EVRE. If two TREs are consumed by HW, the EVREs
>>>> + * are in order in the event ring.
>>>> + * This handler will do a one pass for consuming EVREs. Other EVREs may
>>>> + * be delivered while we are working. It will try to consume incoming
>>>> + * EVREs one more time and return.
>>>> + * For unprocessed EVREs, hardware will trigger another interrupt until
>>>> + * all the interrupt bits are cleared.
>>>> + */
>>>> +static void hidma_ll_int_handler_internal(struct hidma_lldev *lldev)
>>>> +{
>>>> +	u32 status;
>>>> +	u32 enable;
>>>> +	u32 cause;
>>>> +	int repeat = 2;
>>>> +	unsigned long timeout;
>>>> +
>>>> +	status = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
>>>> +	enable = readl_relaxed(lldev->evca + EVCA_IRQ_EN_OFFSET);
>>>> +	cause = status & enable;
>>>> +
>>>
>>> Reading the status probably requires a readl() rather than readl_relaxed()
>>> to guarantee that the DMA data has arrived in memory by the time that the
>>> register data is seen by the CPU. If using readl_relaxed() here is a valid
>>> and required optimization, please add a comment to explain why it works
>>> and how much you gain.
>>
>> I will add some description. This is a high speed peripheral. I don't
>> like spreading barriers as candies inside the readl and writel unless I
>> have to.
>>
>> According to the barriers video, I watched on youtube this should be the
>> rule for ordering.
>>
>> "if you do two relaxed reads and check the results of the returned
>> variables, ARM architecture guarantees that these two relaxed variables
>> will get observed during the check."
>>
>> this is called implied ordering or something of that sort.
>
> My point was a bit different: while it is guaranteed that the
> result of the readl_relaxed() is observed in order, they do not
> guarantee that a DMA from device to memory that was started by
> the device before the readl_relaxed() has arrived in memory
> by the time that the readl_relaxed() result is visible to the
> CPU and it starts accessing the memory.
>
I checked with the hardware designers. Hardware guarantees that by the 
time interrupt is observed, all data transactions in flight are 
delivered to their respective places and are visible to the CPU. I'll 
add a comment in the code about this.

> In other words, when the hardware sends you data followed by an
> interrupt to tell you the data is there, your interrupt handler
> can tell the driver that is waiting for this data that the DMA
> is complete while the data itself is still in flight, e.g. waiting
> for an IOMMU to fetch page table entries.
>
There is HW guarantee for ordering.

On demand paging for IOMMU is only supported for PCIe via PRI (Page 
Request Interface) not for HIDMA. All other hardware instances work on 
pinned DMA addresses. I'll drop a note about this too to the code as well.


>>>> +	wmb();
>>>> +
>>>> +	mdelay(1);
>>>
>>> Another workqueue? You should basically never call mdelay().
>>
>> I'll use polled read instead.
>
> Ok, but again make sure that you call msleep() or usleep_range()
> between the reads.
>
>>>> +static int hidma_ll_hw_start(void *llhndl)
>>>> +{
>>>> +	int rc = 0;
>>>> +	struct hidma_lldev *lldev = llhndl;
>>>> +	unsigned long irqflags;
>>>> +
>>>> +	spin_lock_irqsave(&lldev->lock, irqflags);
>>>> +	writel_relaxed(lldev->tre_write_offset,
>>>> +			lldev->trca + TRCA_DOORBELL_OFFSET);
>>>> +	spin_unlock_irqrestore(&lldev->lock, irqflags);
>>>
>>> How does this work? The writel_relaxed() won't synchronize with either
>>> the DMA data or the spinlock.
>>
>> mutex and spinlocks have barriers inside. See the youtube video.
>>
>> https://www.youtube.com/watch?v=6ORn6_35kKo
>
> I'm pretty sure these barriers only make sense to the CPU, so the
> spinlock guarantees that the access to lldev->tre_write_offset is
> protected, but not the access to lldev->trca, because that write
> is posted on the bus and might not complete until after the
> unlock. There is no "dsb(st)" in here:
>
> static inline void arch_spin_unlock(arch_spinlock_t *lock)
> {
>          unsigned long tmp;
>
>          asm volatile(ARM64_LSE_ATOMIC_INSN(
>          /* LL/SC */
>          "       ldrh    %w1, %0\n"
>          "       add     %w1, %w1, #1\n"
>          "       stlrh   %w1, %0",
>          /* LSE atomics */
>          "       mov     %w1, #1\n"
>          "       nop\n"
>          "       staddlh %w1, %0")
>          : "=Q" (lock->owner), "=&r" (tmp)
>          :
>          : "memory");
> }
>
ok. I'm changing it to readl. Thanks for the insight.

>>>
>>> Also, your abstraction seem to go a little too far if the upper driver
>>> doesn't know what the lower driver calls its main device structure.
>>>
>>> Or you can go further and just embed the struct hidma_lldev within the
>>> struct hidma_dev to save one?
>>
>> That's how it was before. It got too complex and variables/spinlocks got
>> intermixed. I borrowed the upper layer and it worked as it is. I rather
>> keep all hardware stuff in another file and do not mix and match for safety.
>
> Ok, then just use a forward declaration for the struct name so you can
> have a type-safe pointer but don't need to show the members.
>
>>>> +void hidma_ll_chstats(struct seq_file *s, void *llhndl, u32 tre_ch)
>>>> +{
>>>> +	struct hidma_lldev *lldev = llhndl;
>>>> +	struct hidma_tre *tre;
>>>> +	u32 length;
>>>> +	dma_addr_t src_start;
>>>> +	dma_addr_t dest_start;
>>>> +	u32 *tre_local;
>>>> +
>>>> +	if (unlikely(tre_ch >= lldev->nr_tres)) {
>>>> +		dev_err(lldev->dev, "invalid TRE number in chstats:%d",
>>>> +			tre_ch);
>>>> +		return;
>>>> +	}
>>>> +	tre = &lldev->trepool[tre_ch];
>>>> +	seq_printf(s, "------Channel %d -----\n", tre_ch);
>>>> +	seq_printf(s, "allocated=%d\n", atomic_read(&tre->allocated));
>>>> +	HIDMA_CHAN_SHOW(tre, queued);
>>>> +	seq_printf(s, "err_info=0x%x\n",
>>>> +		   lldev->tx_status_list[tre->chidx].err_info);
>>>> +	seq_printf(s, "err_code=0x%x\n",
>>>> +		   lldev->tx_status_list[tre->chidx].err_code);
>>>> +	HIDMA_CHAN_SHOW(tre, status);
>>>> +	HIDMA_CHAN_SHOW(tre, chidx);
>>>> +	HIDMA_CHAN_SHOW(tre, dma_sig);
>>>> +	seq_printf(s, "dev_name=%s\n", tre->dev_name);
>>>> +	seq_printf(s, "callback=%p\n", tre->callback);
>>>> +	seq_printf(s, "data=%p\n", tre->data);
>>>> +	HIDMA_CHAN_SHOW(tre, tre_index);
>>>> +
>>>> +	tre_local = &tre->tre_local[0];
>>>> +	src_start = tre_local[TRE_SRC_LOW_IDX];
>>>> +	src_start = ((u64)(tre_local[TRE_SRC_HI_IDX]) << 32) + src_start;
>>>> +	dest_start = tre_local[TRE_DEST_LOW_IDX];
>>>> +	dest_start += ((u64)(tre_local[TRE_DEST_HI_IDX]) << 32);
>>>> +	length = tre_local[TRE_LEN_IDX];
>>>> +
>>>> +	seq_printf(s, "src=%pap\n", &src_start);
>>>> +	seq_printf(s, "dest=%pap\n", &dest_start);
>>>> +	seq_printf(s, "length=0x%x\n", length);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(hidma_ll_chstats);
>>>
>>> Remove all the pointers here. I guess you can remove the entire debugfs
>>> file really ;-)
>>
>> ok, I need some facility to print out stuff when problems happened.
>> Would you rather use sysfs?
>
> sysfs would be less appropriate, as that requires providing a stable ABI
> for user space. I think ftrace should provide what you need. Let me know
> if that doesn't work out.
>
> 	Arnd
>

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
