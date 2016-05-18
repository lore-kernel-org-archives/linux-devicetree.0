From: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: PATH[1/3] ARM: axp20x_usb_power.c add device
 tree configuration options for REG 30H: VBUS-IPSOUT
Date: Tue, 17 May 2016 21:02:08 -0700 (PDT)
Message-ID: <f3023f2f-0506-4285-b75a-278f4562aed8@googlegroups.com>
References: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
 <671c7471-b63a-40cc-989f-6b20f00571ee@googlegroups.com> <35a39bdc-1304-403d-b56a-a45bb8debf5e@googlegroups.com>
 <CAGRGNgX7A3bx9Dam2j1ovdf4s8L9GTi3DM4zMeyu0x3b0wwCgA@mail.gmail.com>
Reply-To: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_6218_734589929.1463544128428"
Return-path: <linux-sunxi+bncBDC4H35J54ORBQOS564QKGQEFX7SWDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgX7A3bx9Dam2j1ovdf4s8L9GTi3DM4zMeyu0x3b0wwCgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_6218_734589929.1463544128428
Content-Type: multipart/alternative;
	boundary="----=_Part_6219_2034665531.1463544128428"

------=_Part_6219_2034665531.1463544128428
Content-Type: text/plain; charset=UTF-8

hello

thanks for your feedback. i will apply those corrections. 

"What does this actually do? Is this the lower limit on the voltage? Is 
this the voltage it'll try to maintain? "  - yes, vhold-set is the lowest 
input value that AXP20X will accept on V_USB. If the voltage, under load, 
drops under that configured value then the V_USB power path is 
disconnected. 

"Again, what does this actually do? It looks like the current limit? " - 
yes, ibus-limit is the maximum current that the system can draw from the 
V_USB line if  the vhold condition is satisfied.

i should add these details in axp20x_usb_power.txt 

