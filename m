Return-Path: <delicious.quinoa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6F671B0F-4F94-47F0-9CA2-04E6F905F20A@konsulko.com>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
	<1455730885-1514-2-git-send-email-atull@opensource.altera.com>
	<20160222025517.GS15973@rob-hp-laptop>
	<6F671B0F-4F94-47F0-9CA2-04E6F905F20A@konsulko.com>
Date: Mon, 22 Feb 2016 09:48:30 -0600
Message-ID: <CANk1AXSGWLVVJZ5ydNOc9jP5vTZjUssLgoFhtYgz+=vVQSysBQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
From: Alan Tull <delicious.quinoa@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bea40b8bb16fb052c5dc39d
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: devicetree@vger.kernel.org, atull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7bea40b8bb16fb052c5dc39d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Feb 22, 2016 9:38 AM, "Pantelis Antoniou" <pantelis.antoniou@konsulko.co=
m>
wrote:
>
> Hi Rob,
>
> > On Feb 22, 2016, at 04:55 , Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:
> >> Add overlay callback functionality.
> >>
> >> When DT overlays are being added, some drivers/subsystems
> >> will want to know about the changes before they go into the
> >> live tree.  Similarly there is a need for post-remove
> >> callbacks.
> >>
> >> Each handler is registered with a of_device_id.  When
> >> an overlay target matches a handler's id, the handler
> >> gets called.
> >>
> >> The following 4 cases are handled: pre-apply, post-apply,
> >> pre-remove, and post-remove.
> >
> > So I know I suggested maybe not using notifiers, but this ends up just
> > looking like notifiers, so we might as well use them unless we somehow
> > change the flow. You would just need to add pre-apply and pre-remove
> > in of_attach_node and of_detach_node, right?
> >
>
>
> I agree those look just like notifiers. We could just update the notifier
> logic to handle this case.
>
> Am I missing something else?

Yes this could just be added notifiers for pre-apply and pre-remove.  In
the case of pre-apply, if the notifier returns error, the overlay should be
rejected.

We will also want similar notifiers added for properties.

Alan

>
>
> > Rob
>
> Regards
>
> =E2=80=94 Pantelis
>

--047d7bea40b8bb16fb052c5dc39d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On Feb 22, 2016 9:38 AM, &quot;Pantelis Antoniou&quot; &lt;<=
a href=3D"mailto:pantelis.antoniou@konsulko.com">pantelis.antoniou@konsulko=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Rob,<br>
&gt;<br>
&gt; &gt; On Feb 22, 2016, at 04:55 , Rob Herring &lt;<a href=3D"mailto:rob=
h@kernel.org">robh@kernel.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:<br>
&gt; &gt;&gt; Add overlay callback functionality.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; When DT overlays are being added, some drivers/subsystems<br>
&gt; &gt;&gt; will want to know about the changes before they go into the<b=
r>
&gt; &gt;&gt; live tree.=C2=A0 Similarly there is a need for post-remove<br=
>
&gt; &gt;&gt; callbacks.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Each handler is registered with a of_device_id.=C2=A0 When<br=
>
&gt; &gt;&gt; an overlay target matches a handler&#39;s id, the handler<br>
&gt; &gt;&gt; gets called.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The following 4 cases are handled: pre-apply, post-apply,<br>
&gt; &gt;&gt; pre-remove, and post-remove.<br>
&gt; &gt;<br>
&gt; &gt; So I know I suggested maybe not using notifiers, but this ends up=
 just<br>
&gt; &gt; looking like notifiers, so we might as well use them unless we so=
mehow<br>
&gt; &gt; change the flow. You would just need to add pre-apply and pre-rem=
ove<br>
&gt; &gt; in of_attach_node and of_detach_node, right?<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; I agree those look just like notifiers. We could just update the notif=
ier<br>
&gt; logic to handle this case.<br>
&gt;<br>
&gt; Am I missing something else?</p>
<p dir=3D"ltr">Yes this could just be added notifiers for pre-apply and pre=
-remove.=C2=A0 In the case of pre-apply, if the notifier returns error, the=
 overlay should be rejected.</p>
<p dir=3D"ltr">We will also want similar notifiers added for properties. </=
p>
<p dir=3D"ltr">Alan</p>
<p dir=3D"ltr">&gt;<br>
&gt;<br>
&gt; &gt; Rob<br>
&gt;<br>
&gt; Regards<br>
&gt;<br>
&gt; =E2=80=94 Pantelis<br>
&gt;<br>
</p>

--047d7bea40b8bb16fb052c5dc39d--
