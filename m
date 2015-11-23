From: Thomas Kaiser <thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Mon, 23 Nov 2015 02:35:48 -0800 (PST)
Message-ID: <ec251773-e70f-45e3-bb2b-86d2e27c90b3@googlegroups.com>
References: <1448046713-13579-1-git-send-email-hdegoede@redhat.com>
 <20151122195925.GR32142@lukather>
 <5652CE10.1020808@redhat.com>
Reply-To: thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_10_1900352844.1448274948155"
Return-path: <linux-sunxi+bncBDQ6N3ODDQIIJWGLWICRUBA4Y5TZG-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5652CE10.1020808-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_10_1900352844.1448274948155
Content-Type: multipart/alternative;
	boundary="----=_Part_11_69937953.1448274948155"

------=_Part_11_69937953.1448274948155
Content-Type: text/plain; charset=UTF-8

Hi,

Hans de Goede wrote:

> On 22-11-15 20:59, Maxime Ripard wrote: 
> >> +&cpu0 { 
> >> +        cpu-supply = <&reg_dcdc2>; 
> >> +        operating-points = < 
> >> +                /* kHz          uV */ 
> >> +                960000        1400000 
> >> +                912000        1400000 
> >> +                864000        1350000 
> >> +                720000        1250000 
> >> +                528000        1150000 
> >> +                312000        1100000 
> >> +                144000        1050000 
> >> +                >; 
> > 
> > Why are you using a custom set of OPPs here, the default ones were 
> > unstable? 
>
> The fex file uses non standard OPPs
>

Which fex file? In case you're referring to an 'official' one please  
keep in mind how SinoVoip 'develops' stuff. By doing copy&paste 
(remember the .dts for the Banana Pi M2?). Anyway, the fex files used 
by R1 users since a year contain comparable OPPs:

https://github.com/igorpecovnik/lib/blob/next/config/lamobo-r1.fex
https://github.com/Bananian/fex/blob/master/BPI-R1/script.fex

Stuff contained in official SinoVoip OS images can not be regarded 
safe or even tested since noone uses these OS images due to being 
broken more or less. And Lamobo R1 users that were relying on mainline 
kernel the last months already used a .dts sharing the default OPPs: 

https://github.com/igorpecovnik/lib/blob/next/patch/sun7i-a20-lamobo-r1.dts

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_11_69937953.1448274948155
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Hans de Goede wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pad=
ding-left: 1ex;">On 22-11-15 20:59, Maxime Ripard wrote:
<br>&gt;&gt; +&amp;cpu0 {
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpu-supply =
=3D &lt;&amp;reg_dcdc2&gt;;
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0operating-poi=
nts =3D &lt;
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* kHz=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0uV */
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0960000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01400000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0912000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01400000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0864000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01350000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0720000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01250000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0528000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01150000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0312000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01100000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0144000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A01050000
<br>&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&gt;;
<br>&gt;
<br>&gt; Why are you using a custom set of OPPs here, the default ones were
<br>&gt; unstable?
<br>
<br>The fex file uses non standard OPPs<br></blockquote><div><br></div><div=
><div>Which fex file? In case you&#39;re referring to an &#39;official&#39;=
 one please =C2=A0</div><div>keep in mind how SinoVoip &#39;develops&#39; s=
tuff. By doing copy&amp;paste=C2=A0</div><div>(remember the .dts for the Ba=
nana Pi M2?). Anyway, the fex files used=C2=A0</div><div>by R1 users since =
a year contain comparable OPPs:</div><div><br></div><div>https://github.com=
/igorpecovnik/lib/blob/next/config/lamobo-r1.fex</div><div>https://github.c=
om/Bananian/fex/blob/master/BPI-R1/script.fex</div><div><br></div><div>Stuf=
f contained in official SinoVoip OS images can not be regarded=C2=A0</div><=
div>safe or even tested since noone uses these OS images due to being=C2=A0=
</div><div>broken more or less. And Lamobo R1 users that were relying on ma=
inline=C2=A0</div><div>kernel the last months already used a .dts sharing t=
he default OPPs:=C2=A0</div><div><br></div><div>https://github.com/igorpeco=
vnik/lib/blob/next/patch/sun7i-a20-lamobo-r1.dts</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_11_69937953.1448274948155--

------=_Part_10_1900352844.1448274948155--
