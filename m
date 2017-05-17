From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts: check.c fix compile error
Date: Wed, 17 May 2017 11:39:52 -0500
Message-ID: <CAL_Jsq+z1faqAQEEEyVV9mEgu1T_MLak3zCyOPe-DQ0vKXYuHQ@mail.gmail.com>
References: <20170515191010.4878-1-shuahkh@osg.samsung.com>
 <CAL_Jsq+K8wN_OjoePoZCd-xXcAKfO22sBLj6SjoEqxZ+aDwyOg@mail.gmail.com> <8976ed27-296b-e0ba-8164-7271204eaee7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8976ed27-296b-e0ba-8164-7271204eaee7-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 10:39 AM, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
> On 05/16/2017 06:52 AM, Rob Herring wrote:
>> On Mon, May 15, 2017 at 2:10 PM, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
>>> Fix the following compile error:
>>
>> On what host? 32-bit I guess.
>
> Saw this on Odroid-xu4.
>
>>
>> I'll take this, but can you also send this to upstream dtc and
>> devicetree-compiler list. Normally, dtc is just an import.
>
> Yes. I found this on upstream dtc build last week and git the patch
> ready to send. Then, I noticed that it showed up in 4.12-rc1 with the
> dtc import. I have the patch ready to go for upstream dtc. Will send
> it shortly.

I've cherry-picked the version from dtc and applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
