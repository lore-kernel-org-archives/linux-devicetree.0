Return-Path: <chauveau.julien@gmail.com>
Content-Type: multipart/alternative; boundary="Apple-Mail=_35CD269A-8FD1-4077-B372-12A509E8CF16"
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH RESEND] Documentation: devicetree: Clean up gpio-keys example
From: Julien Chauveau <chauveau.julien@gmail.com>
In-Reply-To: <56DEA67E.8090704@suse.de>
Date: Fri, 11 Mar 2016 00:03:53 +0100
Message-Id: <2BDE50C0-6A46-4E34-B57A-A32370DF43EB@gmail.com>
References: <1457375055-5544-1-git-send-email-afaerber@suse.de> <CAMuHMdVMVYaygvKd3qgTz2fF9SuLA_zEYRoZZrJO+2zmP=jxag@mail.gmail.com> <525564DD-D0D3-4DEB-9306-3A23288FD83F@gmail.com> <56DEA67E.8090704@suse.de>
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, LAKML <linux-arm-kernel@lists.infradead.org>, =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_35CD269A-8FD1-4077-B372-12A509E8CF16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Le 8 mars 2016 =C3=A0 11:16, Andreas F=C3=A4rber <afaerber@suse.de> a =
=C3=A9crit :
>=20
> Am 08.03.2016 um 10:41 schrieb Julien Chauveau:
>> Le 8 mars 2016 =C3=A0 09:54, Geert Uytterhoeven =
<geert@linux-m68k.org> a =C3=A9crit :
>>> On Mon, Mar 7, 2016 at 7:24 PM, Andreas F=C3=A4rber =
<afaerber@suse.de> wrote:
>>>> Drop #address-cells and #size-cells, which are not required by the
>>>> gpio-keys binding documentation, as button sub-nodes are not =
devices.
>>>>=20
>>>> Reported-by: Julien Chauveau <chauveau.julien@gmail.com>
>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>> ---
>>>> Documentation/devicetree/bindings/input/gpio-keys.txt | 2 --
>>>> 1 file changed, 2 deletions(-)
>>>>=20
>>>> diff --git a/Documentation/devicetree/bindings/input/gpio-keys.txt =
b/Documentation/devicetree/bindings/input/gpio-keys.txt
>>>> index 21641236c095..1552a11f6786 100644
>>>> --- a/Documentation/devicetree/bindings/input/gpio-keys.txt
>>>> +++ b/Documentation/devicetree/bindings/input/gpio-keys.txt
>>>> @@ -34,8 +34,6 @@ Example nodes:
>>>>=20
>>>>       gpio_keys {
>>>>                       compatible =3D "gpio-keys";
>>>> -                       #address-cells =3D <1>;
>>>> -                       #size-cells =3D <0>;
>>>>                       autorepeat;
>>>>                       button@21 {
>>>=20
>>> FYI, with "[PATCH] scripts/dtc: Update to upstream version =
53bf130b1cdd":
>>> (http://www.spinics.net/lists/devicetree/msg117206.html) applied:
>>>=20
>>> Warning (unit_address_vs_reg): Node /keyboard/button@21 has a unit
>>> name, but no reg property
>>>=20
>>=20
>> Hi Andreas,
>> This means you can also drop the unit-address (the @21 part) for the =
button.
>> What about using a more relevant name like "key_up" instead of =
"button"?
>=20
> Or in my case power-key or power-button. Or would just power suffice?

For the example nodes of the documentation, according to the labels =
you=E2=80=99ll probably want to use "up" and "down" (or "key-up" and =
"key-down", or "up-key" and "down-key").

For the Geekbox, I think "power" is meaningful enough.

>=20
> The Landingship baseboard does have four more buttons not yet enabled,
> so I do need some way to distinguish nodes.

The labels on the board are key1, key2, key3 and key4. Maybe you can use =
that?



--Apple-Mail=_35CD269A-8FD1-4077-B372-12A509E8CF16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">Le 8 mars 2016 =C3=A0 11:16, Andreas F=C3=A4rber &lt;<a =
href=3D"mailto:afaerber@suse.de" class=3D"">afaerber@suse.de</a>&gt; a =
=C3=A9crit :</div><br class=3D"Apple-interchange-newline"><div =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Am 08.03.2016 um 10:41 schrieb Julien =
Chauveau:</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">Le 8 mars =
2016 =C3=A0 09:54, Geert Uytterhoeven &lt;<a =
href=3D"mailto:geert@linux-m68k.org" =
class=3D"">geert@linux-m68k.org</a>&gt; a =C3=A9crit :<br =
class=3D""><blockquote type=3D"cite" class=3D"">On Mon, Mar 7, 2016 at =
7:24 PM, Andreas F=C3=A4rber &lt;<a href=3D"mailto:afaerber@suse.de" =
class=3D"">afaerber@suse.de</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Drop #address-cells and #size-cells, which are =
not required by the<br class=3D"">gpio-keys binding documentation, as =
button sub-nodes are not devices.<br class=3D""><br =
class=3D"">Reported-by: Julien Chauveau &lt;<a =
href=3D"mailto:chauveau.julien@gmail.com" =
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
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpio_keys {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;compa=
tible =3D "gpio-keys";<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#address-cells =
=3D &lt;1&gt;;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#size-cells =3D =
&lt;0&gt;;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;autor=
epeat;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;butto=
n@21 {<br class=3D""></blockquote><br class=3D"">FYI, with "[PATCH] =
scripts/dtc: Update to upstream version 53bf130b1cdd":<br class=3D"">(<a =
href=3D"http://www.spinics.net/lists/devicetree/msg117206.html" =
class=3D"">http://www.spinics.net/lists/devicetree/msg117206.html</a>) =
applied:<br class=3D""><br class=3D"">Warning (unit_address_vs_reg): =
Node /keyboard/button@21 has a unit<br class=3D"">name, but no reg =
property<br class=3D""><br class=3D""></blockquote><br class=3D"">Hi =
Andreas,<br class=3D"">This means you can also drop the unit-address =
(the @21 part) for the button.<br class=3D"">What about using a more =
relevant name like "key_up" instead of "button"?<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Or in my case power-key or power-button. Or =
would just power suffice?</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>For the =
example nodes of the documentation, according to the labels you=E2=80=99ll=
 probably want to use "up" and "down" (or "key-up" and "key-down", or =
"up-key" and "down-key").</div><div><br class=3D""></div><div>For the =
Geekbox, I think "power" is meaningful enough.</div><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">The Landingship baseboard =
does have four more buttons not yet enabled,</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">so I do need some way to =
distinguish nodes.</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><br class=3D""></div><div>The labels on =
the board are key1, key2, key3 and key4. Maybe you can use =
that?</div><br class=3D""><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_35CD269A-8FD1-4077-B372-12A509E8CF16--
