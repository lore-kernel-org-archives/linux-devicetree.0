From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Mon, 6 Apr 2015 09:48:23 -0700
Message-ID: <CAJAp7OgZo8rUGL1xkrSVTXMZfgzbV8eGEMniSquw7owkRAqKmg@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
	<CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
	<CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
	<CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
	<CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
	<CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com>
	<CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg@mail.gmail.com>
	<CAK=WgbYwk=DEgNFKn11BHpS=V_m=6Okf=i7w5NkLHwu8ryMaJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbYwk=DEgNFKn11BHpS=V_m=6Okf=i7w5NkLHwu8ryMaJg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Tim Bird <tbird20d@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 9:31 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> On Mon, Apr 6, 2015 at 7:22 PM, Tim Bird <tbird20d@gmail.com> wrote:
>> On Fri, Apr 3, 2015 at 6:55 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
>>> On Thu, Apr 2, 2015 at 9:11 PM, Tim Bird <tbird20d@gmail.com> wrote:
>>>> On Wed, Apr 1, 2015 at 9:40 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
>>>>> Sorry, I can't take this without a DT ack.
>>>>
>>>> Hmmm.
>>>>
>>>> The policy seems to be:
>>>>      "For driver (not subsystem) bindings: If you are comfortable with the
>>>>      binding, and it hasn't received an Acked-by from the devicetree
>>>>      maintainers after a few weeks, go ahead and take it."
>>>>
>>>> The syscon property is only relative to the qcom hwspinlock driver,
>>>> (unless I'm missing something) and both Qualcomm and Sony devs are
>>>> OK with it.  So while an ACK from the DT side would be nice, I don't
>>>> think it's required.  This is exactly the type of delay that is really
>>>> holding up a lot of out-of-tree code.
>>>
>>> Sorry, I do prefer to make sure Mark is OK with this devicetree patch,
>>> especially since it wasn't clear whether Mark is entirely comfortable
>>> with it in his last response.
>>
>> Just to be clear - do you personally have any objections to the patch?
>
> No, but this patch is for a folder I don't maintain so I prefer
> someone who does to take a look.
>
> Mark did take a look, and said he's confused by this patch (see this thread).
>
> Do you want me to ignore him and just send it to Linus anyway?

Ohad, Tim,

For this patch to be useful to us we also need Suman's DT patch, so we
should try to get them both in asap.

Based on the long discussion we had on one of the previous iterations
of Suman's DT binding, with the DT maintainers I believe that it would
be fine to move along and sent Suman's patches to Linus - without an
explicit Ack from the DT guys (or did I just miss one?).

Regarding this patch I agree with Ohad that it would be good if we
verify that Mark's question is answered before moving on. So I will
reach out to him to see if he has any remaining concerns.

Regards,
Bjorn
