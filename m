Return-Path: <noamca@mellanox.com>
From: Noam Camus <noamca@mellanox.com>
Subject: Re: [PATCH v4 2/3] clocksource: update "fn" at
 CLOCKSOURCE_OF_DECLARE() of nps400 timer
Date: Sat, 12 Nov 2016 14:54:07 +0000
Message-ID: <VI1PR0501MB25263747E76B1FAC1AA25C89AABA0@VI1PR0501MB2526.eurprd05.prod.outlook.com>
References: <1478454298-381-1-git-send-email-noamca@mellanox.com>
 <1478454298-381-3-git-send-email-noamca@mellanox.com>,<20161111232639.GA1619@mai>
In-Reply-To: <20161111232639.GA1619@mai>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0501MB25263747E76B1FAC1AA25C89AABA0VI1PR0501MB2526_"
MIME-Version: 1.0
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_VI1PR0501MB25263747E76B1FAC1AA25C89AABA0VI1PR0501MB2526_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> Sent: Saturday, November 12, 2016 1:26 AM

>
...

>>
>> -     nps_timer_rate =3D clk_get_rate(clk);
>> -
>> -     ret =3D clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
>> -                                 nps_timer_rate, 301, 32, nps_clksrc_re=
ad);
>> +     ret =3D clocksource_mmio_init(nps_msu_reg_low_addr, "nps-tick",
>> +                                 nps_timer1_freq, 301, 32, nps_clksrc_r=
ead);

>301 ?
This is historically when this driver reside by ARC driver and I wish to ov=
erride it.
Now that we have DT control I will restore back the legacy 300 value.
All your comments will be applied in V5

-Noam



--_000_VI1PR0501MB25263747E76B1FAC1AA25C89AABA0VI1PR0501MB2526_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p><font color=3D"#000000" face=3D"Calibri, sans-serif" style=3D"font-size:=
11pt"><b>&gt; From:</b> Daniel Lezcano &lt;daniel.lezcano@linaro.org&gt;<br=
>
<b>&gt; Sent:</b> Saturday, November 12, 2016 1:26 AM<br>
</font></p>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div style=3D"color: rgb(0, 0, 0);">
<div class=3D"PlainText">&gt;&nbsp; <br>
...</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">&gt;&gt;&nbsp; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; nps_timer_rate =3D clk_get_rate(clk);<br=
>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D clocksource_mmio_init(nps_msu_re=
g_low_addr, &quot;EZnps-tick&quot;,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nps_timer_rate, 301, 3=
2, nps_clksrc_read);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D clocksource_mmio_init(nps_ms=
u_reg_low_addr, &quot;nps-tick&quot;,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nps_timer1_freq, 3=
01, 32, nps_clksrc_read);<br>
<br>
&gt;301 ?<br>
</div>
<div class=3D"PlainText">This is historically when this driver reside by AR=
C driver and I wish to override it.</div>
<div class=3D"PlainText">Now that we have DT control I will restore back th=
e legacy 300 value.</div>
<div class=3D"PlainText">All your comments will be applied in V5</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">-Noam<br>
</div>
<div class=3D"PlainText"><br>
<br>
</div>
</div>
</span></font>
<div style=3D"color: rgb(0, 0, 0);"></div>
</div>
</body>
</html>

--_000_VI1PR0501MB25263747E76B1FAC1AA25C89AABA0VI1PR0501MB2526_--
