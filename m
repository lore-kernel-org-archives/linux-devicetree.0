From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: Convert to using %pOF instead of full_name
Date: Tue, 25 Jul 2017 19:27:29 -0500
Message-ID: <CAL_JsqJFD4y3MXFApApj59brOyagysGjmrPFBGx96gf-ZjCdSA@mail.gmail.com>
References: <20170718214339.7774-2-robh@kernel.org> <20170725120422.GD27768@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170725120422.GD27768-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, luc.vanoostenryck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 7:04 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> [adding Luc]
>
> Hi Rob,
>
> On Tue, Jul 18, 2017 at 04:42:42PM -0500, Rob Herring wrote:
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>> of the full path string for each node.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
>> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> ---
>>  arch/arm64/kernel/cpu_ops.c  |  4 ++--
>>  arch/arm64/kernel/smp.c      | 12 ++++++------
>>  arch/arm64/kernel/topology.c | 22 +++++++++++-----------
>>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> I've queued this and the perf patch too, but it would be good if somebody
> could update sparse to recognise this format specifier. Currently it
> just complains about it.

I'm happy to fix it, but I ran sparse and don't see any errors. Got a pointer?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
