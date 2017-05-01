From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: undeclared variable when CONFIG_DEBUG_LOCK_ALLOC
Date: Mon, 1 May 2017 15:23:22 -0700
Message-ID: <5907B55A.1080803@gmail.com>
References: <1493582403-12291-1-git-send-email-frank.rowand@sony.com>
 <CAL_JsqKMB4exBFTDNFAio87JeOF0sXjMBkueizgfoiG38Mb_8A@mail.gmail.com>
 <ED290C750E1B324E972B0017C9D4BAB01FDD5370@USCULXMSG01.am.sony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ED290C750E1B324E972B0017C9D4BAB01FDD5370-t8YLG9SB9XQEb75RT/aEbJZPSYnAH24X@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rowand, Frank" <Frank.Rowand-7U/KSKJipcs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/01/17 14:20, Rowand, Frank wrote:
> On Monday, May 01, 2017 1:13 PM, Rob Herring [mailto:robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]  wrote:
>>
>> On Sun, Apr 30, 2017 at 3:00 PM, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> wrote:
>>> An undeclared variable was used in a macro that evaluates to nothing
>>> when CONFIG_DEBUG_LOCK_ALLOC is not defined.  Change to use the correct
>>> variable that does exist.
>>>
>>> ---
>>>
>>> reported by kbuild test robot on on robh/for-next
>>>    https://lkml.org/lkml/2017/4/29/134
>>
>> That's a bit misleading because I've not applied the offending patch.
>> Please squash this.
>>
>> Rob
> 
> Does "squash this" mean to redo the original path to include this fix?

                                               ^^^^  patch

> 
> Thanks,
> 
> Frank
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
