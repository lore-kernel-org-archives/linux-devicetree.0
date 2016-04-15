From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: uniphier: change release address of spin-table
Date: Fri, 15 Apr 2016 22:13:55 +0900
Message-ID: <CAK7LNARNUMkD79h-uG_EhRFr4gE2pDM8w57EddOMbt-mO0xc8A@mail.gmail.com>
References: <1460716247-28049-1-git-send-email-yamada.masahiro@socionext.com>
	<1460716247-28049-3-git-send-email-yamada.masahiro@socionext.com>
	<20160415130549.GB8021@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160415130549.GB8021@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark.

2016-04-15 22:05 GMT+09:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Fri, Apr 15, 2016 at 07:30:47PM +0900, Masahiro Yamada wrote:
>> The 8-byte register located at 0x59801200 on this SoC is dedicated
>> for waking up secondary CPUs.  We can use it and save normal memory.
>
> Generally, it is not safe to use MMIO registers to back spin-table. The
> kernel maps the spin table location with cacheable attributes, so there
> may be speculative accesses to any registes in the same (64K) page, and
> a writeback may be larger than the 8-byte register width (which the
> device might not accept, triggering an SError).
>
> Given that, I do not think this is a good idea.

I did not know this.  Thanks for your advice!


Arnd, Olof

Please drop this patch.
(I think 1/2 is still OK.)



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
