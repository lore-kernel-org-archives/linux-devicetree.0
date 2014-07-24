Return-Path: <benoitm@perenite.com>
Content-Type: multipart/alternative; boundary="Apple-Mail=_D66E61CD-18D4-4B4F-893A-777AF68834E7"
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
From: Benoit Masson <benoitm@perenite.com>
In-Reply-To: <20140724124520.GV23220@titan.lakedaemon.net>
Date: Thu, 24 Jul 2014 15:40:42 +0200
Message-Id: <C2E7C8C1-1198-4785-AB9C-C27B5E27A8D4@perenite.com>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com> <1406154923-13612-2-git-send-email-yahoo@perenite.com> <20140723224236.GC28485@lunn.ch> <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com> <20140723225841.GD28485@lunn.ch> <10A7C530-7CD2-4ED0-889A-7FAC1922320F@perenite.com> <20140723231535.GK23220@titan.lakedaemon.net> <53D0FA2F.6050209@free-electrons.com> <20140724124520.GV23220@titan.lakedaemon.net>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Benoit Masson <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_D66E61CD-18D4-4B4F-893A-777AF68834E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

So I'm a bit puzzled now. First email from Jason mention that the  final =
patch was doe in 3.16rc3 and indeed I made my dts using 3.15, now I'm on =
3.16 mainline, but didn't tested since to remove the a0 compatible =
string. Should I give it a try or from Gregory's email understand that =
the patch was only for ax3 board ?

Feel free as long as the device is still opened, uart connected, to send =
me your test as I'll soon have to turn into a production NAS ...

Benoit=20
Le 24 juil. 2014 =E0 14:45, Jason Cooper <jason@lakedaemon.net> a =E9crit =
:

