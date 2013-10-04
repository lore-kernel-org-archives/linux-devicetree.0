From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Fri, 04 Oct 2013 13:29:41 -0400 (EDT)
Message-ID: <20131004.132941.1017308214868848075.davem@davemloft.net>
References: <CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw@mail.gmail.com>
	<20131003.172451.54508059414505899.davem@davemloft.net>
	<CACxGe6u+L1JBg+1XAmLtxC+CdW1Uo39r8=czQxij0bPai6XO-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6u+L1JBg+1XAmLtxC+CdW1Uo39r8=czQxij0bPai6XO-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Fri, 4 Oct 2013 11:27:48 +0100

> On Thu, Oct 3, 2013 at 10:24 PM, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:
>>
>> Can people on powerpc/arm/etc. give this a spin?  This works on my
>> T4-2 sparc64 box.
> 
> The code looks fine. I'll give it a spin on ARM. I'm assuming that
> this can wait for v3.13 if I commit the fix to suppress the warning,
> correct?

I'd rather a new piece of generic code be implemented properly.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
