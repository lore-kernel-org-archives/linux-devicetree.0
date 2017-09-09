Return-Path: <SRS0=grPw=AK=gmail.com=onlywig@kernel.org>
MIME-Version: 1.0
In-Reply-To: <15d92b9d-bc50-df11-a434-e4d04a8e191c@suse.de>
References: <1504949591-14022-1-git-send-email-onlywig@gmail.com> <15d92b9d-bc50-df11-a434-e4d04a8e191c@suse.de>
From: "onlywig ." <onlywig@gmail.com>
Date: Sat, 9 Sep 2017 19:17:11 +0800
Message-ID: <CAPStFe6Le0o4XWcso72F0tfRE_wvjgiXiAw4c5zSakXF+8GK7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Add nutsboard to vendor prefix.
Content-Type: multipart/alternative; boundary="001a114776accb6cd30558bfd500"
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, treding@nvidia.com, jic23@kernel.org, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a114776accb6cd30558bfd500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017-09-09 18:05 GMT+08:00 Andreas F=C3=A4rber <afaerber@suse.de>:

> Hi YuanCheng,
>
> Usually such a vendor prefix patch is part of a series, with later
> patches making use of the prefix for some compatible string in a binding
> document and in some Device Tree. What will this prefix be used for?
>
> Are you affiliated with the company? If not, you should consider CC'ing
> nutsboard@gmail.com to allow them to comment.
>
> Am 09.09.2017 um 11:33 schrieb Wig C:
> > From: YuanCheng Cheng <onlywig@gmail.com>
> >
>
> Please add a sentence about the company here.
>
> > Signed-off-by: YuanCheng Cheng <onlywig@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index daf465be..7746dbc 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -230,6 +230,7 @@ nintendo  Nintendo
> >  nlt  NLT Technologies, Ltd.
> >  nokia        Nokia
> >  nordic       Nordic Semiconductor
> > +nutsboard    NutsBoard
>
> I don't spot any more specific company name on nutsboard.org
> (LLC/Inc/Corp/...), so the entry looks okay.
>
> >  nuvoton      Nuvoton Technology Corporation
> >  nvd  New Vision Display
> >  nvidia       NVIDIA
>
> Regards,
> Andreas
>
> --
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=C3=BCrnberg)
>

Hello Andreas:

This prefix will be used at:
https://patchwork.kernel.org/patch/9945311/ (WIP)

And yes, I'm NutsBoard owner, I will add add a sentence about the company
in the patch and upload again, thanks for your comments.

Wig

--001a114776accb6cd30558bfd500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-09-09 18:05 GMT+08:00 Andreas F=C3=A4rber <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:afaerber@suse.de" target=3D"_blank">afaerber@suse.de</a>&gt=
;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi YuanCheng=
,<br>
<br>
Usually such a vendor prefix patch is part of a series, with later<br>
patches making use of the prefix for some compatible string in a binding<br=
>
document and in some Device Tree. What will this prefix be used for?<br>
<br>
Are you affiliated with the company? If not, you should consider CC&#39;ing=
<br>
<a href=3D"mailto:nutsboard@gmail.com">nutsboard@gmail.com</a> to allow the=
m to comment.<br>
<br>
Am 09.09.2017 um 11:33 schrieb Wig C:<br>
&gt; From: YuanCheng Cheng &lt;<a href=3D"mailto:onlywig@gmail.com">onlywig=
@gmail.com</a>&gt;<br>
&gt;<br>
<br>
Please add a sentence about the company here.<br>
<span class=3D"gmail-"><br>
&gt; Signed-off-by: YuanCheng Cheng &lt;<a href=3D"mailto:onlywig@gmail.com=
">onlywig@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/<wbr>bindings/vendor-prefixes.txt | 1 +=
<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/vendor-prefixes.tx=
t b/Documentation/devicetree/<wbr>bindings/vendor-prefixes.txt<br>
&gt; index daf465be..7746dbc 100644<br>
&gt; --- a/Documentation/devicetree/<wbr>bindings/vendor-prefixes.txt<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/vendor-prefixes.txt<br>
&gt; @@ -230,6 +230,7 @@ nintendo=C2=A0 Nintendo<br>
&gt;=C2=A0 nlt=C2=A0 NLT Technologies, Ltd.<br>
&gt;=C2=A0 nokia=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nokia<br>
&gt;=C2=A0 nordic=C2=A0 =C2=A0 =C2=A0 =C2=A0Nordic Semiconductor<br>
&gt; +nutsboard=C2=A0 =C2=A0 NutsBoard<br>
<br>
</span>I don&#39;t spot any more specific company name on <a href=3D"http:/=
/nutsboard.org" rel=3D"noreferrer" target=3D"_blank">nutsboard.org</a><br>
(LLC/Inc/Corp/...), so the entry looks okay.<br>
<span class=3D"gmail-"><br>
&gt;=C2=A0 nuvoton=C2=A0 =C2=A0 =C2=A0 Nuvoton Technology Corporation<br>
&gt;=C2=A0 nvd=C2=A0 New Vision Display<br>
&gt;=C2=A0 nvidia=C2=A0 =C2=A0 =C2=A0 =C2=A0NVIDIA<br>
<br>
</span>Regards,<br>
Andreas<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton<br>
HRB 21284 (AG N=C3=BCrnberg)<br>
</font></span></blockquote></div></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Hello Andreas:<br><br>This prefix will be used =
at:<br><a href=3D"https://patchwork.kernel.org/patch/9945311/">https://patc=
hwork.kernel.org/patch/9945311/</a> (WIP)<br><br></div><div class=3D"gmail_=
extra">And yes, I&#39;m NutsBoard owner, I will add add a sentence about th=
e company in the patch and upload again, thanks for your comments.<br><br><=
/div><div class=3D"gmail_extra">Wig<br></div></div>

--001a114776accb6cd30558bfd500--
