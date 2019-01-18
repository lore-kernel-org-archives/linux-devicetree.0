Return-Path: <SRS0=GEAD=P2=mellanox.com=lsun@kernel.org>
From: Liming Sun <lsun@mellanox.com>
Subject: Re: [PATCH v7 1/3] mmc: dw_mmc-bluefield: Add driver extension
Date: Fri, 18 Jan 2019 18:14:35 +0000
Message-ID: 
 <DB6PR05MB32230324D81D42AFDFD6BDB8A19C0@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: 
 <026fa942828c54fda5bad225981e56abc808b949.1524497286.git.lsun@mellanox.com>
 <1525805210-15246-1-git-send-email-lsun@mellanox.com>,<alpine.DEB.2.21.1901181059100.1647@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1901181059100.1647@nanos.tec.linutronix.de>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR05MB32230324D81D42AFDFD6BDB8A19C0DB6PR05MB3223eurp_"
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jaehoon Chung <jh80.chung@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, David Woods <dwoods@mellanox.com>
List-ID: <devicetree@vger.kernel.org>

--_000_DB6PR05MB32230324D81D42AFDFD6BDB8A19C0DB6PR05MB3223eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Thomas!


A code review has just been sent out to fix this license information. Pleas=
e let me know if you still see issues.


Regards,

Liming


________________________________
From: Thomas Gleixner <tglx@linutronix.de>
Sent: Friday, January 18, 2019 5:06 AM
To: Liming Sun
Cc: Ulf Hansson; Rob Herring; Mark Rutland; Jaehoon Chung; Catalin Marinas;=
 Will Deacon; linux-mmc@vger.kernel.org; devicetree@vger.kernel.org; LKML; =
Greg KH; Kate Stewart
Subject: Re: [PATCH v7 1/3] mmc: dw_mmc-bluefield: Add driver extension

>Liming,
>
>On Tue, 8 May 2018, Liming Sun wrote:
>> index 0000000..54c3fbb
>> --- /dev/null
>> +++ b/drivers/mmc/host/dw_mmc-bluefield.c
>> @@ -0,0 +1,81 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2018 Mellanox Technologies.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>
>This license information is broken. The SPDX license identifier and the
>boiler plate text are contradicting. The SPDX id is GPL v2 only and the
>boiler plate says v2 or later.
>
>Please decide which version you want and fix ASAP. If you fix that up
>please add a Fixes: tag and cc stable. While at it please remove the boile=
r
>plate text as the SPDX id is sufficient and the boiler plate is redundant
>information.
>
>See Documentation/process/license-rules.txt
>
>Thanks,
>
>        tglx

--_000_DB6PR05MB32230324D81D42AFDFD6BDB8A19C0DB6PR05MB3223eurp_
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
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,&quot;EmojiFont&quot;=
,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&q=
uot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0">Thanks Thomas! <br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">A code review has just been sent=
 out to fix this license information. Please let me know if you still see i=
ssues.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Regards,</p>
<p style=3D"margin-top:0; margin-bottom:0">Liming<br>
</p>
<br>
<br>
<div style=3D"color:rgb(0,0,0)">
<hr style=3D"display:inline-block; width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Thomas Gleixner &lt=
;tglx@linutronix.de&gt;<br>
<b>Sent:</b> Friday, January 18, 2019 5:06 AM<br>
<b>To:</b> Liming Sun<br>
<b>Cc:</b> Ulf Hansson; Rob Herring; Mark Rutland; Jaehoon Chung; Catalin M=
arinas; Will Deacon; linux-mmc@vger.kernel.org; devicetree@vger.kernel.org;=
 LKML; Greg KH; Kate Stewart<br>
<b>Subject:</b> Re: [PATCH v7 1/3] mmc: dw_mmc-bluefield: Add driver extens=
ion</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&gt;Liming,<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>On Tue, 8=
 May 2018, Liming Sun wrote:<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; inde=
x 0000000..54c3fbb<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; --- =
/dev/null<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
;&#43;&#43; b/drivers/mmc/host/dw_mmc-bluefield.c<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; @@ -=
0,0 &#43;1,81 @@<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
;// SPDX-License-Identifier: GPL-2.0<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
;/*<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; * Copyright (C) 2018 Mellanox Technologies.<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; *<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; * This program is free software; you can redistribute it and/or modify<br=
>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; * it under the terms of the GNU General Public License as published by<br=
>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; * the Free Software Foundation; either version 2 of the License, or<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; * (at your option) any later version.<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; &#43=
; */<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>This lice=
nse information is broken. The SPDX license identifier and the<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>boiler pl=
ate text are contradicting. The SPDX id is GPL v2 only and the<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>boiler pl=
ate says v2 or later.<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>Please de=
cide which version you want and fix ASAP. If you fix that up<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>please ad=
d a Fixes: tag and cc stable. While at it please remove the boiler<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>plate tex=
t as the SPDX id is sufficient and the boiler plate is redundant<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>informati=
on.<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>See Docum=
entation/process/license-rules.txt<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>Thanks,<b=
r>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font><br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tglx<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DB6PR05MB32230324D81D42AFDFD6BDB8A19C0DB6PR05MB3223eurp_--
