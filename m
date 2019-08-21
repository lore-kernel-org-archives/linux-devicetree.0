From: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 04/49] ath11k: add ahb.c
Date: Wed, 21 Aug 2019 14:59:33 +0530
Message-ID: <e53ddcaa11d069fbe9d083b9b0105d19@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-5-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_175156_108502_D7159DB2)
 <8c791df54a831f32fddd634e71e5e91342532535.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c791df54a831f32fddd634e71e5e91342532535.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2019-08-21 01:35, Johannes Berg wrote:

Thanks for the comments!

> On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:
>> 
>> +static const struct service_to_pipe target_service_to_ce_map_wlan[] = 
>> {
>> +	{
>> +		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
>> +		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
>> +		__cpu_to_le32(3),
>> +	},
> 
> this might be nicer as C99 initializers as well? It's a struct of some
> sort, after all.

Sure.

> 
>> +	{ /* must be last */
>> +		__cpu_to_le32(0),
>> +		__cpu_to_le32(0),
>> +		__cpu_to_le32(0),
>> +	},
> 
> You don't need endian conversion for 0, even sparse will not complain,
> but I'd argue it should anyway be something like
> 
> 	{ /* terminator entry */ }
> 
> since that's why it's there I guess?

Ok.

> 
>> +#define ATH11K_TX_RING_MASK_3 0x0
> 
> You have a LOT of masks here that are 0, that seems odd?

We'll remove them.

> 
>> +/* enum ext_irq_num - irq nubers that can be used by external modules
> 
> typo ("numbers")
> 
>> +inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
>> +{
>> +	return ioread32(ab->mem + offset);
>> +}
>> +
>> +inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, 
>> u32 value)
>> +{
>> +	iowrite32(value, ab->mem + offset);
>> +}
> 
> Just "inline" doesn't seem to make that much sense? If it's only used
> here then I guess it should be static, otherwise not inline? Or maybe
> you want it to be inlined *in this file* but available out-of-line
> otherwise? I'm not sure that actually is guaranteed to work right in C?

Yes, these read/write functions are used from other files as well. May 
be define
them as static inline in ahb.c will be fine.

> 
>> +		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
>> +		val |= BIT(ce_id);
>> +		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
> 
> You could perhaps benefit from ath11k_ahb_setbit32() or something like
> that, this repeats a few times?
> 
>> +	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
>> +		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
>> +		val &= ~BIT(ce_id);
>> +		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
> 
> and clearbit32() maybe. Dunno, I saw only 3 instances of each here I
> guess, but still, feels repetitive.

Sure.

> 
>> +int ath11k_ahb_start(struct ath11k_base *ab)
>> +{
>> +	ath11k_ahb_ce_irqs_enable(ab);
>> +	ath11k_ce_rx_post_buf(ab);
>> +
>> +	/* Bring up other components as appropriate */
> 
> Hmm. What would be appropriate? It's not really doing anything else?

These comments added during development not to miss anything during
bring up. Now it is not really needed, we'll remove them.

> 
>> +void ath11k_ahb_stop(struct ath11k_base *ab)
>> +{
>> +	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
>> +		ath11k_ahb_ce_irqs_disable(ab);
>> +	ath11k_ahb_sync_ce_irqs(ab);
>> +	ath11k_ahb_kill_tasklets(ab);
>> +	del_timer_sync(&ab->rx_replenish_retry);
>> +	ath11k_ce_cleanup_pipes(ab);
>> +	/* Shutdown other components as appropriate */
> 
> likewise, it's not doing anything else?
> 

Sure. Thanks.

Vasanth
