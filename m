Return-Path: <cvs268@gmail.com>
Date: Thu, 3 Mar 2016 03:58:45 -0800 (PST)
From: cvs268@gmail.com
Message-Id: <6c5c65d7-2cee-4e3f-a91c-c9fbd4c006c7@googlegroups.com>
In-Reply-To: <20160131140418.GD11885@pengutronix.de>
References: <1451927075-8656-1-git-send-email-s.trumtrar@pengutronix.de>
 <1451927075-8656-2-git-send-email-s.trumtrar@pengutronix.de>
 <20160131115457.GL20165@piout.net>
 <20160131140418.GD11885@pengutronix.de>
Subject: Re: [PATCH v4 2/2] rtc: add driver for RX6110SA real time clock
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_885_2103885592.1457006325641"
To: rtc-linux <rtc-linux@googlegroups.com>
Cc: alexandre.belloni@free-electrons.com, a.zummo@towertech.it, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, kernel@pengutronix.de, s.trumtrar@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

------=_Part_885_2103885592.1457006325641
Content-Type: multipart/alternative;
	boundary="----=_Part_886_2101094210.1457006325641"

------=_Part_886_2101094210.1457006325641
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 

> > > If the need ever arises to also support the I2C variant, this driver 
> > > could easily be refactored to support both cases. 
>
I will soon be getting an embedded board with this RX6110 RTC on it 
connected via I2C.
So i would like to take-up the task of adding I2C support in a few weeks.

A quick search shows drivers/rtc/rtc-rx4581.c was similarly written based 
on drivers/rtc/rtc-rx8581.c

Q. Should i proceed to create drivers/rtc/rtc-rx6110-i2c.c or whats the 
recommended approach?
I did not find any RTC driver that supports both i2c and spi (eg. depending 
upon some config option)

regards
CVS

------=_Part_886_2101094210.1457006325641
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0<br><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">&gt=
; &gt; If the need ever arises to also support the I2C variant, this driver
<br>&gt; &gt; could easily be refactored to support both cases.
<br></blockquote><div>I will soon be getting an embedded board with this RX=
6110 RTC on it connected via I2C.<br>So i would like to take-up the task of=
 adding I2C support in a few weeks.<br><br>A quick search shows drivers/rtc=
/rtc-rx4581.c was similarly written based on drivers/rtc/rtc-rx8581.c<br><b=
r>Q. Should i proceed to create drivers/rtc/rtc-rx6110-i2c.c or whats the r=
ecommended approach?<br>I did not find any RTC driver that supports both i2=
c and spi (eg. depending upon some config option)<br><br>regards<br>CVS<br>=
</div></div>
------=_Part_886_2101094210.1457006325641--

------=_Part_885_2103885592.1457006325641--
