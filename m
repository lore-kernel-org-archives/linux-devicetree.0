From: Tim Bird <tbird20d@gmail.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Mon, 6 Apr 2015 09:22:28 -0700
Message-ID: <CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
	<CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
	<CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
	<CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
	<CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
	<CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 3, 2015 at 6:55 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> On Thu, Apr 2, 2015 at 9:11 PM, Tim Bird <tbird20d@gmail.com> wrote:
>> On Wed, Apr 1, 2015 at 9:40 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
>>> Sorry, I can't take this without a DT ack.
>>
>> Hmmm.
>>
>> The policy seems to be:
>>      "For driver (not subsystem) bindings: If you are comfortable with the
>>      binding, and it hasn't received an Acked-by from the devicetree
>>      maintainers after a few weeks, go ahead and take it."
>>
>> The syscon property is only relative to the qcom hwspinlock driver,
>> (unless I'm missing something) and both Qualcomm and Sony devs are
>> OK with it.  So while an ACK from the DT side would be nice, I don't
>> think it's required.  This is exactly the type of delay that is really
>> holding up a lot of out-of-tree code.
>
> Sorry, I do prefer to make sure Mark is OK with this devicetree patch,
> especially since it wasn't clear whether Mark is entirely comfortable
> with it in his last response.

Just to be clear - do you personally have any objections to the patch?
Are we now stuck in limbo until such time as the device tree maintainers
get around to us?

I'm worried about this status because my understanding is that the
DT maintainers are hugely backlogged and let a lot of stuff drop on the
floor.  In particular, see slide 21 of the following presentation:
http://www.elinux.org/images/0/0a/The_Device_Tree_as_a_Stable_ABI-_A_Fairy_Tale%3F.pdf
That graph shows that the DT maintainers are falling way behind in
their reviews and ACKs.

The policy of not waiting for an ACK from device tree maintainers
was specifically created to help the situation we are now in, and yet
you seem to be unwilling to follow it.  This is extremely frustrating.

One idea we discussed at a recent meeting on mainlining was to submit
SoC-blocking items to drivers/staging.  Then, stuff is at least in the tree
and can be tested by others pending some approval.  Do you have any
opinion on that?

Is there any way to move ahead?  Or are we doomed to just sit around
and wait indefinitely? For the record, after what amount of time without
a DT ACK would you consider accepting this (if ever)?

Another idea I'm considering is to write our own hwspinlock layer
and become the maintainer of that, so we're not blocked by you.
At this point, the value of using your hwspinlock framework
is vastly outweighed by the negative effect is has on our mainlining
effort.

Regards,

 -- Tim Bird
Senior Software Engineer, Sony Mobile
Architecture Group Chair, CE Workgroup, Linux Foundation
