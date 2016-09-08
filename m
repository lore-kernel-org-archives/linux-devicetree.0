From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Thu, 8 Sep 2016 16:36:43 -0700
Message-ID: <CALAqxLWzunbBSx1quh=z_1-voqaNyW0y69=xZLihnTS0YwBbYQ@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com> <57D1F540.4000009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D1F540.4000009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "<linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 4:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/08/16 14:15, Dmitry Shmidt wrote:
>> On Thu, Sep 8, 2016 at 2:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 09/08/16 13:35, dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org wrote:
>>>> From e14eb45fa5a93c1bff8a6dfe7b6756e4ad72c579 Mon Sep 17 00:00:00 2001
>>>> From: Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>>>> Date: Wed, 24 Aug 2016 13:25:52 -0700
>>>> Subject: [PATCH] of: Overlay manager
>>>>
>>>> Overlay manager processes DT entries on demand.
>>>> It is chosen by CONFIG_OF_OVERLAY_MGR option.
>>>> These entries can be chosen from kernel command line:
>>>> overlay_mgr.overlay_dt_entry=hardware_cfg_0
>>>> DT contains main overlay_mng entry with all possible
>>>> HW config setups. And then kernel command line option
>>>> will allow to choose between them.
>>>>
>>>>   Kernel DT entry:
>>>>     overlay_mgr {
>>>>         compatible = "linux,overlay_manager";
>>>>         hardware_cfg_0 {
>>>>             overlay@0 {
>>>>                     fragment@0 {
>>>>                             __overlay__ {
>>>>                             };
>>>>                     };
>>>>             };
>>>>             overlay@1 {
>>>>                     fragment@0 {
>>>>                             __overlay__ {
>>>>                             };
>>>>                     };
>>>>             };
>>>>         };
>>>>     };
>>>
>>> What problem(s) are you trying to solve with this?
>>
>> Currently the Linux kernel doesn't provide a way for boot time
>> selection of different possible board configurations, when the board
>> peripherals are specified via Device Tree.
>>
>> Thus, this patch provides a driver which takes a boot option to
>> apply pre-defined device-tree overlay fragments on bootup. This
>> allows a single kernel/devicetree to be able to support a number of
>> different configurations by only changing a boot argument.
>>
>>> What is the use case?
>>
>> It is usually useful for development board when you can use
>> different peripherals. For example you want to use special
>> LCD panel. Using it will go on account of other stuff like GPIOs,
>> so you don't want it all the time. And it is not convenient to
>> apply new patches and to recompile the kernel. And this code
>> allows to choose LCD panel configuration from command line.
>
> In other words, you want to be able to make configuration choices
> at boot time.
>
> The hardware is not different between boots, but you may want to use
> it in different ways, with a boot time selection.

The hardware may actually be different between boots, as different
mezzanine or shields might be attached.

The idea is to have a single kernel/dts that can function with an
array of plug-able (but unfortunately not probe-able attachments).

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
