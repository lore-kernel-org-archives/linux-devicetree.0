Return-Path: <SRS0=2zsu=6K=broadcom.com=al.cooper@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170706141840.lanfxjdrkaqvv3vz@rob-hp-laptop>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-3-git-send-email-alcooperx@gmail.com> <20170706141840.lanfxjdrkaqvv3vz@rob-hp-laptop>
From: Al Cooper <al.cooper@broadcom.com>
Date: Fri, 7 Jul 2017 15:03:53 -0400
Message-ID: <CAGh=XACQvkb1QE=EokekiCdK9K9yktkGyVNdXaT4CxE8XP=u4A@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: bdc: Add Device Tree binding document for
 Broadcom BDC driver
Content-Type: multipart/alternative; boundary="f403045cc140f433390553bee4eb"
To: Rob Herring <robh@kernel.org>
Cc: Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--f403045cc140f433390553bee4eb
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 10:18 AM, Rob Herring <robh@kernel.org> wrote:

> On Tue, Jun 27, 2017 at 02:23:20PM -0400, Al Cooper wrote:
> > Add Device Tree binding document for Broadcom USB Device
> > Controller (BDC).
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/brcm,bdc-udc.txt       | 28
> ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 Documentation/devicetree/
> bindings/usb/brcm,bdc-udc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> > new file mode 100644
> > index 0000000..4eeaddb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
> > @@ -0,0 +1,28 @@
> > +Broadcom USB Device Controller (BDC)
> > +====================================
> > +
> > +Required properties:
> > +
> > +- compatible: must be one of:
> > +                "brcm,bdc-udc-v0.16"
> > +                "brcm,bdc-udc"
>
> Isn't "bdc-udc" redundant?
>

I'll change the base name to "brcm-udc"


>
> Where does the version number come from?
>

I comes from an API version number in one of the hardware controller
registers.


>
> > +- reg: the base register address and length
> > +- interrupts: ther interrupt line for this controller
>
> s/ther/the/
>

Whoops, fixed.


>
> > +
> > +Optional properties:
> > +
> > +On Broadcom STB platforms, these properties are required:
> > +
> > +- phys: phandle to the USB PHY blocks
>
> How many?
>

Either 1 or 2 depending on the Soc. I'll add a note to explain.

>
> > +- clocks: phandle to the functional clock of this block
> > +
> > +Example:
> > +
> > +        udc@f0b02000 {
> > +                status = "disabled";
>
> Don't show status in examples.


Fixed


>
I'll re-send as v2 (including fix for "Also, "dt-bindings: usb: ..." for
the subject.")

Thanks
Al

--f403045cc140f433390553bee4eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 6, 2017 at 10:18 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=
=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</span=
> wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"gmail-">On Tue, Jun 27, 2017 at 02:23:20=
PM -0400, Al Cooper wrote:<br>
&gt; Add Device Tree binding document for Broadcom USB Device<br>
&gt; Controller (BDC).<br>
&gt;<br>
&gt; Signed-off-by: Al Cooper &lt;<a href=3D"mailto:alcooperx@gmail.com">al=
cooperx@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/usb/<wbr>brcm,bdc-udc.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 28 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/usb/br=
cm,bdc-udc.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/usb/brcm,bdc-udc.t=
xt b/Documentation/devicetree/<wbr>bindings/usb/brcm,bdc-udc.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4eeaddb<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/usb/brcm,bdc-udc.txt<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +Broadcom USB Device Controller (BDC)<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +<br>
&gt; +- compatible: must be one of:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;brcm,bd=
c-udc-v0.16&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;brcm,bd=
c-udc&quot;<br>
<br>
</span>Isn&#39;t &quot;bdc-udc&quot; redundant?<br></blockquote><div><br></=
div><div>I&#39;ll change the base name to &quot;brcm-udc&quot;</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Where does the version number come from?<br></blockquote><div>=C2=A0</div><=
div>I comes from an API version number in one of the hardware controller re=
gisters.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<span class=3D"gmail-"><br>
&gt; +- reg: the base register address and length<br>
&gt; +- interrupts: ther interrupt line for this controller<br>
<br>
</span>s/ther/the/<br></blockquote><div><br></div><div>Whoops, fixed.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +<br>
&gt; +On Broadcom STB platforms, these properties are required:<br>
&gt; +<br>
&gt; +- phys: phandle to the USB PHY blocks<br>
<br>
</span>How many?<br></blockquote><div><br></div><div>Either 1 or 2 dependin=
g on the Soc. I&#39;ll add a note to explain.=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +- clocks: phandle to the functional clock of this block<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 udc@f0b02000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &q=
uot;disabled&quot;;<br>
<br>
</span>Don&#39;t show status in examples.</blockquote><div><br></div><div>F=
ixed</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"gmail-yj6qo gmail-ajU"><div id=3D"gmail-:4gb" class=3D"gmai=
l-ajR" tabindex=3D"0"><img class=3D"gmail-ajT" src=3D"//ssl.gstatic.com/ui/=
v1/icons/mail/images/cleardot.gif"></div></div></blockquote></div><br>I&#39=
;ll re-send as v2 (including fix for &quot;Also, &quot;dt-bindings: usb: ..=
.&quot; for the subject.&quot;)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Thanks</div><div class=3D"gmail_extra">Al</div></=
div>

--f403045cc140f433390553bee4eb--
