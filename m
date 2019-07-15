Return-Path: <SRS0=TM0m=VM=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190702004811.136450-1-saravanak@google.com> <20190702004811.136450-3-saravanak@google.com>
 <CAL_JsqLdvDpKB=iV6x3eTr2F4zY0bxU-Wjb+JeMjj5rdnRc-OQ@mail.gmail.com>
 <CAGETcx_i9353aRFbJXNS78EvqwmU-2-xSBJ+ySZX1gjjHpz_cg@mail.gmail.com>
 <9e75b3dd-380b-c868-728f-46379e53bc11@gmail.com> <07812739-0e6b-6598-ac58-8e0ea74a3331@gmail.com>
In-Reply-To: <07812739-0e6b-6598-ac58-8e0ea74a3331@gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 15 Jul 2019 07:47:39 -0700
Message-ID: <CAGETcx8h_ASOSZOP=3XwxhPXgt78n31vtpPHRbAWW5Eo18cDYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] of/platform: Add functional dependency link from
 DT bindings
Content-Type: multipart/alternative; boundary="00000000000026f9b9058db958cc"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--00000000000026f9b9058db958cc
Content-Type: text/plain; charset="UTF-8"

A kernel command line option can also completely disable this functionality
easily and cleanly. Can we pick that as an option? I've an implementation
of that in the v5 series I sent out last week.

-Saravana

On Mon, Jul 15, 2019, 7:39 AM Frank Rowand <frowand.list@gmail.com> wrote:

