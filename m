From: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Mon, 6 Apr 2015 19:31:16 +0300
Message-ID: <CAK=WgbYwk=DEgNFKn11BHpS=V_m=6Okf=i7w5NkLHwu8ryMaJg@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
 <CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
 <CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
 <CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
 <CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
 <CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com> <CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 7:22 PM, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Apr 3, 2015 at 6:55 AM, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wrote:
>> On Thu, Apr 2, 2015 at 9:11 PM, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Wed, Apr 1, 2015 at 9:40 PM, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wrote:
>>>> Sorry, I can't take this without a DT ack.
>>>
>>> Hmmm.
>>>
>>> The policy seems to be:
>>>      "For driver (not subsystem) bindings: If you are comfortable with the
>>>      binding, and it hasn't received an Acked-by from the devicetree
>>>      maintainers after a few weeks, go ahead and take it."
>>>
>>> The syscon property is only relative to the qcom hwspinlock driver,
>>> (unless I'm missing something) and both Qualcomm and Sony devs are
>>> OK with it.  So while an ACK from the DT side would be nice, I don't
>>> think it's required.  This is exactly the type of delay that is really
>>> holding up a lot of out-of-tree code.
>>
>> Sorry, I do prefer to make sure Mark is OK with this devicetree patch,
>> especially since it wasn't clear whether Mark is entirely comfortable
>> with it in his last response.
>
> Just to be clear - do you personally have any objections to the patch?

No, but this patch is for a folder I don't maintain so I prefer
someone who does to take a look.

Mark did take a look, and said he's confused by this patch (see this thread).

Do you want me to ignore him and just send it to Linus anyway?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
