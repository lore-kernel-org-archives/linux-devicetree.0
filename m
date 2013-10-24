From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: Don't send to devicetree list for "arch/*/boot/dts"
Date: Thu, 24 Oct 2013 05:40:12 -0500
Message-ID: <CAL_JsqJgtr_Z9H9Z3OJGnbD9asqYKdeziFKP--VRxh=7Qi3bVQ@mail.gmail.com>
References: <1382534520-15688-1-git-send-email-dianders@chromium.org>
	<52680380.7020204@gmail.com>
	<20131023235448.4de21b8d.m.chehab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131023235448.4de21b8d.m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Cesar Eduardo Barros <cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 5:54 PM, Mauro Carvalho Chehab
<m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Em Wed, 23 Oct 2013 12:12:32 -0500
> Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> escreveu:
>
>> On 10/23/2013 08:22 AM, Doug Anderson wrote:
>> > As discussed in the ARM kernel summit, people on the devicetree list
>> > would no longer like to receive emails about all dts changes.  Remove
>> > from MAINTAINERS.
>>
>> We need to make sure platform maintainers are copied though. That may be
>> hard since we don't have standard layout/naming of dts files.
>>
>> We might also want to drop these:
>> K:      of_get_property
>> K:      of_match_table
>>
>> They are at least on the wrong maintainer list now as they should be
>> associated with the binding maintainers and not DT core code if we do
>> keep them.
>>
>> Also based on the discussion, we need to add
>> Documentation/devicetree/bindings/* to appropriate subsystem
>> maintainers, but that should probably wait until after Friday at least.
>
> /me is confused. What's the procedure for the DT patches for the devices
> supported by the subsystem I maintain, e. g. patches for
> /drivers/media/platform?
>
> Should I just apply them, if I think that it is needed by the hardware?
> Are there any criteria to be followed? If so, what criteria?
>
> /me hopes that all those questions will be discussed/answered at KS on
> Friday's discussions ;)

Yes, it should all become clear at the DT slot on Fri.

> In any case, my suggestion is that this patch should be a way more verbose,
> and should come together with a patch adding something at Documentation
> (SubmittingPatches, or maybe SubmitingDTPatches) in order to be sure that
> both developers and subsystem maintainers will do the right thing.

A binding howto/best practices doc is planned which should help in this area.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
