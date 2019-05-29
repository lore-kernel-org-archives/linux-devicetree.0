Return-Path: <SRS0=Hj2u=T5=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190524010117.225219-1-saravanak@google.com>
In-Reply-To: <20190524010117.225219-1-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 29 May 2019 13:00:34 -0700
Message-ID: <CAGETcx8MY7Xhc4YjCcO9TH6X9Sse4Mg2Wi6vjau5T6d4C-itFQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Content-Type: multipart/alternative; boundary="0000000000002a6ece058a0c3e51"
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000002a6ece058a0c3e51
Content-Type: text/plain; charset="UTF-8"

Frank, Rob, Mark,

Gentle reminder. I've replied to your emails spread across the different
patches in the series. Hoping they address your questions and concerns.
Please let me know what you think.

Thanks,
Saravana

On Thu, May 23, 2019 at 6:01 PM Saravana Kannan <saravanak@google.com>
wrote:

> Add a generic "depends-on" property that allows specifying mandatory
> functional dependencies between devices. Add device-links after the
> devices are created (but before they are probed) by looking at this
> "depends-on" property.
>
> This property is used instead of existing DT properties that specify
> phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> is because not all resources referred to by existing DT properties are
> mandatory functional dependencies. Some devices/drivers might be able
> to operate with reduced functionality when some of the resources
> aren't available. For example, a device could operate in polling mode
> if no IRQ is available, a device could skip doing power management if
> clock or voltage control isn't available and they are left on, etc.
>
> So, adding mandatory functional dependency links between devices by
> looking at referred phandles in DT properties won't work as it would
> prevent probing devices that could be probed. By having an explicit
> depends-on property, we can handle these cases correctly.
>
> Having functional dependencies explicitly called out in DT and
> automatically added before the devices are probed, provides the
> following benefits:
>
> - Optimizes device probe order and avoids the useless work of
>   attempting probes of devices that will not probe successfully
>   (because their suppliers aren't present or haven't probed yet).
>
>   For example, in a commonly available mobile SoC, registering just
>   one consumer device's driver at an initcall level earlier than the
>   supplier device's driver causes 11 failed probe attempts before the
>   consumer device probes successfully. This was with a kernel with all
>   the drivers statically compiled in. This problem gets a lot worse if
>   all the drivers are loaded as modules without direct symbol
>   dependencies.
>
> - Supplier devices like clock providers, regulators providers, etc
>   need to keep the resources they provide active and at a particular
>   state(s) during boot up even if their current set of consumers don't
>   request the resource to be active. This is because the rest of the
>   consumers might not have probed yet and turning off the resource
>   before all the consumers have probed could lead to a hang or
>   undesired user experience.
>
>   Some frameworks (Eg: regulator) handle this today by turning off
>   "unused" resources at late_initcall_sync and hoping all the devices
>   have probed by then. This is not a valid assumption for systems with
>   loadable modules. Other frameworks (Eg: clock) just don't handle
>   this due to the lack of a clear signal for when they can turn off
>   resources. This leads to downstream hacks to handle cases like this
>   that can easily be solved in the upstream kernel.
>
>   By linking devices before they are probed, we give suppliers a clear
>   count of the number of dependent consumers. Once all of the
>   consumers are active, the suppliers can turn off the unused
>   resources without making assumptions about the number of consumers.
>
> By default we just add device-links to track "driver presence" (probe
> succeeded) of the supplier device. If any other functionality provided
> by device-links are needed, it is left to the consumer/supplier
> devices to change the link when they probe.
>
>
> Saravana Kannan (5):
>   of/platform: Speed up of_find_device_by_node()
>   driver core: Add device links support for pending links to suppliers
>   dt-bindings: Add depends-on property
>   of/platform: Add functional dependency link from "depends-on" property
>   driver core: Add sync_state driver/bus callback
>
>  .../devicetree/bindings/depends-on.txt        |  26 +++++
>  drivers/base/core.c                           | 106 ++++++++++++++++++
>  drivers/of/platform.c                         |  75 ++++++++++++-
>  include/linux/device.h                        |  24 ++++
>  include/linux/of.h                            |   3 +
>  5 files changed, 233 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/depends-on.txt
>
> --
> 2.22.0.rc1.257.g3120a18244-goog
>
>