On Wednesday, May 18, 2016 at 2:21:25 AM UTC+3, Julian Calaby wrote:
>
> Hi Ene, 
>
> On Wed, May 18, 2016 at 3:50 AM, Ene Alexandru <ene.al...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 
> <javascript:>> wrote: 
> > the documentation is updated to describe how to convert actual values to 
> the 
> > provided parameters 
> > 
> > --- 
> > diff -uprN -X linux-sunxi-original/Documentation/dontdiff 
> > 
> linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
>
> > 
> linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
>
> > --- 
> > 
> linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
>
> > 2016-05-09 16:48:46.000000000 +0200 
> > +++ 
> > 
> linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
>
> > 2016-05-11 13:05:58.995873267 +0200 
> > @@ -5,6 +5,26 @@ Required Properties: 
> >  This node is a subnode of the axp20x PMIC. 
> > +The following 3 parameters are configurable from the device-tree: 
> > +          - vhold-enable 
> > +                      - bit 6 of register REG 30H: VBUS-IPSOUT Power 
> Path 
> > Management 
>
> I don't think it's necessary to go into this much detail here. 
>
> > +                      - available values are: 
> > +                                  - 0x00 : VBUS VHOLD voltage limiting 
> > control disabled 
> > +                                  - 0x01 : VBUS VHOLD voltage limiting 
> > control enabled 
>
> If these are the only options available, why not make this property a 
> boolean? 
>
> > +          - vhold-set 
> > +                      - bits <5-3> of register REG 30H: VBUS-IPSOUT 
> Power 
> > Path Management 
> > +                      - available values are from 0x00 to 0x07 
> > +                      - VHOLD = [4000000 + ( vhold-set & 0x07 ) * 
> 100000] 
> > in uV 
>
> What does this actually do? Is this the lower limit on the voltage? Is 
> this the voltage it'll try to maintain? 
>
> > +          - ibus-limit 
> > +                      - bits <1-0> of register REG 30H: VBUS-IPSOUT 
> Power 
> > Path Management 
> > +                      - available values are : 
> > +                                  - 0x00 : 900000uA 
> > +                                  - 0x01 : 500000uA 
> > +                                  - 0x02 : 100000uA 
> > +                                  - 0x03 : unlimited 
>
> Again, what does this actually do? It looks like the current limit? 
>
> > + 
> > + 
>
> Extra blank line. 
>
> > Example: 
> >  axp209: pmic@34 { 
> > @@ -30,5 +50,8 @@ axp209: pmic@34 { 
> >             usb-power-supply: usb-power-supply { 
> >                        compatible = "x-powers,axp202-usb-power-supply"; 
> > +                      vhold-enable = <0x01>; 
> > +                      vhold-set = <0x04>; 
> > +                      ibus-limit = <0x01>; 
> >            }; 
> > }; 
>
> Thanks, 
>
> -- 
> Julian Calaby 
>
> Email: julian...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:> 
> Profile: http://www.google.com/profiles/julian.calaby/ 
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_6219_2034665531.1463544128428
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello<div><br></div><div>thanks for your feedback. i will =
apply those corrections.=C2=A0</div><div><br></div><div>&quot;What does thi=
s actually do? Is this the lower limit on the voltage? Is this the voltage =
it&#39;ll try to maintain?=C2=A0&quot; =C2=A0- yes, vhold-set is the lowest=
 input value that AXP20X will accept on V_USB. If the voltage, under load, =
drops under that configured value then the V_USB power path is disconnected=
.=C2=A0</div><div><br></div><div>&quot;Again, what does this actually do? I=
t looks like the current limit?=C2=A0&quot; - yes, ibus-limit is the maximu=
m current that the system can draw from the V_USB line if =C2=A0the vhold c=
ondition is satisfied.</div><div><br></div><div>i should add these details =
in=C2=A0axp20x_usb_power.txt=C2=A0</div><div><br></div><div>On Wednesday, M=
ay 18, 2016 at 2:21:25 AM UTC+3, Julian Calaby wrote:<blockquote class=3D"g=
mail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc sol=
id;padding-left: 1ex;">Hi Ene,
<br>
<br>On Wed, May 18, 2016 at 3:50 AM, Ene Alexandru &lt;<a href=3D"javascrip=
t:" target=3D"_blank" gdf-obfuscated-mailto=3D"EibazwpbAgAJ" rel=3D"nofollo=
w" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=
=3D"this.href=3D&#39;javascript:&#39;;return true;">ene.al...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>=
&gt; wrote:
<br>&gt; the documentation is updated to describe how to convert actual val=
ues to the
<br>&gt; provided parameters
<br>&gt;
<br>&gt; ---
<br>&gt; diff -uprN -X linux-sunxi-original/<wbr>Documentation/dontdiff
<br>&gt; linux-sunxi-original/<wbr>Documentation/devicetree/<wbr>bindings/p=
ower_supply/axp20x_<wbr>usb_power.txt
<br>&gt; linux-sunxi/Documentation/<wbr>devicetree/bindings/power_<wbr>supp=
ly/axp20x_usb_power.txt
<br>&gt; ---
<br>&gt; linux-sunxi-original/<wbr>Documentation/devicetree/<wbr>bindings/p=
ower_supply/axp20x_<wbr>usb_power.txt
<br>&gt; 2016-05-09 16:48:46.000000000 +0200
<br>&gt; +++
<br>&gt; linux-sunxi/Documentation/<wbr>devicetree/bindings/power_<wbr>supp=
ly/axp20x_usb_power.txt
<br>&gt; 2016-05-11 13:05:58.995873267 +0200
<br>&gt; @@ -5,6 +5,26 @@ Required Properties:
<br>&gt; =C2=A0This node is a subnode of the axp20x PMIC.
<br>&gt; +The following 3 parameters are configurable from the device-tree:
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- vhold-enable
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- bit 6 of register REG 30H: VBUS-IPSOUT Power Path
<br>&gt; Management
<br>
<br>I don&#39;t think it&#39;s necessary to go into this much detail here.
<br>
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- available values are:
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x00 : VBUS VHOLD =
voltage limiting
<br>&gt; control disabled
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x01 : VBUS VHOLD =
voltage limiting
<br>&gt; control enabled
<br>
<br>If these are the only options available, why not make this property a b=
oolean?
<br>
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- vhold-set
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- bits &lt;5-3&gt; of register REG 30H: VBUS-IPSOUT Power
<br>&gt; Path Management
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- available values are from 0x00 to 0x07
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- VHOLD =3D [4000000 + ( vhold-set &amp; 0x07 ) * 100000]
<br>&gt; in uV
<br>
<br>What does this actually do? Is this the lower limit on the voltage? Is
<br>this the voltage it&#39;ll try to maintain?
<br>
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- ibus-limit
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- bits &lt;1-0&gt; of register REG 30H: VBUS-IPSOUT Power
<br>&gt; Path Management
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- available values are :
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x00 : 900000uA
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x01 : 500000uA
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x02 : 100000uA
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x03 : unlimited
<br>
<br>Again, what does this actually do? It looks like the current limit?
<br>
<br>&gt; +
<br>&gt; +
<br>
<br>Extra blank line.
<br>
<br>&gt; Example:
<br>&gt; =C2=A0axp209: pmic@34 {
<br>&gt; @@ -30,5 +50,8 @@ axp209: pmic@34 {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb-power-supply: usb-po=
wer-supply {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0compatible =3D &quot;x-powers,axp202-usb-power-<wbr>supply=
&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0vhold-enable =3D &lt;0x01&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0vhold-set =3D &lt;0x04&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ibus-limit =3D &lt;0x01&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
<br>&gt; };
<br>
<br>Thanks,
<br>
<br>--=20
<br>Julian Calaby
<br>
<br>Email: <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"EibazwpbAgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">julian...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>
<br>Profile: <a href=3D"http://www.google.com/profiles/julian.calaby/" targ=
et=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.g=
oogle.com/profiles/julian.calaby/&#39;;return true;" onclick=3D"this.href=
=3D&#39;http://www.google.com/profiles/julian.calaby/&#39;;return true;">ht=
tp://www.google.com/<wbr>profiles/julian.calaby/</a>
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_6219_2034665531.1463544128428--

------=_Part_6218_734589929.1463544128428--
