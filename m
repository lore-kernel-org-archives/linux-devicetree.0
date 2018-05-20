From: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH RFC 06/24] drm/lima: add lima uapi header
Date: Sun, 20 May 2018 15:22:08 +0800
Message-ID: <CAKGbVbtoA3k8naOVLCH0xddFD=3PqWF-67F6xx2_t0bsjNRneQ@mail.gmail.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-7-yuq825@gmail.com>
 <a2f2311c-7473-e857-a4e6-1c3e7c44aeaf@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0382619960=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a2f2311c-7473-e857-a4e6-1c3e7c44aeaf@denx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Vasut <marex@denx.de>
Cc: Simon Shields <simon@lineageos.org>, devicetree@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Andrei Paulau <7134956@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============0382619960==
Content-Type: multipart/alternative; boundary="000000000000059764056c9e0b2d"

--000000000000059764056c9e0b2d
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 5:33 PM, Marek Vasut <marex@denx.de> wrote:

> On 05/18/2018 11:27 AM, Qiang Yu wrote:
>
> Commit message is missing
>
> > Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > ---
> >  include/uapi/drm/lima_drm.h | 195 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 195 insertions(+)
> >  create mode 100644 include/uapi/drm/lima_drm.h
> >
> > diff --git a/include/uapi/drm/lima_drm.h b/include/uapi/drm/lima_drm.h
> > new file mode 100644
> > index 000000000000..9df95e46fb2c
> > --- /dev/null
> > +++ b/include/uapi/drm/lima_drm.h
>
> Please convert this to the SPDX license identifiers, that is
>
> // SPDX...
>
> OK.


> > @@ -0,0 +1,195 @@
> > +/*
> > + * Copyright (C) 2017-2018 Lima Project
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a
> > + * copy of this software and associated documentation files (the
> "Software"),
> > + * to deal in the Software without restriction, including without
> limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
>
> [...]
>
> > +#if defined(__cplusplus)
> > +extern "C" {
> > +#endif
>
> Is this C++ stuff needed ?
>

This file is used by both kernel and user space programs, so I added this
following other xxx_drm.h files here.


>
> [...]
>
> > +#define LIMA_SUBMIT_FLAG_EXPLICIT_FENCE (1 << 0)
> > +#define LIMA_SUBMIT_FLAG_SYNC_FD_OUT    (1 << 1)
>
> BIT(0) and BIT(1) if applicable
>

I can use BIT() for kernel only files but not this user/kernel shared one,
because I see BIT is defined in the kernel only, user need to define it if
this file use it.


> [...]
>
> --
> Best regards,
> Marek Vasut
>

Regards,
Qiang

--000000000000059764056c9e0b2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 18, 2018 at 5:33 PM, Marek Vasut <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 05/18/2018 11:27 AM, Qiang Yu =
wrote:<br>
<br>
Commit message is missing<br>
<span class=3D""><br>
&gt; Signed-off-by: Qiang Yu &lt;<a href=3D"mailto:yuq825@gmail.com">yuq825=
@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/uapi/drm/lima_drm.h | 195 ++++++++++++++++++++++++++++++=
<wbr>++++++<br>
&gt;=C2=A0 1 file changed, 195 insertions(+)<br>
&gt;=C2=A0 create mode 100644 include/uapi/drm/lima_drm.h<br>
&gt; <br>
&gt; diff --git a/include/uapi/drm/lima_drm.h b/include/uapi/drm/lima_drm.h=
<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9df95e46fb2c<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/uapi/drm/lima_drm.h<br>
<br>
</span>Please convert this to the SPDX license identifiers, that is<br>
<br>
// SPDX...<br>
<span class=3D""><br></span></blockquote><div>OK.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">
&gt; @@ -0,0 +1,195 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2017-2018 Lima Project<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
<br>
</span>[...]<br>
<span class=3D""><br>
&gt; +#if defined(__cplusplus)<br>
&gt; +extern &quot;C&quot; {<br>
&gt; +#endif<br>
<br>
</span>Is this C++ stuff needed ?<br></blockquote><div>=C2=A0</div><div>Thi=
s file is used by both kernel and user space programs, so I added this</div=
><div>following other xxx_drm.h files here.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
[...]<br>
<span class=3D""><br>
&gt; +#define LIMA_SUBMIT_FLAG_EXPLICIT_<wbr>FENCE (1 &lt;&lt; 0)<br>
&gt; +#define LIMA_SUBMIT_FLAG_SYNC_FD_OUT=C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
<br>
</span>BIT(0) and BIT(1) if applicable<br></blockquote><div><br></div><div>=
I can use BIT() for kernel only files but not this user/kernel shared one,<=
/div><div>because I see BIT is defined in the kernel only, user need to def=
ine it if</div><div>this file use it.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
[...]<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
Best regards,<br>
Marek Vasut<br></font></span></blockquote><div><br></div><div>Regards,</div=
><div>Qiang=C2=A0</div></div><br></div></div>

--000000000000059764056c9e0b2d--

--===============0382619960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0382619960==--
