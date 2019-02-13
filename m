Return-Path: <SRS0=JCJA=QU=mellanox.com=lsun@kernel.org>
From: Liming Sun <lsun@mellanox.com>
Subject: Re: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Wed, 13 Feb 2019 13:34:53 +0000
Message-ID: 
 <DB6PR05MB3223AD04997CCB8D58D48ED7A1660@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: 
 <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1548696487-8840-1-git-send-email-lsun@mellanox.com>
 <1548696487-8840-2-git-send-email-lsun@mellanox.com>,<CAHp75VeByqLAr3hakCTSO_M3xjUyt=A0bPgpWeSV62Vomcrsog@mail.gmail.com>
In-Reply-To: 
 <CAHp75VeByqLAr3hakCTSO_M3xjUyt=A0bPgpWeSV62Vomcrsog@mail.gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR05MB3223AD04997CCB8D58D48ED7A1660DB6PR05MB3223eurp_"
MIME-Version: 1.0
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_DB6PR05MB3223AD04997CCB8D58D48ED7A1660DB6PR05MB3223eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Andy!


V9 has been posted with the devm_ changes and coding style fixes according =
to the received comments in the other patch. It also has changes for commen=
ts from Vadim during Mellanox internal review.


Regards,

Liming


________________________________
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Sent: Tuesday, January 29, 2019 5:06 PM
To: Liming Sun
Cc: Rob Herring; Mark Rutland; Arnd Bergmann; David Woods; Andy Shevchenko;=
 Darren Hart; Vadim Pasternak; devicetree; Linux Kernel Mailing List; Platf=
orm Driver
Subject: Re: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellan=
ox BlueField Soc

On Mon, Jan 28, 2019 at 7:28 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This commit adds the TmFifo platform driver for Mellanox BlueField
> Soc. TmFifo is a shared FIFO which enables external host machine
> to exchange data with the SoC via USB or PCIe. The driver is based
> on virtio framework and has console and network access enabled.
>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>


Please, go through this series taking into account review I just did
for your another patch.

On top of that, see recent (for few years I think) drivers what modern
APIs they are using, e.g. devm_.

--
With Best Regards,
Andy Shevchenko

--_000_DB6PR05MB3223AD04997CCB8D58D48ED7A1660DB6PR05MB3223eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Thanks Andy! <br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">V9 has been posted with the devm_=
 changes and coding style fixes according to the received comments in the o=
ther patch. It also has changes for comments from Vadim during Mellanox int=
ernal review.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Regards,</p>
<p style=3D"margin-top:0;margin-bottom:0">Liming<br>
</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Andy Shevchenko &lt=
;andy.shevchenko@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, January 29, 2019 5:06 PM<br>
<b>To:</b> Liming Sun<br>
<b>Cc:</b> Rob Herring; Mark Rutland; Arnd Bergmann; David Woods; Andy Shev=
chenko; Darren Hart; Vadim Pasternak; devicetree; Linux Kernel Mailing List=
; Platform Driver<br>
<b>Subject:</b> Re: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for=
 Mellanox BlueField Soc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jan 28, 2019 at 7:28 PM Liming Sun &lt;lsu=
n@mellanox.com&gt; wrote:<br>
&gt;<br>
&gt; This commit adds the TmFifo platform driver for Mellanox BlueField<br>
&gt; Soc. TmFifo is a shared FIFO which enables external host machine<br>
&gt; to exchange data with the SoC via USB or PCIe. The driver is based<br>
&gt; on virtio framework and has console and network access enabled.<br>
&gt;<br>
&gt; Reviewed-by: David Woods &lt;dwoods@mellanox.com&gt;<br>
&gt; Signed-off-by: Liming Sun &lt;lsun@mellanox.com&gt;<br>
<br>
<br>
Please, go through this series taking into account review I just did<br>
for your another patch.<br>
<br>
On top of that, see recent (for few years I think) drivers what modern<br>
APIs they are using, e.g. devm_.<br>
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DB6PR05MB3223AD04997CCB8D58D48ED7A1660DB6PR05MB3223eurp_--
