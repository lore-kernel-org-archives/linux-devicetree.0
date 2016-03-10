Return-Path: <chauveau.julien@gmail.com>
Content-Type: multipart/alternative; boundary="Apple-Mail=_6E8FFC76-30B7-4E49-A997-F226F22FF04B"
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH RESEND] Documentation: devicetree: Clean up gpio-keys example
From: Julien Chauveau <chauveau.julien@gmail.com>
In-Reply-To: <56DEA4D6.10008@suse.de>
Date: Fri, 11 Mar 2016 00:04:02 +0100
Message-Id: <A4C88C30-6A45-420E-B583-14890D3A8BB6@gmail.com>
References: <1457375055-5544-1-git-send-email-afaerber@suse.de> <CAMuHMdVMVYaygvKd3qgTz2fF9SuLA_zEYRoZZrJO+2zmP=jxag@mail.gmail.com> <56DEA4D6.10008@suse.de>
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, LAKML <linux-arm-kernel@lists.infradead.org>, =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_6E8FFC76-30B7-4E49-A997-F226F22FF04B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Le 8 mars 2016 =C3=A0 11:09, Andreas F=C3=A4rber <afaerber@suse.de> a =
=C3=A9crit :
>=20
> Am 08.03.2016 um 09:54 schrieb Geert Uytterhoeven:
>> On Mon, Mar 7, 2016 at 7:24 PM, Andreas F=C3=A4rber =
<afaerber@suse.de> wrote:
>>> Drop #address-cells and #size-cells, which are not required by the
>>> gpio-keys binding documentation, as button sub-nodes are not =
devices.
>>>=20
>>> Reported-by: Julien Chauveau <chauveau.julien@gmail.com>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>> Documentation/devicetree/bindings/input/gpio-keys.txt | 2 --
>>> 1 file changed, 2 deletions(-)
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/input/gpio-keys.txt =
b/Documentation/devicetree/bindings/input/gpio-keys.txt
>>> index 21641236c095..1552a11f6786 100644
>>> --- a/Documentation/devicetree/bindings/input/gpio-keys.txt
>>> +++ b/Documentation/devicetree/bindings/input/gpio-keys.txt
>>> @@ -34,8 +34,6 @@ Example nodes:
>>>=20
>>>        gpio_keys {
>=20
> While at it, I was told the preferred node naming would be dashes, not
> underscores. The deeper we dig, the more we find.

I agree, here we should use dashes, not underscores. So "gpio-keys" =
instead of "gpio_keys".

>=20
>>>                        compatible =3D "gpio-keys";
>>> -                       #address-cells =3D <1>;
>>> -                       #size-cells =3D <0>;
>>>                        autorepeat;
>=20
> Also a white line here may be optically more pleasant.

I agree.

>=20
>>>                        button@21 {
>>=20
>> FYI, with "[PATCH] scripts/dtc: Update to upstream version =
53bf130b1cdd":
>> (http://www.spinics.net/lists/devicetree/msg117206.html =
<http://www.spinics.net/lists/devicetree/msg117206.html>) applied:
>>=20
>> Warning (unit_address_vs_reg): Node /keyboard/button@21 has a unit
>> name, but no reg property
>=20
> My v2 GeekBox patch did have *-cells and a reg property, but Julien
> asked I drop that: https://patchwork.kernel.org/patch/8246481/ =
<https://patchwork.kernel.org/patch/8246481/>
>=20
> Are you suggesting we should add a reg property here and drop this =
patch
> or go with this patch but follow up to not use @21?

I may be wrong but I think that if the unit-address has no meaning and =
is not used, then it should be removed.

By the way, I think the warning message is wrong. It should be _address_ =
instead of name: "Node has a unit address, but no reg property".

Julien=

--Apple-Mail=_6E8FFC76-30B7-4E49-A997-F226F22FF04B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">Le 8 mars 2016 =C3=A0 11:09, Andreas F=C3=A4rber &lt;<a =
href=3D"mailto:afaerber@suse.de" class=3D"">afaerber@suse.de</a>&gt; a =
=C3=A9crit :</div><br class=3D"Apple-interchange-newline"><div =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Am 08.03.2016 um 09:54 schrieb Geert =
Uytterhoeven:</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">On Mon, =
Mar 7, 2016 at 7:24 PM, Andreas F=C3=A4rber &lt;<a =
href=3D"mailto:afaerber@suse.de" class=3D"">afaerber@suse.de</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Drop =
#address-cells and #size-cells, which are not required by the<br =
class=3D"">gpio-keys binding documentation, as button sub-nodes are not =
devices.<br class=3D""><br class=3D"">Reported-by: Julien Chauveau =
&lt;<a href=3D"mailto:chauveau.julien@gmail.com" =
class=3D"">chauveau.julien@gmail.com</a>&gt;<br class=3D"">Signed-off-by: =
Andreas F=C3=A4rber &lt;<a href=3D"mailto:afaerber@suse.de" =
class=3D"">afaerber@suse.de</a>&gt;<br class=3D"">---<br =
class=3D"">Documentation/devicetree/bindings/input/gpio-keys.txt | 2 =
--<br class=3D"">1 file changed, 2 deletions(-)<br class=3D""><br =
class=3D"">diff --git =
a/Documentation/devicetree/bindings/input/gpio-keys.txt =
b/Documentation/devicetree/bindings/input/gpio-keys.txt<br =
class=3D"">index 21641236c095..1552a11f6786 100644<br class=3D"">--- =
a/Documentation/devicetree/bindings/input/gpio-keys.txt<br class=3D"">+++ =
b/Documentation/devicetree/bindings/input/gpio-keys.txt<br class=3D"">@@ =
-34,8 +34,6 @@ Example nodes:<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpio_keys {<br =
class=3D""></blockquote></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">While at it, I was told the preferred =
node naming would be dashes, not</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">underscores. The deeper we dig, the more =
we find.</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>I agree, =
here we should use dashes, not underscores. So "gpio-keys" instead of =
"gpio_keys".</div><br class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;compatible =3D "gpio-keys";<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#address-cells =
=3D &lt;1&gt;;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#size-cells =3D =
&lt;0&gt;;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;autorepeat;<br class=3D""></blockquote></blockquote><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Also a white line here may =
be optically more pleasant.</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>I =
agree.</div><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;button@21 {<br class=3D""></blockquote><br class=3D"">FYI, with =
"[PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd":<br =
class=3D"">(<a =
href=3D"http://www.spinics.net/lists/devicetree/msg117206.html" =
class=3D"">http://www.spinics.net/lists/devicetree/msg117206.html</a>) =
applied:<br class=3D""><br class=3D"">Warning (unit_address_vs_reg): =
Node /keyboard/button@21 has a unit<br class=3D"">name, but no reg =
property<br class=3D""></blockquote><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">My v2 GeekBox patch did have *-cells and a reg =
property, but Julien</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">asked I drop that:<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"https://patchwork.kernel.org/patch/8246481/" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">https://patchwork.kernel.org/patch/8246481/</a><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Are you suggesting we should add a reg =
property here and drop this patch</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">or go with this patch but follow up to =
not use @21?</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote></div><br class=3D""><div class=3D"">I may =
be wrong but I think that if the unit-address has no meaning and is not =
used, then it should be removed.</div><div class=3D""><br =
class=3D""></div><div class=3D"">By the way, I think the warning message =
is wrong. It should be _address_ instead of name: "Node has a unit =
address, but no reg property".</div><div class=3D""><br =
class=3D""></div><div class=3D"">Julien</div></body></html>=

--Apple-Mail=_6E8FFC76-30B7-4E49-A997-F226F22FF04B--
