From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: hikey: Add pstore support for HiKey
Date: Fri, 9 Sep 2016 09:31:37 +0100
Message-ID: <57D27369.3010508@hisilicon.com>
References: <1471906085-16682-1-git-send-email-john.stultz@linaro.org>
 <1471906085-16682-4-git-send-email-john.stultz@linaro.org>
 <CAGXu5jJjEchF8MxE5vhLEj9wy1NcibLR88YptGm3uG79DD-sxA@mail.gmail.com>
 <CALAqxLVU5kusY=PyQrBX8mZRRcLN08Lzrs6XUKUUVd3fb3VBkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALAqxLVU5kusY=PyQrBX8mZRRcLN08Lzrs6XUKUUVd3fb3VBkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kess and John,

On 09/09/2016 01:17, John Stultz wrote:
> On Thu, Sep 8, 2016 at 5:12 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> On Mon, Aug 22, 2016 at 3:48 PM, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> This patch reserves some memory in the DTS and sets up a
>>> pstore device tree node to enable pstore support on HiKey.
>>>
>>> Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Reviewed-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> I'm going through old emails -- did this get picked up by anyone? I
>> don't see an "applied" reply or similar, though I could have easily
>> missed it. :)
> 
> Wei said he picked up the set, but it hasn't shown up in -next yet, as
> his tree isn't automatically pulled in apparently.

I have picked up this series and sent the pull request as [1].
Thanks for your interesting!

[1] http://www.spinics.net/lists/arm-kernel/msg528380.html

Best Regards,
Wei

> 
> thanks
> -john
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
