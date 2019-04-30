From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] of: replace be32_to_cpu to be32_to_cpup
Date: Tue, 30 Apr 2019 10:52:13 +0000
Message-ID: <46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com>
References: <20190430090044.16345-1-tranmanphong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430090044.16345-1-tranmanphong@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Phong Tran' <tranmanphong@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>
Cc: "natechancellor@gmail.com" <natechancellor@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Phong Tran
> Sent: 30 April 2019 10:01
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

That is a very strange loop.
It is probably equivalent to:
	r = be32_to_cpu(*cell);
	if (size)
		r = r << 32 | be32_to_cpu(cell[1]);
	return r;

In any case replacing the while with (say):
	for (; size--; cell++)
		r = (r << 32) | be32_to_cpu(*cell);
would remove the ambiguity.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
