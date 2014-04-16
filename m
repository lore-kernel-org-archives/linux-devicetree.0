From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: EXYNOS5420: Add IO mapping for non-secure SYSRAM
Date: Thu, 17 Apr 2014 00:40:53 +0530
Message-ID: <CAM4voakCOLSATeG1CX__cwNNW_mMcdjNh0EVtqim61v2JSp7rQ@mail.gmail.com>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
	<11327275.EJLfDGG21r@wuerfel>
	<20140414115910.GD3844@e103592.cambridge.arm.com>
	<5167415.PAy87EVlKC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5167415.PAy87EVlKC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nicolas.pitre" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "will.deacon" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "grant.likely" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dave and Arnd,

On Mon, Apr 14, 2014 at 6:54 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 14 April 2014 12:59:11 Dave Martin wrote:
>> On Mon, Apr 14, 2014 at 01:47:56PM +0200, Arnd Bergmann wrote:
>> > On Monday 14 April 2014 12:25:20 Dave Martin wrote:
>> > > Arnd, what was your preferred solution?  Should this be described in DT?
>> >
>> > Yes. There are already patches on the list to do this right.
>>
>> This is http://www.spinics.net/lists/linux-samsung-soc/msg27647.html,
>> right?
>>
>> If so, it looks like exynos5420 should definitely follow the same
>> approach.
>>
>
> Yes, exactly.

I'll make use of the SYSRAM dt patch in my next patchset.
>
>         Arnd
Regards,
Abhilash
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
