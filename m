Return-Path: <SRS0=YgUL=JG=gmail.com=toddpoynor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLZXwD7SEmJYPZpRXZcdmS6XwPOdVY_M22Q+cV0xX7E9Q@mail.gmail.com>
References: <20180619014608.92061-1-toddpoynor@gmail.com> <CAL_JsqLZXwD7SEmJYPZpRXZcdmS6XwPOdVY_M22Q+cV0xX7E9Q@mail.gmail.com>
From: Todd Poynor <toddpoynor@gmail.com>
Date: Tue, 19 Jun 2018 19:28:48 -0700
Message-ID: <CAO3upoafgOZzrWHqdLiJUSJWM754niV5bKv+-WNu1pboMw53Zg@mail.gmail.com>
Subject: Re: [PATCH] of/platform: add initcall_debug logs for device creates
Content-Type: multipart/alternative; boundary="000000000000153716056f098faa"
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Todd Poynor <toddpoynor@google.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000153716056f098faa
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 7:33 AM, Rob Herring <robh+dt@kernel.org> wrote:

> It's really the probe time that matters here. Outside of that,
> creating the devices should be fairly constant time. So why not add
> timing around non bus specific probe code (driver_probe_device)
> instead of adding this in multiple places. Then you can remove the
> timing from deferred probe code.
>

Will do, thanks.


Todd

--000000000000153716056f098faa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 19, 2018 at 7:33 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:robh+dt@kernel.org" target=3D"_blank">robh+dt@kernel.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
</span>It&#39;s really the probe time that matters here. Outside of that,<b=
r>
creating the devices should be fairly constant time. So why not add<br>
timing around non bus specific probe code (driver_probe_device)<br>
instead of adding this in multiple places. Then you can remove the<br>
timing from deferred probe code.<span class=3D"HOEnZb"><font color=3D"#8888=
88"><br></font></span></blockquote><div><br></div><div>Will do, thanks.<br>=
<br><br></div><div>Todd<br>=C2=A0<br></div></div><br><br clear=3D"all"><br>=
<br></div></div>

--000000000000153716056f098faa--
