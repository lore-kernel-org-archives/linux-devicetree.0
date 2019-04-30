From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] of: replace be32_to_cpu to be32_to_cpup
Date: Tue, 30 Apr 2019 02:37:49 -0700
Message-ID: <20190430093749.GA29126@archlinux-i9>
References: <20190430090044.16345-1-tranmanphong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430090044.16345-1-tranmanphong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phong Tran <tranmanphong@gmail.com>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, pantelis.antoniou@konsulko.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com
List-Id: devicetree@vger.kernel.org

+ Nick and the list

On Tue, Apr 30, 2019 at 04:00:44PM +0700, Phong Tran wrote:
> The cell is a pointer to __be32.
> with the be32_to_cpu a lot of clang warning show that:
> 
> ./include/linux/of.h:238:37: warning: multiple unsequenced modifications
> to 'cell' [-Wunsequenced]
>                 r = (r << 32) | be32_to_cpu(*(cell++));
>                                                   ^~
> ./include/linux/byteorder/generic.h:95:21: note: expanded from macro
> 'be32_to_cpu'
>                     ^
> ./include/uapi/linux/byteorder/little_endian.h:40:59: note: expanded
> from macro '__be32_to_cpu'
>                                                           ^
> ./include/uapi/linux/swab.h:118:21: note: expanded from macro '__swab32'
>         ___constant_swab32(x) :                 \
>                            ^
> ./include/uapi/linux/swab.h:18:12: note: expanded from macro
> '___constant_swab32'
>         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
>                   ^
> 
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  include/linux/of.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
>  }
>  
> -- 
> 2.21.0
> 

While the patch does remove the warning, I am not convinced that this
isn't a clang bug based on my brief analysis here:

https://github.com/ClangBuiltLinux/linux/issues/460#issuecomment-487808008

However, I'm waiting for people smarter than I am to comment on whether
that sounds correct or not.

I am not familiar with the various different big/little endian functions
enough to review this but thank you for the patch!

Nathan
