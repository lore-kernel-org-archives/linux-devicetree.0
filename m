From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] of: replace be32_to_cpu to be32_to_cpup
Date: Tue, 30 Apr 2019 06:32:31 -0700
Message-ID: <20190430133231.GA5646@infradead.org>
References: <20190430090044.16345-1-tranmanphong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430090044.16345-1-tranmanphong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phong Tran <tranmanphong@gmail.com>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, pantelis.antoniou@konsulko.com, natechancellor@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 04:00:44PM +0700, Phong Tran wrote:
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index e240992e5cb6..1c35fc8f19b0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -235,7 +235,7 @@ static inline u64 of_read_number(const __be32 *cell, int size)
>  {
>  	u64 r = 0;
>  	while (size--)
> -		r = (r << 32) | be32_to_cpu(*(cell++));
> +		r = (r << 32) | be32_to_cpup(cell++);
>  	return r;

This whole function looks odd.  It could simply be replaced with
calls to get_unaligned_be64 / get_unaligned_be32.  Given that we have a
lot of callers we can't easily do that, but at least we could try
something like

static inline u64 of_read_number(const __be32 *cell, int size)
{
	WARN_ON_ONCE(size < 1);
	WARN_ON_ONCE(size > 2);

	if (size == 1)
		return get_unaligned_be32(cell);
	return get_unaligned_be64(cell);
}
