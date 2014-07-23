Return-Path: <benoitm@perenite.com>
Content-Type: multipart/alternative; boundary="Apple-Mail=_54668375-23BB-4928-87F0-F44EAA8E79DF"
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
From: Benoit Masson <benoitm@perenite.com>
In-Reply-To: <20140723225841.GD28485@lunn.ch>
Date: Thu, 24 Jul 2014 01:11:12 +0200
Message-Id: <10A7C530-7CD2-4ED0-889A-7FAC1922320F@perenite.com>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com> <1406154923-13612-2-git-send-email-yahoo@perenite.com> <20140723224236.GC28485@lunn.ch> <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com> <20140723225841.GD28485@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_54668375-23BB-4928-87F0-F44EAA8E79DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

I sure do,

confirmed by u-boot  output below:

U-Boot 2009.08 (Mar 04 2013 - 11:13:04) Marvell version:  2.3.2 PQ
U-Boot Addressing:
       Code:..00600000:006BFFF0
       BSS:..00708EC0
       Stack:..0x5fff70
       PageTable:.0x8e0000
       Heap address:.0x900000:0xe00000
Board: DB-78230-BP rev 2.0 Wistron
SoC:   MV78230 A0

=46rom kernel I get:

mvebu-soc-id: MVEBU SoC ID=3D0x7823, Rev=3D0x1

Benoit
Le 24 juil. 2014 =E0 00:58, Andrew Lunn <andrew@lunn.ch> a =E9crit :

