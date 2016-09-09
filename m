From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Thu, 8 Sep 2016 19:33:12 -0500
Message-ID: <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Shmidt <dimitrysh@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 4:15 PM, Dmitry Shmidt <dimitrysh@google.com> wrote:
> On Thu, Sep 8, 2016 at 2:08 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>> On 09/08/16 13:35, dimitrysh@google.com wrote:
>>> From e14eb45fa5a93c1bff8a6dfe7b6756e4ad72c579 Mon Sep 17 00:00:00 2001
>>> From: Dmitry Shmidt <dimitrysh@google.com>
>>> Date: Wed, 24 Aug 2016 13:25:52 -0700
>>> Subject: [PATCH] of: Overlay manager
>>>
>>> Overlay manager processes DT entries on demand.
>>> It is chosen by CONFIG_OF_OVERLAY_MGR option.
>>> These entries can be chosen from kernel command line:
>>> overlay_mgr.overlay_dt_entry=hardware_cfg_0
>>> DT contains main overlay_mng entry with all possible
>>> HW config setups. And then kernel command line option
>>> will allow to choose between them.

There's 2 new things this patch does that should be separated:
sources/locations of overlays and selecting which ones to apply.

We could have several sources of overlays (just talking at boot time).
They could be built into the kernel. We've also discussed being about
to append overlays to the dtb (not just cat, but extending the FDT
format). This would make bootloaders' job applying overlays trivial.
The kernel command line option should not care what is the source. As
part of that, I don't think overlay manager should be a separate
thing.

The second part is how do we select overlays to apply. This could be
some platform quirk code, could be set in /chosen in DT, or the kernel
command line. These all need a way to identify the overlays. It also
needs to be independent of the location. I don't have a good answer
ATM. Is hardware_cfg_X just an example or convention? I don't really
like it as convention, but haven't come up with an alternative.
Perhaps overlays should have compatible strings.

>>>
>>>   Kernel DT entry:
>>>     overlay_mgr {
>>>         compatible = "linux,overlay_manager";

This is really just "a set of overlays in a base DT". That's not
really a Linux thing, but we do need to define a standard way to
include them (unless there is some reason not to, but I don't see one
ATM).

>>>         hardware_cfg_0 {

These 2 levels could be collapsed to 1 or maybe removed completely.
Not necessarily how I think things should look, but grouping them
could be the user's problem and you just say:

dt-overlays=overlay@0,overlay@1

>>>             overlay@0 {
>>>                     fragment@0 {
>>>                             __overlay__ {
>>>                             };
>>>                     };
>>>             };
>>>             overlay@1 {
>>>                     fragment@0 {
>>>                             __overlay__ {
>>>                             };
>>>                     };
>>>             };
>>>         };
>>>     };
>>
>> What problem(s) are you trying to solve with this?
>
> Currently the Linux kernel doesn't provide a way for boot time
> selection of different possible board configurations, when the board
> peripherals are specified via Device Tree.

Well, the kernel does provide a way. For different h/w you give it a
different h/w description (i.e. dtb). The issue is having multiple
dtbs for mostly similar h/w is a PIA.

Also, it can be argued this should remain a bootloader problem. For
the LCD case, the bootloader is going to need that information to
support a splash screen. libfdt is learning how to apply overlays on
flat trees.

> Thus, this patch provides a driver which takes a boot option to
> apply pre-defined device-tree overlay fragments on bootup. This
> allows a single kernel/devicetree to be able to support a number of
> different configurations by only changing a boot argument.
>
>> What is the use case?
>
> It is usually useful for development board when you can use
> different peripherals. For example you want to use special
> LCD panel. Using it will go on account of other stuff like GPIOs,
> so you don't want it all the time. And it is not convenient to
> apply new patches and to recompile the kernel. And this code
> allows to choose LCD panel configuration from command line.

If you can figure out how to change the command line, then you can
just change the dtb. At least for how Android boot works, those aren't
really changed separately.

Rob