> On Thu, Jul 24, 2014 at 02:21:03PM +0200, Gregory CLEMENT wrote:
>> On 24/07/2014 01:15, Jason Cooper wrote:
>>> On Thu, Jul 24, 2014 at 01:11:12AM +0200, Benoit Masson wrote:
>>>> Le 24 juil. 2014 =E0 00:58, Andrew Lunn <andrew@lunn.ch> a =E9crit =
:
>>>>=20
>>>>>> For the marvell,mv78230-a0-i2c unfortunately i've spend 3 hours
>>>>>> trying to understand this but it only works with this on the
>>>>>> ix4-300d :(. There was multiple patch around this and maybe one
>>>>>> broke the auto-detect part of this, I've tried compiling with =
some
>>>>>> 3.10 or lower kernel but no luck here I still have to put this a0
>>>>>> option.
>>>>>=20
>>>>> Lets first confirm you have an a0 SoC.
>>>>>=20
>>>>> At boot time, it should print:
>>>>>=20
>>>>> pr_info("MVEBU SoC ID=3D0x%X, Rev=3D0x%X\n", soc_dev_id, soc_rev);
>>>>>=20
>>>>> What revision do you have?
>>>>>=20
>>>>> If the auto detect code really is broken, Gregory will likely take =
a
>>>>> look.
>>>>=20
>>>> I sure do,
>>>>=20
>>>> confirmed by u-boot  output below:
>>>>=20
>>>> U-Boot 2009.08 (Mar 04 2013 - 11:13:04) Marvell version:  2.3.2 PQ
>>>> U-Boot Addressing:
>>>>       Code:..00600000:006BFFF0
>>>>       BSS:..00708EC0
>>>>       Stack:..0x5fff70
>>>>       PageTable:.0x8e0000
>>>>       Heap address:.0x900000:0xe00000
>>>> Board: DB-78230-BP rev 2.0 Wistron
>>>> SoC:   MV78230 A0
>>>>=20
>>>> =46rom kernel I get:
>>>>=20
>>>> mvebu-soc-id: MVEBU SoC ID=3D0x7823, Rev=3D0x1
>>>=20
>>> Well, isn't that a peach?  :)  Gregory?
>>=20
>> A peach?? For me it is either a fruit or a princess, so I am puzzled!
>=20
> Doc Holiday quote from the movie Tombstone.  The full quote was "Well,
> isn't that a peach of a hand?" while sitting at the poker table.
>=20
>> Well about the issue, we patch the device tree for the i2c quirk only =
for
>> the openblock AX3.
>=20
> Ahhh, that's right.  I need to slow down and dig a bit more. :(
>=20
>> If I remember well it was because the device tree was already written
>> for this board before we found there was an issue with the A0 version
>> of the CPU.=20
>=20
> No, it's because we didn't think any manufacturers would be silly =
enough
> to use the a0 in production.  That assumption worked out well. :-P
>=20
>> The rule was that for new boards then they have to set the =
marvell,mv78230-a0-i2c
>> compatible string. I also didn't expect that we found "new" product =
using the A0 version.
>>=20
>> We have 3 options now:
>>=20
>> - remove the check on the openblock AX3 board and always try to apply =
the quirck for A0 version
>> - add a check for this new board in the mvebu_dt_init function
>> - let the compatible string marvell,mv78230-a0-i2c in this dts
>>=20
>> I would prefer the option 1 but I fear that Arnd would prefer the 2 =
other options.
>=20
> I like option 1 and 3.  Option 3 is a *correct* description of the
> hardware, and should be done.  Option 1 makes Linux user-friendly for =
boards
> that are exactly the same, but changed out SoC stepping =
mid-production.
>=20
> Option 2 needs to be undone.  We shouldn't need to change compiled =
code
> for every new board that comes along.  Which was the whole point of =
DT,
> right?
>=20
> thx,
>=20
> Jason.


--Apple-Mail=_D66E61CD-18D4-4B4F-893A-777AF68834E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">So I'm =
a bit puzzled now. First email from Jason mention that the &nbsp;final =
patch was doe in 3.16rc3 and indeed I made my dts using 3.15, now I'm on =
3.16 mainline, but didn't tested since to remove the a0 compatible =
string. Should I give it a try or from Gregory's email understand that =
the patch was only for ax3 board ?<div><br></div><div>Feel free as long =
as the device is still opened, uart connected, to send me your test as =
I'll soon have to turn into a production NAS =
...</div><div><br></div><div>Benoit&nbsp;<br><div><div>Le 24 juil. 2014 =
=E0 14:45, Jason Cooper &lt;<a =
href=3D"mailto:jason@lakedaemon.net">jason@lakedaemon.net</a>&gt; a =
=E9crit :</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div style=3D"font-size: 14px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;">On Thu, Jul 24, 2014 at 02:21:03PM =
+0200, Gregory CLEMENT wrote:<br><blockquote type=3D"cite">On 24/07/2014 =
01:15, Jason Cooper wrote:<br><blockquote type=3D"cite">On Thu, Jul 24, =
2014 at 01:11:12AM +0200, Benoit Masson wrote:<br><blockquote =
type=3D"cite">Le 24 juil. 2014 =E0 00:58, Andrew Lunn &lt;<a =
href=3D"mailto:andrew@lunn.ch">andrew@lunn.ch</a>&gt; a =E9crit =
:<br><br><blockquote type=3D"cite"><blockquote type=3D"cite">For the =
marvell,mv78230-a0-i2c unfortunately i've spend 3 hours<br>trying to =
understand this but it only works with this on the<br>ix4-300d :(. There =
was multiple patch around this and maybe one<br>broke the auto-detect =
part of this, I've tried compiling with some<br>3.10 or lower kernel but =
no luck here I still have to put this =
a0<br>option.<br></blockquote><br>Lets first confirm you have an a0 =
SoC.<br><br>At boot time, it should print:<br><br>pr_info("MVEBU SoC =
ID=3D0x%X, Rev=3D0x%X\n", soc_dev_id, soc_rev);<br><br>What revision do =
you have?<br><br>If the auto detect code really is broken, Gregory will =
likely take a<br>look.<br></blockquote><br>I sure do,<br><br>confirmed =
by u-boot &nbsp;output below:<br><br>U-Boot 2009.08 (Mar 04 2013 - =
11:13:04) Marvell version: &nbsp;2.3.2 PQ<br>U-Boot =
Addressing:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code:..00600000:006BFFF=
0<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BSS:..00708EC0<br>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;Stack:..0x5fff70<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;PageTable:.0x8e0000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Heap =
address:.0x900000:0xe00000<br>Board: DB-78230-BP rev 2.0 Wistron<br>SoC: =
&nbsp;&nbsp;MV78230 A0<br><br>=46rom kernel I get:<br><br>mvebu-soc-id: =
MVEBU SoC ID=3D0x7823, Rev=3D0x1<br></blockquote><br>Well, isn't that a =
peach? &nbsp;:) &nbsp;Gregory?<br></blockquote><br>A peach?? For me it =
is either a fruit or a princess, so I am =
puzzled!<br></blockquote><br>Doc Holiday quote from the movie Tombstone. =
&nbsp;The full quote was "Well,<br>isn't that a peach of a hand?" while =
sitting at the poker table.<br><br><blockquote type=3D"cite">Well about =
the issue, we patch the device tree for the i2c quirk only for<br>the =
openblock AX3.<br></blockquote><br>Ahhh, that's right. &nbsp;I need to =
slow down and dig a bit more. :(<br><br><blockquote type=3D"cite">If I =
remember well it was because the device tree was already written<br>for =
this board before we found there was an issue with the A0 version<br>of =
the CPU.<span =
class=3D"Apple-converted-space">&nbsp;</span><br></blockquote><br>No, =
it's because we didn't think any manufacturers would be silly =
enough<br>to use the a0 in production. &nbsp;That assumption worked out =
well. :-P<br><br><blockquote type=3D"cite">The rule was that for new =
boards then they have to set the marvell,mv78230-a0-i2c<br>compatible =
string. I also didn't expect that we found "new" product using the A0 =
version.<br><br>We have 3 options now:<br><br>- remove the check on the =
openblock AX3 board and always try to apply the quirck for A0 =
version<br>- add a check for this new board in the mvebu_dt_init =
function<br>- let the compatible string marvell,mv78230-a0-i2c in this =
dts<br><br>I would prefer the option 1 but I fear that Arnd would prefer =
the 2 other options.<br></blockquote><br>I like option 1 and 3. =
&nbsp;Option 3 is a *correct* description of the<br>hardware, and should =
be done. &nbsp;Option 1 makes Linux user-friendly for boards<br>that are =
exactly the same, but changed out SoC stepping =
mid-production.<br><br>Option 2 needs to be undone. &nbsp;We shouldn't =
need to change compiled code<br>for every new board that comes along. =
&nbsp;Which was the whole point of =
DT,<br>right?<br><br>thx,<br><br>Jason.</div></blockquote></div><br></div>=
</body></html>=

--Apple-Mail=_D66E61CD-18D4-4B4F-893A-777AF68834E7--
