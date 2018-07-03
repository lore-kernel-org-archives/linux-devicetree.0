Return-Path: <SRS0=G0Eu=JT=linaro.org=mathieu.poirier@kernel.org>
MIME-Version: 1.0
References: <1527858967-16047-1-git-send-email-suzuki.poulose@arm.com>
 <1527858967-16047-7-git-send-email-suzuki.poulose@arm.com>
 <20180612204802.GA15817@rob-hp-laptop> <a1c0749b-9c97-b45f-716f-a62ae07af278@arm.com>
 <5448BBB7-93FE-400F-9D87-FABF5DE0539C@arm.com> <c0d531ec-9201-bfd8-e6c3-9140698b0697@arm.com>
 <HE1PR0802MB24127EC935B9AF6F82AB3B6EEE7E0@HE1PR0802MB2412.eurprd08.prod.outlook.com>
 <075b99a1-2a29-f6dc-e9f2-99f895c27d35@arm.com> <CANLsYkx9cjV-bWg7aLg-kJT7x7DtwTHdsYzzM8A3+cFFnu_mNg@mail.gmail.com>
 <HE1PR0802MB24121F0EEF8D7D643BC391A1EE7E0@HE1PR0802MB2412.eurprd08.prod.outlook.com>
 <5e013d65-9931-6b8d-ce7c-4333309d4ada@arm.com> <CAL_Jsq+0kExVY33kdDoR6bAxbr2VzRUzW2j0k+2wmv4CSNVnpQ@mail.gmail.com>
 <79d24815-278a-5465-65eb-afd3535236e7@arm.com>
In-Reply-To: <79d24815-278a-5465-65eb-afd3535236e7@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 3 Jul 2018 10:15:32 -0600
Message-ID: <CANLsYkzh7i165qYCCHWkdNbNPpwGSFgcL0358o3LZmdvmG_2Mg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/8] dts: coresight: Clean up the device tree graph bindings
Content-Type: multipart/alternative; boundary="0000000000003bb44a05701aa02e"
To: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Cc: Rob Herring <robh@kernel.org>, Matt Sealey <Matt.Sealey@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Charles Garcia-Tobin <Charles.Garcia-Tobin@arm.com>, John Horley <John.Horley@arm.com>, Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000003bb44a05701aa02e
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Jul 2018 at 03:44, Suzuki K Poulose <Suzuki.Poulose@arm.com>
wrote:

> Hi Rob,
>
> On 14/06/18 14:59, Rob Herring wrote:
> > On Thu, Jun 14, 2018 at 2:53 AM, Suzuki K Poulose
> > <Suzuki.Poulose@arm.com> wrote:
> >> On 13/06/18 22:07, Matt Sealey wrote:
> >>>
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>
> >>>>> So, if the suggestion is to use an existing property "unit", I am
> fine
> >>>>> with it, if people agree to it.
> >>>>
> >>>>
> >>>> If we're going to have something sharply different than ACPI I prefer
> >>>> Rob's idea.
> >>
> >>
> >> No, the above comment is about using "unit" ( if it is a standard
> property
> >> for specifying something specific to hardware) instead of
> "coresight,hwid".
> >> I would prefer to stick to the DT graph bindings, because :
> >
> > "unit" is not a standard property and I don't like it either.
> >
> >>
> >> 1) The connections are bi-directional => Well, not necessarily
> >> bi-directional
> >> in terms of the data flow. But the connection information is critical.
> i.e,
> >> we need information about both the end-points of a connection, which
> the DT
> >> graph bindings solves.
> >>
> >> All we are missing is a way for specifying the "hardware port" number
> and
> >> the
> >> direction of flow. I don't see why do we need to create something new
> just
> >> for
> >> these two properties for something that exists today and works
> reasonably
> >> well
> >> for the usecase.
> >
> > If you have "in-ports" and "out-ports" nodes, then that gives you
> > direction and you can use reg for the "hardware port".
> >
> > in-ports {
> >    port@0 {
> >      reg = <0>;
> >      endpoint {...};
> >    };
> >    port@1 {
> >      reg = <1>;
> >      endpoint {...};
> >    };
> > };
> > out-ports {
> >    port@0 {
> >      reg = <0>;
> >      endpoint {...};
> >    };
> > };
> >
> > I'll need to check, but dtc may need an update to not warn about this.
> >
>
> I did a quick check with the upstream dtc tool and the above form is
> doesn't generate any errors.
>
> Mathieu, Rob,
>
> Shall I proceed with the proposal above ?
>


