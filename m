From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH 06/49] ath11k: add ce.c
Date: Tue, 20 Aug 2019 22:23:32 +0200
Message-ID: <54d8d4600d53bac855b19a26fa744ed16be09bf0.camel@sipsolutions.net>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
         <1566316095-27507-7-git-send-email-kvalo@codeaurora.org>
         (sfid-20190820_175153_878417_8C2C389B)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-7-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (sfid-20190820_175153_878417_8C2C389B)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:
> +static const struct ce_attr host_ce_config_wlan[] = {
> +	/* CE0: host->target HTC control and raw streams */
> +	{
> +		.flags = CE_ATTR_FLAGS,
> +		.src_nentries = 16,
> +		.src_sz_max = 2048,
> +		.dest_nentries = 0,
> +	},
> 
Curious - this looks a lot like a similar thing in AHB, but there you
did it all in little endian? Totally different really, just looks
similar, or what's the reason?

> +	ring->skb[write_index] = skb;
> +	write_index = CE_RING_IDX_INCR(nentries_mask, write_index);
> +	ring->write_index = write_index;
> +
> +	ath11k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);
> +
> +	pipe->rx_buf_needed--;
> +
> +	return 0;
> +
> +err:
> +	ath11k_hal_srng_access_end(ab, srng);
> +
> +	spin_unlock_bh(&srng->lock);

Seems like you could unify those unlock paths, the rx_buf_needed-- can
almost certainly be before the access_end/unlock, and then just set
ret=0?

> +static int ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe,
> +					 struct sk_buff **skb)

Personally, I'd have preferred to have the *skb as the return value, and
use ERR_PTR()/IS_ERR() etc. to encode the error values, rather than the
double pointer.

> +{
> +	struct ath11k_base *ab = pipe->ab;
> +	struct hal_srng *srng;
> +	unsigned int sw_index;
> +	unsigned int nentries_mask;
> +	u32 *desc;
> +	int ret = 0;

Maybe don't initialize that to a success value, just for robustness? You
don't actually need to initialize it at all though if you set ret=0 when
you actually succeed, which might be even nicer given that the function
is simple enough for the compiler to figure out if you used 'ret'
uninitialized or not.

> +static struct ath11k_ce_ring *
> +ath11k_ce_alloc_ring(struct ath11k_base *ab, int nentries, int desc_sz)
> +{
> +	struct ath11k_ce_ring *ce_ring;
> +	dma_addr_t base_addr;
> +
> +	ce_ring = kzalloc(sizeof(*ce_ring) + (nentries * sizeof(*ce_ring->skb)),
> +			  GFP_KERNEL);

You should probably use struct_size().

johannes