--0000000000002a6ece058a0c3e51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Frank, Rob, Mark,<div><br></div><div>Gent=
le reminder. I&#39;ve replied to your emails spread across the different pa=
tches in the series. Hoping they address your questions and concerns. Pleas=
e let me know what you think.</div><div><br></div><div>Thanks,</div><div>Sa=
ravana</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, May 23, 2019 at 6:01 PM Saravana Kannan &lt;<a href=3D"=
mailto:saravanak@google.com">saravanak@google.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Add a generic &quot;depend=
s-on&quot; property that allows specifying mandatory<br>
functional dependencies between devices. Add device-links after the<br>
devices are created (but before they are probed) by looking at this<br>
&quot;depends-on&quot; property.<br>
<br>
This property is used instead of existing DT properties that specify<br>
phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This<br>
is because not all resources referred to by existing DT properties are<br>
mandatory functional dependencies. Some devices/drivers might be able<br>
to operate with reduced functionality when some of the resources<br>
aren&#39;t available. For example, a device could operate in polling mode<b=
r>
if no IRQ is available, a device could skip doing power management if<br>
clock or voltage control isn&#39;t available and they are left on, etc.<br>
<br>
So, adding mandatory functional dependency links between devices by<br>
looking at referred phandles in DT properties won&#39;t work as it would<br=
>
prevent probing devices that could be probed. By having an explicit<br>
depends-on property, we can handle these cases correctly.<br>
<br>
Having functional dependencies explicitly called out in DT and<br>
automatically added before the devices are probed, provides the<br>
following benefits:<br>
<br>
- Optimizes device probe order and avoids the useless work of<br>
=C2=A0 attempting probes of devices that will not probe successfully<br>
=C2=A0 (because their suppliers aren&#39;t present or haven&#39;t probed ye=
t).<br>
<br>
=C2=A0 For example, in a commonly available mobile SoC, registering just<br=
>
=C2=A0 one consumer device&#39;s driver at an initcall level earlier than t=
he<br>
=C2=A0 supplier device&#39;s driver causes 11 failed probe attempts before =
the<br>
=C2=A0 consumer device probes successfully. This was with a kernel with all=
<br>
=C2=A0 the drivers statically compiled in. This problem gets a lot worse if=
<br>
=C2=A0 all the drivers are loaded as modules without direct symbol<br>
=C2=A0 dependencies.<br>
<br>
- Supplier devices like clock providers, regulators providers, etc<br>
=C2=A0 need to keep the resources they provide active and at a particular<b=
r>
=C2=A0 state(s) during boot up even if their current set of consumers don&#=
39;t<br>
=C2=A0 request the resource to be active. This is because the rest of the<b=
r>
=C2=A0 consumers might not have probed yet and turning off the resource<br>
=C2=A0 before all the consumers have probed could lead to a hang or<br>
=C2=A0 undesired user experience.<br>
<br>
=C2=A0 Some frameworks (Eg: regulator) handle this today by turning off<br>
=C2=A0 &quot;unused&quot; resources at late_initcall_sync and hoping all th=
e devices<br>
=C2=A0 have probed by then. This is not a valid assumption for systems with=
<br>
=C2=A0 loadable modules. Other frameworks (Eg: clock) just don&#39;t handle=
<br>
=C2=A0 this due to the lack of a clear signal for when they can turn off<br=
>
=C2=A0 resources. This leads to downstream hacks to handle cases like this<=
br>
=C2=A0 that can easily be solved in the upstream kernel.<br>
<br>
=C2=A0 By linking devices before they are probed, we give suppliers a clear=
<br>
=C2=A0 count of the number of dependent consumers. Once all of the<br>
=C2=A0 consumers are active, the suppliers can turn off the unused<br>
=C2=A0 resources without making assumptions about the number of consumers.<=
br>
<br>
By default we just add device-links to track &quot;driver presence&quot; (p=
robe<br>
succeeded) of the supplier device. If any other functionality provided<br>
by device-links are needed, it is left to the consumer/supplier<br>
devices to change the link when they probe.<br>
<br>
<br>
Saravana Kannan (5):<br>
=C2=A0 of/platform: Speed up of_find_device_by_node()<br>
=C2=A0 driver core: Add device links support for pending links to suppliers=
<br>
=C2=A0 dt-bindings: Add depends-on property<br>
=C2=A0 of/platform: Add functional dependency link from &quot;depends-on&qu=
ot; property<br>
=C2=A0 driver core: Add sync_state driver/bus callback<br>
<br>
=C2=A0.../devicetree/bindings/depends-on.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 26 +++++<br>
=C2=A0drivers/base/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 106 ++++++++++++++++++<br=
>
=C2=A0drivers/of/platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 75 ++++++++++++-<br>
=C2=A0include/linux/device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 ++++<br>
=C2=A0include/linux/of.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A05 files changed, 233 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/depends-on.txt<b=
r>
<br>
-- <br>
2.22.0.rc1.257.g3120a18244-goog<br>
<br>
</blockquote></div></div>

--0000000000002a6ece058a0c3e51--
