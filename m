From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: Re: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 11 Dec 2012 09:57:51 +0100
Message-ID: <1406670.ryvqfkiNXS@barack>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <3193669.Hv54bBklsP@barack>
 <20121211083632.GC27084@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2486505040375853936=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121211083632.GC27084-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2486505040375853936==
Content-Type: multipart/alternative; boundary="nextPart1493525.XFdZNMqJj5"
Content-Transfer-Encoding: 7Bit

--nextPart1493525.XFdZNMqJj5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On Tuesday 11 December 2012 09:36:35 Thierry Reding wrote:
> > > The commit message says that legacy mode is used as fallback if
> > > devm_get_pwm() (that should really be devm_pwm_get() btw) fails b=
ut I
> > > don't see where pwm_request() is called.
> >=20
> > Oh, true. The fallback has been removed based on earlier comment fr=
om
> > Bryan
> > Wu. I will correct the commit message.
>=20
> I'm not so sure that's a good idea. After all there may still be user=
s
> who rely on the legacy behaviour.

The only user of leds_pwm is arch/arm/mach-omap2/board-4430sdp.c. Even =
that is=20
not working because it uses wrong ID number to request the pwm.
The legacy request type needs the id number of the PWM it want to use. =
But if=20
you have multiple PWM devices there is not way to guess the ID for the =
PWM.=20
Using the pwm_get() along with pwm_lookup is the only way to get thing=20=

working.
For example with twl4030 we have 2 PWM chips, both provides 2 PWMs. The=
 ID=20
number of the PWMs will depend on the load order of the drivers. If the=
y are=20
built in they are going to be in the same order most of the time, but i=
f they=20
are modules they can be loaded in different order.

I think we should not use fallback in leds-pwm to avoid new boards to u=
se the=20
legacy API.

--
P=E9ter
--nextPart1493525.XFdZNMqJj5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="ISO-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/=
REC-html40/strict.dtd">
<html><head><meta name=3D"qrichtext" content=3D"1" /><style type=3D"tex=
t/css">
p, li { white-space: pre-wrap; }
</style></head><body style=3D" font-family:'Bitstream Vera Sans Mono'; =
font-size:9pt; font-weight:400; font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
Tuesday 11 December 2012 09:36:35 Thierry Reding wrote:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; The commit message says that legacy mode is used as fallbac=
k if</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; devm_get_pwm() (that should really be devm_pwm_get() btw) f=
ails but I</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &gt; don't see where pwm_request() is called.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Oh, true. The fallback has been removed based on earlier comment=
 from</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Bryan</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Wu. I will correct the commit message.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; I'm not so sure that's a good idea. After all there may still be user=
s</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; who rely on the legacy behaviour.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">The=
 only user of leds_pwm is arch/arm/mach-omap2/board-4430sdp.c. Even tha=
t is not working because it uses wrong ID number to request the pwm.</p=
>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">The=
 legacy request type needs the id number of the PWM it want to use. But=
 if you have multiple PWM devices there is not way to guess the ID for =
the PWM. Using the pwm_get() along with pwm_lookup is the only way to g=
et thing working.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">For=
 example with twl4030 we have 2 PWM chips, both provides 2 PWMs. The ID=
 number of the PWMs will depend on the load order of the drivers. If th=
ey are built in they are going to be in the same order most of the time=
, but if they are modules they can be loaded in different order.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I t=
hink we should not use fallback in leds-pwm to avoid new boards to use =
the legacy API.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">--<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">P=E9=
ter</p></body></html>
--nextPart1493525.XFdZNMqJj5--

--===============2486505040375853936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2486505040375853936==--
