Return-Path: <SRS0=Hlfv=3B=google.com=jwerner@kernel.org>
MIME-Version: 1.0
Sender: jwerner@google.com
In-Reply-To: <20170324175727.GB119093@google.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-5-git-send-email-thierry.escande@collabora.com>
 <20170324122146.GE22771@leverpostej> <20170324175727.GB119093@google.com>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 24 Mar 2017 12:32:16 -0700
Message-ID: <CAODwPW94vsaWF8+DrLduWhHpbBvdvynbDocXCv2ekZH178BHjQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] firmware: Add coreboot device tree binding documentation
Content-Type: multipart/alternative; boundary=001a1140338a2e3d61054b7f0dee
To: Brian Norris <briannorris@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Escande <thierry.escande@collabora.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Julius Werner <jwerner@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--001a1140338a2e3d61054b7f0dee
Content-Type: text/plain; charset=UTF-8

>
> > Devicetree bindings should be in vendor,prefix format. This doesn't
> > represent every aspect of coreboot, so it needs a more descriptive
> > string.
>
> Any particular suggestion? I suppose this is Google's interpretation of
> coreboot tables, so "google,coreboot"?


No. This binding is for the coreboot project in general and has nothing to
do with Google. coreboot is both the vendor and the product, so I think
"coreboot" would look better than "coreboot,coreboot". And yes, it is
supposed to represent every aspect of coreboot (right now the "coreboot
tables" are already sort of a catch-all data structure used by coreboot to
pass on any sort of info it wants later stages to know... and if we ever
have any additional things we'd like to pass on, we'd probably want to add
them to this binding as well).


> > > + - reg: Address and length of the following two memory regions, in
> order:
> > > +   1.) The coreboot table. This is a list of variable-sized
> descriptors
> > > +   that contain various compile- and run-time generated firmware
> > > +   parameters. It is identified by the magic string "LBIO" in its
> first
> > > +   four bytes.
> > > +   See coreboot's src/commonlib/include/commonlib/coreboot_tables.h
> for
> > > +   details.
> >
> > Given this is a memory region, it should be described under the
> > reserved-memory node.
>
> We've painted this bikeshed before. I guess the result was either to use
> /reserved-memory or /memreserve/. I believe we've been using
> /memreserve/. I suppose we could document a method to use either, but
> the main "agreement" was to use the /firmware/coreboot path instead of
> /reserved-memory/coreboot.
>

See the old thread Brian linked for some arguments for and against this. I
think particularly because we want this node to represent every aspect of
coreboot (which I think makes more sense than spreading stuff all over the
place), treating it as reserved memory would not work well if we might
later add other fields.

Also, since we didn't get any more responses the last time we tried to
upstream this and had schedules to keep, we had to go ahead with what we
had. So right now there are already millions of devices shipped with this
binding in firmware, and the only question we still have left to decide is
whether Linux wants to support them upstream or not.

--001a1140338a2e3d61054b7f0dee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail-h5">=
&gt; Devicetree bindings should be in vendor,prefix format. This doesn&#39;=
t<br>
&gt; represent every aspect of coreboot, so it needs a more descriptive<br>
&gt; string.<br>
<br>
</div></div>Any particular suggestion? I suppose this is Google&#39;s inter=
pretation of<br>
coreboot tables, so &quot;google,coreboot&quot;?</blockquote><div><br></div=
><div>No. This binding is for the coreboot project in general and has nothi=
ng to do with Google. coreboot is both the vendor and the product, so I thi=
nk &quot;coreboot&quot; would look better than &quot;coreboot,coreboot&quot=
;. And yes, it is supposed to represent every aspect of coreboot (right now=
 the &quot;coreboot tables&quot; are already sort of a catch-all data struc=
ture used by coreboot to pass on any sort of info it wants later stages to =
know... and if we ever have any additional things we&#39;d like to pass on,=
 we&#39;d probably want to add them to this binding as well).</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"g=
mail-">
&gt; &gt; + - reg: Address and length of the following two memory regions, =
in order:<br>
&gt; &gt; +=C2=A0 =C2=A01.) The coreboot table. This is a list of variable-=
sized descriptors<br>
&gt; &gt; +=C2=A0 =C2=A0that contain various compile- and run-time generate=
d firmware<br>
&gt; &gt; +=C2=A0 =C2=A0parameters. It is identified by the magic string &q=
uot;LBIO&quot; in its first<br>
&gt; &gt; +=C2=A0 =C2=A0four bytes.<br>
&gt; &gt; +=C2=A0 =C2=A0See coreboot&#39;s src/commonlib/include/<wbr>commo=
nlib/coreboot_tables.h for<br>
&gt; &gt; +=C2=A0 =C2=A0details.<br>
&gt;<br>
&gt; Given this is a memory region, it should be described under the<br>
&gt; reserved-memory node.<br>
<br>
</span>We&#39;ve painted this bikeshed before. I guess the result was eithe=
r to use<br>
/reserved-memory or /memreserve/. I believe we&#39;ve been using<br>
/memreserve/. I suppose we could document a method to use either, but<br>
the main &quot;agreement&quot; was to use the /firmware/coreboot path inste=
ad of<br>
/reserved-memory/coreboot.<br></blockquote><div><br></div><div>See the old =
thread Brian linked for some arguments for and against this. I think partic=
ularly because we want this node to represent every aspect of coreboot (whi=
ch I think makes more sense than spreading stuff all over the place), treat=
ing it as reserved memory would not work well if we might later add other f=
ields.</div><div><br></div><div>Also, since we didn&#39;t get any more resp=
onses the last time we tried to upstream this and had schedules to keep, we=
 had to go ahead with what we had. So right now there are already millions =
of devices shipped with this binding in firmware, and the only question we =
still have left to decide is whether Linux wants to support them upstream o=
r not.</div></div></div></div>

--001a1140338a2e3d61054b7f0dee--
