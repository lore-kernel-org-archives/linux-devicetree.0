From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/2] DT match helpers for initcalls and platform devices
Date: Wed, 30 Oct 2013 16:40:38 -0500
Message-ID: <CAL_JsqKna00oyhSd0qTYfLVFeE6d-gbekmV9tg7raPxmCTsYHQ@mail.gmail.com>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com>
	<20131030082621.GA22787@ulmo.nvidia.com>
	<CAL_JsqJ3GANeMNi3iXQY_rB-NoovmwZx7EXfbG=rS6MxS=NLvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ3GANeMNi3iXQY_rB-NoovmwZx7EXfbG=rS6MxS=NLvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 30, 2013 at 3:02 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Oct 30, 2013 at 3:26 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Oct 30, 2013 at 01:12:49AM -0500, Rob Herring wrote:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> This series adds a couple of boilerplate helpers to match with DT for
>>> initcalls and platform device creation and probe. The goal here is to
>>> remove more platform code out of arch/arm and eventually the machine
>>> descriptors.
>>
>> I fear that this is a step backwards because it makes it easier for
>> people to do the wrong thing. We've been doing the same with interrupt
>> controllers and clocks. With those there's at least the argument that
>> they need to be available really early and therefore cannot use the
>> regular driver model. But for everything else, shouldn't we enforce
>> proper drivers to be written?
>
> You think both are a step backwards or just the initcall one? For
> initcalls, there are things which are not drivers, but just one time
> init.  The example on highbank is highbank_pm_init. In some cases like
> cpuidle, they have been converted to platform drivers, but then we
> have platform code to create devices if we are on the relevant
> platform. There is not really a real device node that exists for some
> of these drivers and we need to create the device rather than the
> device getting created by scanning the buses in the DT.
>
> I think this is less error prone because we've had cases of
> unconditional initcalls which break multi-platform kernels.
>
>> Perhaps if you can point me to some examples I could get more context
>> why and where this would be useful.
>
> I'll push out a WIP branch later which has the above examples and
> removes the machine_desc struct for highbank. This all is more for
> arm64 which doesn't have or want to have a machine_desc.

Here is a branch with example users:

git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
highbank-rm-mach-desc

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