> On 7/15/19 7:26 AM, Frank Rowand wrote:
> > HiRob,
> >
> > Sorry for such a late reply...
> >
> >
> > On 7/1/19 8:25 PM, Saravana Kannan wrote:
> >> On Mon, Jul 1, 2019 at 6:32 PM Rob Herring <robh+dt@kernel.org> wrote:
> >>>
> >>> On Mon, Jul 1, 2019 at 6:48 PM Saravana Kannan <saravanak@google.com>
> wrote:
> >>>>
> >>>> Add device-links after the devices are created (but before they are
> >>>> probed) by looking at common DT bindings like clocks and
> >>>> interconnects.
> >>>>
> >>>> Automatically adding device-links for functional dependencies at the
> >>>> framework level provides the following benefits:
> >>>>
> >>>> - Optimizes device probe order and avoids the useless work of
> >>>>   attempting probes of devices that will not probe successfully
> >>>>   (because their suppliers aren't present or haven't probed yet).
> >>>>
> >>>>   For example, in a commonly available mobile SoC, registering just
> >>>>   one consumer device's driver at an initcall level earlier than the
> >>>>   supplier device's driver causes 11 failed probe attempts before the
> >>>>   consumer device probes successfully. This was with a kernel with all
> >>>>   the drivers statically compiled in. This problem gets a lot worse if
> >>>>   all the drivers are loaded as modules without direct symbol
> >>>>   dependencies.
> >>>>
> >>>> - Supplier devices like clock providers, interconnect providers, etc
> >>>>   need to keep the resources they provide active and at a particular
> >>>>   state(s) during boot up even if their current set of consumers don't
> >>>>   request the resource to be active. This is because the rest of the
> >>>>   consumers might not have probed yet and turning off the resource
> >>>>   before all the consumers have probed could lead to a hang or
> >>>>   undesired user experience.
> >>>>
> >>>>   Some frameworks (Eg: regulator) handle this today by turning off
> >>>>   "unused" resources at late_initcall_sync and hoping all the devices
> >>>>   have probed by then. This is not a valid assumption for systems with
> >>>>   loadable modules. Other frameworks (Eg: clock) just don't handle
> >>>>   this due to the lack of a clear signal for when they can turn off
> >>>>   resources. This leads to downstream hacks to handle cases like this
> >>>>   that can easily be solved in the upstream kernel.
> >>>>
> >>>>   By linking devices before they are probed, we give suppliers a clear
> >>>>   count of the number of dependent consumers. Once all of the
> >>>>   consumers are active, the suppliers can turn off the unused
> >>>>   resources without making assumptions about the number of consumers.
> >>>>
> >>>> By default we just add device-links to track "driver presence" (probe
> >>>> succeeded) of the supplier device. If any other functionality provided
> >>>> by device-links are needed, it is left to the consumer/supplier
> >>>> devices to change the link when they probe.
> >>>>
> >>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>>> ---
> >>>>  drivers/of/Kconfig    |  9 ++++++++
> >>>>  drivers/of/platform.c | 52
> +++++++++++++++++++++++++++++++++++++++++++
> >>>>  2 files changed, 61 insertions(+)
> >>>>
> >>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> >>>> index 37c2ccbefecd..7c7fa7394b4c 100644
> >>>> --- a/drivers/of/Kconfig
> >>>> +++ b/drivers/of/Kconfig
> >>>> @@ -103,4 +103,13 @@ config OF_OVERLAY
> >>>>  config OF_NUMA
> >>>>         bool
> >>>>
> >>>> +config OF_DEVLINKS
> >>>
> >>> I'd prefer this not be a config option. After all, we want one kernel
> >>> build that works for all platforms.
> >>
> >> We need a lot more changes before one kernel build can work for all
> >> platforms. At least until then, I think we need this. Lot less chance
> >> of breaking existing platforms before all the missing pieces are
> >> created.
> >>
> >>> A kernel command line option to disable might be useful for debugging.
> >>
> >> Or we can have a command line to enable this for platforms that want
> >> to use it and have it default off.
> >
>
> > Given the fragility of the current boot sequence (without this patch set)
> > and the potential breakage of existing systems, I think that if we choose
> > to accept this patch set that it should first bake in the -next tree for
> > at least one major release cycle.  Maybe even two major release cycles.
>
> I probably didn't state that very well.  I was trying to not sound like
> I was accusing this patch series of being fragile.  The issue is that
> adding the patches to systems that weren't expecting the new ordering
> may cause boot problems for some systems.  I'm not concerned with
> pointing fingers, just want to make sure that we proceed cautiously
> until we know that the resulting system is robust.
>
> -Frank
>
> >
> > -Frank
> >
> >
> >>
> >>>> +       bool "Device links from DT bindings"
> >>>> +       help
> >>>> +         Common DT bindings like clocks, interconnects, etc
> represent a
> >>>> +         consumer device's dependency on suppliers devices. This
> option
> >>>> +         creates device links from these common bindings so that
> consumers are
> >>>> +         probed only after all their suppliers are active and
> suppliers can
> >>>> +         tell when all their consumers are active.
> >>>> +
> >>>>  endif # OF
> >>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> >>>> index 04ad312fd85b..a53717168aca 100644
> >>>> --- a/drivers/of/platform.c
> >>>> +++ b/drivers/of/platform.c
> >>>> @@ -61,6 +61,57 @@ struct platform_device
> *of_find_device_by_node(struct device_node *np)
> >>>>  EXPORT_SYMBOL(of_find_device_by_node);
> >>>>
> >>>>  #ifdef CONFIG_OF_ADDRESS
> >>>> +static int of_link_binding(struct device *dev, char *binding, char
> *cell)
> >>>
> >>> Under CONFIG_OF_ADDRESS seems like a strange location.
> >>
> >> Yeah, but the rest of the file seems to be under this. So I'm not
> >> touching that. I can probably move this function further down (close
> >> to platform populate) if you want that.
> >>>
> >>>> +{
> >>>> +       struct of_phandle_args sup_args;
> >>>> +       struct platform_device *sup_dev;
> >>>> +       unsigned int i = 0, links = 0;
> >>>> +       u32 dl_flags = DL_FLAG_AUTOPROBE_CONSUMER;
> >>>> +
> >>>> +       while (!of_parse_phandle_with_args(dev->of_node, binding,
> cell, i,
> >>>> +                                          &sup_args)) {
> >>>> +               i++;
> >>>> +               sup_dev = of_find_device_by_node(sup_args.np);
> >>>> +               if (!sup_dev)
> >>>> +                       continue;
> >>>> +               if (device_link_add(dev, &sup_dev->dev, dl_flags))
> >>>> +                       links++;
> >>>> +               put_device(&sup_dev->dev);
> >>>> +       }
> >>>> +       if (links < i)
> >>>> +               return -ENODEV;
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * List of bindings and their cell names (use NULL if no cell names)
> from which
> >>>> + * device links need to be created.
> >>>> + */
> >>>> +static char *link_bindings[] = {
> >>>
> >>> const
> >>
> >> Ack
> >>
> >>>
> >>>> +#ifdef CONFIG_OF_DEVLINKS
> >>>> +       "clocks", "#clock-cells",
> >>>> +       "interconnects", "#interconnect-cells",
> >>>
> >>> Planning to add others?
> >>
> >> Not in this patch.
> >>
> >> Regulators are the other big missing piece that I'm aware of now but
> >> they need a lot of discussion (see email from David and my reply).
> >>
> >> Not sure what other resources are shared where they can be "turned
> >> off" and cause devices set up at boot to fail. For example, I don't
> >> think interrupts need functional dependency tracking because they
> >> aren't really turned off by consumer 1 in a way that breaks things for
> >> consumer 2. Just masked and the consumer 2 can unmask and use it once
> >> it probes.
> >>
> >> I'm only intimately familiar with clocks, interconnects and regulators
> >> (to some extent). I'm open to adding other supplier categories in
> >> future patches as I educate myself of those or if other people want to
> >> add support for more categories.
> >>
> >> -Saravana
> >>
> >>>> +#endif
> >>>> +};
> >>>> +
> >>>> +static int of_link_to_suppliers(struct device *dev)
> >>>> +{
> >>>> +       unsigned int i = 0;
> >>>> +       bool done = true;
> >>>> +
> >>>> +       if (unlikely(!dev->of_node))
> >>>> +               return 0;
> >>>> +
> >>>> +       for (i = 0; i < ARRAY_SIZE(link_bindings) / 2; i++)
> >>>> +               if (of_link_binding(dev, link_bindings[i * 2],
> >>>> +                                       link_bindings[i * 2 + 1]))
> >>>> +                       done = false;
> >>>> +
> >>>> +       if (!done)
> >>>> +               return -ENODEV;
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>>  /*
> >>>>   * The following routines scan a subtree and registers a device for
> >>>>   * each applicable node.
> >>>> @@ -524,6 +575,7 @@ static int __init
> of_platform_default_populate_init(void)
> >>>>         if (!of_have_populated_dt())
> >>>>                 return -ENODEV;
> >>>>
> >>>> +       platform_bus_type.add_links = of_link_to_suppliers;
> >>>>         /*
> >>>>          * Handle certain compatibles explicitly, since we don't want
> to create
> >>>>          * platform_devices for every node in /reserved-memory with a
> >>>> --
> >>>> 2.22.0.410.gd8fdbe21b5-goog
> >>>>
> >>
> >
> >
>
>

--00000000000026f9b9058db958cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">A kernel command line option can also completely disable =
this functionality easily and cleanly. Can we pick that as an option? I&#39=
;ve an implementation of that in the v5 series I sent out last week.<div di=
r=3D"auto"><br></div><div dir=3D"auto">-Saravana</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 15, 2019=
, 7:39 AM Frank Rowand &lt;<a href=3D"mailto:frowand.list@gmail.com">frowan=
d.list@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
7/15/19 7:26 AM, Frank Rowand wrote:<br>
&gt; HiRob,<br>
&gt; <br>
&gt; Sorry for such a late reply...<br>
&gt; <br>
&gt; <br>
&gt; On 7/1/19 8:25 PM, Saravana Kannan wrote:<br>
&gt;&gt; On Mon, Jul 1, 2019 at 6:32 PM Rob Herring &lt;<a href=3D"mailto:r=
obh%2Bdt@kernel.org" target=3D"_blank" rel=3D"noreferrer">robh+dt@kernel.or=
g</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Jul 1, 2019 at 6:48 PM Saravana Kannan &lt;<a href=3D"=
mailto:saravanak@google.com" target=3D"_blank" rel=3D"noreferrer">saravanak=
@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Add device-links after the devices are created (but before=
 they are<br>
&gt;&gt;&gt;&gt; probed) by looking at common DT bindings like clocks and<b=
r>
&gt;&gt;&gt;&gt; interconnects.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Automatically adding device-links for functional dependenc=
ies at the<br>
&gt;&gt;&gt;&gt; framework level provides the following benefits:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; - Optimizes device probe order and avoids the useless work=
 of<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0attempting probes of devices that will not pro=
be successfully<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0(because their suppliers aren&#39;t present or=
 haven&#39;t probed yet).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0For example, in a commonly available mobile So=
C, registering just<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0one consumer device&#39;s driver at an initcal=
l level earlier than the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0supplier device&#39;s driver causes 11 failed =
probe attempts before the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0consumer device probes successfully. This was =
with a kernel with all<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0the drivers statically compiled in. This probl=
em gets a lot worse if<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0all the drivers are loaded as modules without =
direct symbol<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0dependencies.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; - Supplier devices like clock providers, interconnect prov=
iders, etc<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0need to keep the resources they provide active=
 and at a particular<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0state(s) during boot up even if their current =
set of consumers don&#39;t<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0request the resource to be active. This is bec=
ause the rest of the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0consumers might not have probed yet and turnin=
g off the resource<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0before all the consumers have probed could lea=
d to a hang or<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0undesired user experience.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Some frameworks (Eg: regulator) handle this to=
day by turning off<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0&quot;unused&quot; resources at late_initcall_=
sync and hoping all the devices<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0have probed by then. This is not a valid assum=
ption for systems with<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0loadable modules. Other frameworks (Eg: clock)=
 just don&#39;t handle<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0this due to the lack of a clear signal for whe=
n they can turn off<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0resources. This leads to downstream hacks to h=
andle cases like this<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0that can easily be solved in the upstream kern=
el.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0By linking devices before they are probed, we =
give suppliers a clear<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0count of the number of dependent consumers. On=
ce all of the<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0consumers are active, the suppliers can turn o=
ff the unused<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0resources without making assumptions about the=
 number of consumers.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; By default we just add device-links to track &quot;driver =
presence&quot; (probe<br>
&gt;&gt;&gt;&gt; succeeded) of the supplier device. If any other functional=
ity provided<br>
&gt;&gt;&gt;&gt; by device-links are needed, it is left to the consumer/sup=
plier<br>
&gt;&gt;&gt;&gt; devices to change the link when they probe.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Saravana Kannan &lt;<a href=3D"mailto:sarav=
anak@google.com" target=3D"_blank" rel=3D"noreferrer">saravanak@google.com<=
/a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 drivers/of/Kconfig=C2=A0 =C2=A0 |=C2=A0 9 ++++++++<b=
r>
&gt;&gt;&gt;&gt;=C2=A0 drivers/of/platform.c | 52 +++++++++++++++++++++++++=
++++++++++++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 2 files changed, 61 insertions(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig<br>
&gt;&gt;&gt;&gt; index 37c2ccbefecd..7c7fa7394b4c 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/of/Kconfig<br>
&gt;&gt;&gt;&gt; +++ b/drivers/of/Kconfig<br>
&gt;&gt;&gt;&gt; @@ -103,4 +103,13 @@ config OF_OVERLAY<br>
&gt;&gt;&gt;&gt;=C2=A0 config OF_NUMA<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +config OF_DEVLINKS<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;d prefer this not be a config option. After all, we want=
 one kernel<br>
&gt;&gt;&gt; build that works for all platforms.<br>
&gt;&gt;<br>
&gt;&gt; We need a lot more changes before one kernel build can work for al=
l<br>
&gt;&gt; platforms. At least until then, I think we need this. Lot less cha=
nce<br>
&gt;&gt; of breaking existing platforms before all the missing pieces are<b=
r>
&gt;&gt; created.<br>
&gt;&gt;<br>
&gt;&gt;&gt; A kernel command line option to disable might be useful for de=
bugging.<br>
&gt;&gt;<br>
&gt;&gt; Or we can have a command line to enable this for platforms that wa=
nt<br>
&gt;&gt; to use it and have it default off.<br>
&gt; <br>
<br>
&gt; Given the fragility of the current boot sequence (without this patch s=
et)<br>
&gt; and the potential breakage of existing systems, I think that if we cho=
ose<br>
&gt; to accept this patch set that it should first bake in the -next tree f=
or<br>
&gt; at least one major release cycle.=C2=A0 Maybe even two major release c=
ycles.<br>
<br>
I probably didn&#39;t state that very well.=C2=A0 I was trying to not sound=
 like<br>
I was accusing this patch series of being fragile.=C2=A0 The issue is that<=
br>
adding the patches to systems that weren&#39;t expecting the new ordering<b=
r>
may cause boot problems for some systems.=C2=A0 I&#39;m not concerned with<=
br>
pointing fingers, just want to make sure that we proceed cautiously<br>
until we know that the resulting system is robust.<br>
<br>
-Frank<br>
<br>
&gt; <br>
&gt; -Frank<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Device links from D=
T bindings&quot;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Common DT bindings like=
 clocks, interconnects, etc represent a<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consumer device&#39;s d=
ependency on suppliers devices. This option<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0creates device links fr=
om these common bindings so that consumers are<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0probed only after all t=
heir suppliers are active and suppliers can<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tell when all their con=
sumers are active.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 endif # OF<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/of/platform.c b/drivers/of/platform.c=
<br>
&gt;&gt;&gt;&gt; index 04ad312fd85b..a53717168aca 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/of/platform.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/of/platform.c<br>
&gt;&gt;&gt;&gt; @@ -61,6 +61,57 @@ struct platform_device *of_find_device_=
by_node(struct device_node *np)<br>
&gt;&gt;&gt;&gt;=C2=A0 EXPORT_SYMBOL(of_find_device_by_node);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 #ifdef CONFIG_OF_ADDRESS<br>
&gt;&gt;&gt;&gt; +static int of_link_binding(struct device *dev, char *bind=
ing, char *cell)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Under CONFIG_OF_ADDRESS seems like a strange location.<br>
&gt;&gt;<br>
&gt;&gt; Yeah, but the rest of the file seems to be under this. So I&#39;m =
not<br>
&gt;&gt; touching that. I can probably move this function further down (clo=
se<br>
&gt;&gt; to platform populate) if you want that.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct of_phandle_args sup_arg=
s;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *sup_de=
v;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0, links =
=3D 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dl_flags =3D DL_FLAG_AUTOP=
ROBE_CONSUMER;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!of_parse_phandle_with_=
args(dev-&gt;of_node, binding, cell, i,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;sup_args)) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i+=
+;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
p_dev =3D of_find_device_by_node(<a href=3D"http://sup_args.np" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">sup_args.np</a>);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (!sup_dev)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (device_link_add(dev, &amp;sup_dev-&gt;dev, dl_flags))<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0links++;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pu=
t_device(&amp;sup_dev-&gt;dev);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (links &lt; i)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn -ENODEV;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt; + * List of bindings and their cell names (use NULL if no =
cell names) from which<br>
&gt;&gt;&gt;&gt; + * device links need to be created.<br>
&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt; +static char *link_bindings[] =3D {<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; const<br>
&gt;&gt;<br>
&gt;&gt; Ack<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +#ifdef CONFIG_OF_DEVLINKS<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;clocks&quot;, &quot;#clo=
ck-cells&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;interconnects&quot;, &qu=
ot;#interconnect-cells&quot;,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Planning to add others?<br>
&gt;&gt;<br>
&gt;&gt; Not in this patch.<br>
&gt;&gt;<br>
&gt;&gt; Regulators are the other big missing piece that I&#39;m aware of n=
ow but<br>
&gt;&gt; they need a lot of discussion (see email from David and my reply).=
<br>
&gt;&gt;<br>
&gt;&gt; Not sure what other resources are shared where they can be &quot;t=
urned<br>
&gt;&gt; off&quot; and cause devices set up at boot to fail. For example, I=
 don&#39;t<br>
&gt;&gt; think interrupts need functional dependency tracking because they<=
br>
&gt;&gt; aren&#39;t really turned off by consumer 1 in a way that breaks th=
ings for<br>
&gt;&gt; consumer 2. Just masked and the consumer 2 can unmask and use it o=
nce<br>
&gt;&gt; it probes.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m only intimately familiar with clocks, interconnects and re=
gulators<br>
&gt;&gt; (to some extent). I&#39;m open to adding other supplier categories=
 in<br>
&gt;&gt; future patches as I educate myself of those or if other people wan=
t to<br>
&gt;&gt; add support for more categories.<br>
&gt;&gt;<br>
&gt;&gt; -Saravana<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; +#endif<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +static int of_link_to_suppliers(struct device *dev)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool done =3D true;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!dev-&gt;of_node)=
)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn 0;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZ=
E(link_bindings) / 2; i++)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (of_link_binding(dev, link_bindings[i * 2],<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0link_bindings[i * 2 + 1]))<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0done =3D false;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!done)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn -ENODEV;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 /*<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0* The following routines scan a subtree and re=
gisters a device for<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0* each applicable node.<br>
&gt;&gt;&gt;&gt; @@ -524,6 +575,7 @@ static int __init of_platform_default_=
populate_init(void)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_have_populated_dt=
())<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -ENODEV;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_bus_type.add_links =
=3D of_link_to_suppliers;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Handle certain compati=
bles explicitly, since we don&#39;t want to create<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * platform_devices for e=
very node in /reserved-memory with a<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.22.0.410.gd8fdbe21b5-goog<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--00000000000026f9b9058db958cc--