Yes - at the very least it will provide a new reference point to work form.

Thanks,
Mathieu


>
>
Suzuki
>

--0000000000003bb44a05701aa02e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, 3 Jul 2018 at 03:44, Suzuki K Poulose &lt;<a href=3D"mailto:Suzuki.Poulos=
e@arm.com">Suzuki.Poulose@arm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Rob,<br>
<br>
On 14/06/18 14:59, Rob Herring wrote:<br>
&gt; On Thu, Jun 14, 2018 at 2:53 AM, Suzuki K Poulose<br>
&gt; &lt;<a href=3D"mailto:Suzuki.Poulose@arm.com" target=3D"_blank">Suzuki=
.Poulose@arm.com</a>&gt; wrote:<br>
&gt;&gt; On 13/06/18 22:07, Matt Sealey wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt;&gt; From: Mathieu Poirier &lt;<a href=3D"mailto:mathieu.poirie=
r@linaro.org" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So, if the suggestion is to use an existing property &=
quot;unit&quot;, I am fine<br>
&gt;&gt;&gt;&gt;&gt; with it, if people agree to it.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; If we&#39;re going to have something sharply different tha=
n ACPI I prefer<br>
&gt;&gt;&gt;&gt; Rob&#39;s idea.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No, the above comment is about using &quot;unit&quot; ( if it is a=
 standard property<br>
&gt;&gt; for specifying something specific to hardware) instead of &quot;co=
resight,hwid&quot;.<br>
&gt;&gt; I would prefer to stick to the DT graph bindings, because :<br>
&gt; <br>
&gt; &quot;unit&quot; is not a standard property and I don&#39;t like it ei=
ther.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; 1) The connections are bi-directional =3D&gt; Well, not necessaril=
y<br>
&gt;&gt; bi-directional<br>
&gt;&gt; in terms of the data flow. But the connection information is criti=
cal. i.e,<br>
&gt;&gt; we need information about both the end-points of a connection, whi=
ch the DT<br>
&gt;&gt; graph bindings solves.<br>
&gt;&gt;<br>
&gt;&gt; All we are missing is a way for specifying the &quot;hardware port=
&quot; number and<br>
&gt;&gt; the<br>
&gt;&gt; direction of flow. I don&#39;t see why do we need to create someth=
ing new just<br>
&gt;&gt; for<br>
&gt;&gt; these two properties for something that exists today and works rea=
sonably<br>
&gt;&gt; well<br>
&gt;&gt; for the usecase.<br>
&gt; <br>
&gt; If you have &quot;in-ports&quot; and &quot;out-ports&quot; nodes, then=
 that gives you<br>
&gt; direction and you can use reg for the &quot;hardware port&quot;.<br>
&gt; <br>
&gt; in-ports {<br>
&gt;=C2=A0 =C2=A0 port@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 endpoint {...};<br>
&gt;=C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 port@1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 endpoint {...};<br>
&gt;=C2=A0 =C2=A0 };<br>
&gt; };<br>
&gt; out-ports {<br>
&gt;=C2=A0 =C2=A0 port@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 endpoint {...};<br>
&gt;=C2=A0 =C2=A0 };<br>
&gt; };<br>
&gt; <br>
&gt; I&#39;ll need to check, but dtc may need an update to not warn about t=
his.<br>
&gt; <br>
<br>
I did a quick check with the upstream dtc tool and the above form is<br>
doesn&#39;t generate any errors.<br>
<br>
Mathieu, Rob,<br>
<br>
Shall I proceed with the proposal above ?<br>=C2=A0</blockquote><div><br></=
div><div>Yes - at the very least it will provide a new reference point to w=
ork form.</div><div><br></div><div>Thanks,</div><div>Mathieu</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">=C2=A0<br></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
Suzuki<br>
</blockquote></div></div>

--0000000000003bb44a05701aa02e--