>> For the marvell,mv78230-a0-i2c unfortunately i've spend 3 hours
>> trying to understand this but it only works with this on the
>> ix4-300d :(. There was multiple patch around this and maybe one
>> broke the auto-detect part of this, I've tried compiling with some
>> 3.10 or lower kernel but no luck here I still have to put this a0
>> option.
>=20
> Lets first confirm you have an a0 SoC.
>=20
> At boot time, it should print:
>=20
> pr_info("MVEBU SoC ID=3D0x%X, Rev=3D0x%X\n", soc_dev_id, soc_rev);
>=20
> What revision do you have?
>=20
> If the auto detect code really is broken, Gregory will likely take a
> look.
>=20
> 	Andrew


--Apple-Mail=_54668375-23BB-4928-87F0-F44EAA8E79DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">I sure =
do,<div><br></div><div>confirmed by u-boot &nbsp;output =
below:</div><div><br></div><div><span style=3D"color: rgb(0, 102, 0); =
font-family: Monaco, 'Courier New', monospace; font-size: 11px; =
line-height: 18px; background-color: rgb(250, 250, 250);">U-Boot 2009.08 =
(Mar 04 2013 - 11:13:04) Marvell version:&nbsp; 2.3.2 PQ</span><br =
style=3D"margin: 0px; padding: 0px; color: rgb(0, 102, 0); font-family: =
Monaco, 'Courier New', monospace; font-size: 11px; line-height: =
18px;"><span style=3D"color: rgb(0, 102, 0); font-family: Monaco, =
'Courier New', monospace; font-size: 11px; line-height: 18px; =
background-color: rgb(250, 250, 250);">U-Boot Addressing:</span><br =
style=3D"margin: 0px; padding: 0px; color: rgb(0, 102, 0); font-family: =
Monaco, 'Courier New', monospace; font-size: 11px; line-height: =
18px;"><span style=3D"color: rgb(0, 102, 0); font-family: Monaco, =
'Courier New', monospace; font-size: 11px; line-height: 18px; =
background-color: rgb(250, 250, 250);">&nbsp; &nbsp; &nbsp; =
&nbsp;Code:..00600000:006BFFF0</span><br style=3D"margin: 0px; padding: =
0px; color: rgb(0, 102, 0); font-family: Monaco, 'Courier New', =
monospace; font-size: 11px; line-height: 18px;"><span style=3D"color: =
rgb(0, 102, 0); font-family: Monaco, 'Courier New', monospace; =
font-size: 11px; line-height: 18px; background-color: rgb(250, 250, =
250);">&nbsp; &nbsp; &nbsp; &nbsp;BSS:..00708EC0</span><br =
style=3D"margin: 0px; padding: 0px; color: rgb(0, 102, 0); font-family: =
Monaco, 'Courier New', monospace; font-size: 11px; line-height: =
18px;"><span style=3D"color: rgb(0, 102, 0); font-family: Monaco, =
'Courier New', monospace; font-size: 11px; line-height: 18px; =
background-color: rgb(250, 250, 250);">&nbsp; &nbsp; &nbsp; =
&nbsp;Stack:..0x5fff70</span><br style=3D"margin: 0px; padding: 0px; =
color: rgb(0, 102, 0); font-family: Monaco, 'Courier New', monospace; =
font-size: 11px; line-height: 18px;"><span style=3D"color: rgb(0, 102, =
0); font-family: Monaco, 'Courier New', monospace; font-size: 11px; =
line-height: 18px; background-color: rgb(250, 250, 250);">&nbsp; &nbsp; =
&nbsp; &nbsp;PageTable:.0x8e0000</span><br style=3D"margin: 0px; =
padding: 0px; color: rgb(0, 102, 0); font-family: Monaco, 'Courier New', =
monospace; font-size: 11px; line-height: 18px;"><span style=3D"color: =
rgb(0, 102, 0); font-family: Monaco, 'Courier New', monospace; =
font-size: 11px; line-height: 18px; background-color: rgb(250, 250, =
250);">&nbsp; &nbsp; &nbsp; &nbsp;Heap =
address:.0x900000:0xe00000</span><br style=3D"margin: 0px; padding: 0px; =
color: rgb(0, 102, 0); font-family: Monaco, 'Courier New', monospace; =
font-size: 11px; line-height: 18px;"><span style=3D"color: rgb(0, 102, =
0); font-family: Monaco, 'Courier New', monospace; font-size: 11px; =
line-height: 18px; background-color: rgb(250, 250, 250);">Board: =
DB-78230-BP rev 2.0 Wistron</span><br style=3D"margin: 0px; padding: =
0px; color: rgb(0, 102, 0); font-family: Monaco, 'Courier New', =
monospace; font-size: 11px; line-height: 18px;"><span style=3D"color: =
rgb(0, 102, 0); font-family: Monaco, 'Courier New', monospace; =
font-size: 11px; line-height: 18px; background-color: rgb(250, 250, =
250);">SoC:&nbsp; &nbsp;MV78230 A0</span></div><div><br></div><div>=46rom =
kernel I get:</div><div><br></div><div><font color=3D"#006600" =
face=3D"Monaco, Courier New, monospace"><span style=3D"background-color: =
rgb(250, 250, 250);"><span style=3D"font-size: 11px; line-height: =
18px;">mvebu-soc-id: MVEBU SoC ID=3D0x7823, =
Rev=3D0x1</span></span></font></div><div><font color=3D"#006600" =
face=3D"Monaco, Courier New, monospace"><span style=3D"background-color: =
rgb(250, 250, 250);"><span style=3D"font-size: 11px; line-height: =
18px;"><br></span></span></font></div><div>Benoit<font color=3D"#006600" =
face=3D"Monaco, Courier New, monospace"><span style=3D"background-color: =
rgb(250, 250, 250);"><span style=3D"font-size: 11px; line-height: =
18px;"><br></span></span></font><div><div>Le 24 juil. 2014 =E0 00:58, =
Andrew Lunn &lt;<a href=3D"mailto:andrew@lunn.ch">andrew@lunn.ch</a>&gt; =
a =E9crit :</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><blockquote type=3D"cite">For the marvell,mv78230-a0-i2c =
unfortunately i've spend 3 hours<br>trying to understand this but it =
only works with this on the<br>ix4-300d :(. There was multiple patch =
around this and maybe one<br>broke the auto-detect part of this, I've =
tried compiling with some<br>3.10 or lower kernel but no luck here I =
still have to put this a0<br>option.<br></blockquote><br>Lets first =
confirm you have an a0 SoC.<br><br>At boot time, it should =
print:<br><br>pr_info("MVEBU SoC ID=3D0x%X, Rev=3D0x%X\n", soc_dev_id, =
soc_rev);<br><br>What revision do you have?<br><br>If the auto detect =
code really is broken, Gregory will likely take a<br>look.<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Andrew<br></blockquote></div><br></div></body></html>=

--Apple-Mail=_54668375-23BB-4928-87F0-F44EAA8E79DF--
