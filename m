From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Tue, 09 Jun 2015 22:31:07 +0200
Message-ID: <16ebb290641f700f2262527f90ff1e46@agner.ch>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
 <20150603130825.GA23991@breakpoint.cc>
 <b3b09b4b8c97cbfc88fa0d5fdc5e40cd@agner.ch>
 <20150609200751.GC5720@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150609200751.GC5720-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-06-09 22:07, Sebastian Andrzej Siewior wrote:
> On 2015-06-03 17:05:16 [+0200], Stefan Agner wrote:
>> As Boris guessed correctly, the reason I used the raw variant was due to
>> performance improvements due to the barrier. However, I will use
> 
> yeah, do you have any numbers by chance?

Not current ones for Linux. I added this in the U-Boot variant of the
driver.
 
>> {read|write}l_relaxed instead, which should offer endian abstraction
>> while not having the performance penalty due to extensive barriers...
> 
> well, even those
> |$ git grep readl_relaxed arch/powerpc/
> |arch/powerpc/include/asm/io.h:#define readl_relaxed(addr) readl(addr)
> 
> have the endian swap. So an abstraction like you provided earlier
> would be nice :)

What do you mean by that?

Btw, I sent v5 of the patchset which use the relaxed variants. As
expected, performance did not suffer by that change on ARM.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
