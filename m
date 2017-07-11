Return-Path: <SRS0=vJLl=6O=broadcom.com=al.cooper@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ5Osbs83dSbWht=e-aDo4fxBT2c97MtrFrvcyz3Q+57A@mail.gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-3-git-send-email-alcooperx@gmail.com> <20170706141840.lanfxjdrkaqvv3vz@rob-hp-laptop>
 <CAGh=XACQvkb1QE=EokekiCdK9K9yktkGyVNdXaT4CxE8XP=u4A@mail.gmail.com> <CAL_JsqJ5Osbs83dSbWht=e-aDo4fxBT2c97MtrFrvcyz3Q+57A@mail.gmail.com>
From: Al Cooper <al.cooper@broadcom.com>
Date: Tue, 11 Jul 2017 15:47:43 -0400
Message-ID: <CAGh=XABEx9ScOVFYzLKcztC-az2XhTPC=g1C+5ezT+=fexkAwg@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: bdc: Add Device Tree binding document for
 Broadcom BDC driver
Content-Type: multipart/alternative; boundary="94eb2c11ac3a1feaba05540ff9ef"
To: Rob Herring <robh@kernel.org>
Cc: Al Cooper <alcooperx@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c11ac3a1feaba05540ff9ef
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 7, 2017 at 4:15 PM, Rob Herring <robh@kernel.org> wrote:
>
> >> > +====================================
> >> > +
> >> > +Required properties:
> >> > +
> >> > +- compatible: must be one of:
> >> > +                "brcm,bdc-udc-v0.16"
> >> > +                "brcm,bdc-udc"
> >>
> >> Isn't "bdc-udc" redundant?
> >
> >
> > I'll change the base name to "brcm-udc"
>
> Well, it should be "brcm,<something>" with the vendor prefix followed
> by a comma. If the block is known as the BDC, then I'd use that.

Actually I meant to say I'd change it to "brcm,udc". I thought that udc
would be better than bdc because BDC stands for Broadcom Universal Device
Controller, so the "b" seems redundant in "brcm,bdc" and I thought that at
a glance more people would know what a "udc" driver was that what a "bdc"
driver was. I you still think "brcm,bdc" is better, I'll change it to that.

Thanks
Al

--94eb2c11ac3a1feaba05540ff9ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Jul 7, 2017 at 4:15 PM, Rob Herring &lt;<a href=3D=
"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt; wrote:<b=
r>&gt;<br>&gt; &gt;&gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>&gt=
; &gt;&gt; &gt; +<br>&gt; &gt;&gt; &gt; +Required properties:<br>&gt; &gt;&=
gt; &gt; +<br>&gt; &gt;&gt; &gt; +- compatible: must be one of:<br>&gt; &gt=
;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;b=
rcm,bdc-udc-v0.16&quot;<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;brcm,bdc-udc&quot;<br>&gt; &gt;&gt;<br>&g=
t; &gt;&gt; Isn&#39;t &quot;bdc-udc&quot; redundant?<br>&gt; &gt;<br>&gt; &=
gt;<br>&gt; &gt; I&#39;ll change the base name to &quot;brcm-udc&quot;<br>&=
gt;<br>&gt; Well, it should be &quot;brcm,&lt;something&gt;&quot; with the =
vendor prefix followed<br>&gt; by a comma. If the block is known as the BDC=
, then I&#39;d use that.<div><br></div><div>Actually I meant to say I&#39;d=
 change it to &quot;brcm,udc&quot;. I thought that udc would be better than=
 bdc because BDC stands for Broadcom Universal Device Controller, so the &q=
uot;b&quot; seems redundant in &quot;brcm,bdc&quot; and I thought that at a=
 glance more people would know what a &quot;udc&quot; driver was that what =
a &quot;bdc&quot; driver was. I you still think &quot;brcm,bdc&quot; is bet=
ter, I&#39;ll change it to that.</div><div><br></div><div>Thanks</div><div>=
Al<br><br></div></div>

--94eb2c11ac3a1feaba05540ff9ef--
