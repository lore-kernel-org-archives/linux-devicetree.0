From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH 04/49] ath11k: add ahb.c
Date: Wed, 21 Aug 2019 11:40:25 +0200
Message-ID: <e0cbf7b86b275f87c0a69bd9a31e5b9fa8691d3a.camel@sipsolutions.net>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
         <1566316095-27507-5-git-send-email-kvalo@codeaurora.org>
         (sfid-20190820_175156_108502_D7159DB2) <8c791df54a831f32fddd634e71e5e91342532535.camel@sipsolutions.net>
         <e53ddcaa11d069fbe9d083b9b0105d19@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e53ddcaa11d069fbe9d083b9b0105d19-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-21 at 14:59 +0530, Vasanthakumar Thiagarajan wrote:

> > > +#define ATH11K_TX_RING_MASK_3 0x0
> > 
> > You have a LOT of masks here that are 0, that seems odd?
> 
> We'll remove them.

I'm not sure you should just *remove* them, that might very well be
valid and what you need here, I'm just saying it looks odd since you
usually expect masks to, well, not really mask *everything*?

> > > +inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
> > > +{
> > > +	return ioread32(ab->mem + offset);
> > > +}
> > > +
> > > +inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, 
> > > u32 value)
> > > +{
> > > +	iowrite32(value, ab->mem + offset);
> > > +}
> > 
> > Just "inline" doesn't seem to make that much sense? If it's only used
> > here then I guess it should be static, otherwise not inline? Or maybe
> > you want it to be inlined *in this file* but available out-of-line
> > otherwise? I'm not sure that actually is guaranteed to work right in C?
> 
> Yes, these read/write functions are used from other files as well. May 
> be define them as static inline in ahb.c will be fine.

No, if they're static they cannot be used from other files, but if
they're declared and used elsewhere they can't really be inline ...

You could declare them static inline in ahb.h I guess, instead.

johannes
