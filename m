From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/3] of: Migrate of_find_node_by_name() users to for_each_node_by_name()
Date: Thu, 26 Jun 2014 14:00:05 -0500
Message-ID: <CAL_JsqLUjcxHrHctfVe7M79=8MpUCYq1cBhfsoXVzrBoxECwvw@mail.gmail.com>
References: <1401983021-13829-1-git-send-email-grant.likely@linaro.org>
 <1401983021-13829-2-git-send-email-grant.likely@linaro.org>
 <CABGGisx=fhp1P68M+9aQUTzi6Bp+PnXK7Xq_TQ+=87AkGCZvwQ@mail.gmail.com>
 <20140626160345.6613CC41060@trevor.secretlab.ca> <CAL_JsqKDsdqd3PJ0gwvESMER=Nxi1us55pKWDhTuZtwgjo_MGA@mail.gmail.com>
 <CACxGe6tiiNvz9VCq=enTWMGDBUS_0gsDZh2DvzpVP5itQtiRpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tiiNvz9VCq=enTWMGDBUS_0gsDZh2DvzpVP5itQtiRpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 1:56 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jun 26, 2014 at 7:22 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, Jun 26, 2014 at 11:03 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, 5 Jun 2014 12:48:54 -0500, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> On Thu, Jun 5, 2014 at 10:43 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> > There are a bunch of users open coding the for_each_node_by_name() by
>>>> > calling of_find_node_by_name() directly instead of using the macro. This
>>>> > is getting in the way of some cleanups, and the possibility of removing
>>>> > of_find_node_by_name() entirely. Clean it up so that all the users are
>>>> > consistent.
>>>> >
>>>> > Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> > ---
>>>> >  arch/powerpc/platforms/powermac/feature.c  | 20 +++++---------------
>>>> >  arch/powerpc/platforms/powermac/pci.c      |  2 +-
>>>> >  arch/powerpc/platforms/powermac/smp.c      |  2 +-
>>>> >  arch/powerpc/platforms/powermac/udbg_adb.c |  2 +-
>>>> >  arch/powerpc/platforms/pseries/setup.c     |  3 +--
>>>> >  drivers/cpufreq/pmac64-cpufreq.c           |  3 +--
>>>> >  drivers/edac/cell_edac.c                   |  3 +--
>>>> >  drivers/pci/hotplug/rpaphp_core.c          |  4 ++--
>>>> >  drivers/tty/serial/pmac_zilog.c            |  9 +++------
>>>> >  sound/ppc/pmac.c                           |  6 +++---
>>>> >  10 files changed, 19 insertions(+), 35 deletions(-)
>>>> >
>>>> > diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
>>>> > index 63d82bbc05e9..39e1d163c427 100644
>>>> > --- a/arch/powerpc/platforms/powermac/feature.c
>>>> > +++ b/arch/powerpc/platforms/powermac/feature.c
>>>> > @@ -2805,25 +2805,20 @@ set_initial_features(void)
>>>> >                 /* Enable GMAC for now for PCI probing. It will be disabled
>>>> >                  * later on after PCI probe
>>>> >                  */
>>>> > -               np = of_find_node_by_name(NULL, "ethernet");
>>>> > -               while(np) {
>>>> > +               for_each_node_by_name(np, "ethernet")
>>>> >                         if (of_device_is_compatible(np, "K2-GMAC"))
>>>>
>>>> Can't for_each_compatible_node be used here instead?
>>>
>>> Not easily without changing the behaviour. It would need to then check
>>> the name inside the block.
>>
>> Why would it change behavior? If the compatible string matches, do you
>> really have cases where the node name is not "ethernet"? I don't
>> believe it's the kernel's job to validate DT bindings.
>
> Yes, there are actually some bindings that have the same compatible
> property but behaviour changes based on node name! I don't want to do
> the legwork to figure out if these are in that group. Someone else can
> do that job.

Well, that's just wrong.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
