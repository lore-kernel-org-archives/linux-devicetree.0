From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 11 Dec 2012 09:29:21 +0100
Message-ID: <3193669.Hv54bBklsP@barack>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <1355133637-2784-2-git-send-email-peter.ujfalusi@ti.com>
 <20121211070307.GB8294@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8997253225246646045=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121211070307.GB8294-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
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

--===============8997253225246646045==
Content-Type: multipart/alternative; boundary="nextPart1438956.5CcucmlzIX"
Content-Transfer-Encoding: 7Bit

--nextPart1438956.5CcucmlzIX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On Tuesday 11 December 2012 08:03:07 Thierry Reding wrote:
> On Mon, Dec 10, 2012 at 11:00:34AM +0100, Peter Ujfalusi wrote:
> > Update the driver to use the new API for requesting pwm so we can t=
ake
> > advantage of the pwm_lookup table to find the correct pwm to be use=
d for
> > the LED functionality.
> > If the devm_get_pwm fails we fall back to legacy mode to try to get=
 the
> > pwm.
> >=20
> > Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> > ---
> >=20
> >  drivers/leds/leds-pwm.c  | 19 ++++++-------------
> >  include/linux/leds_pwm.h |  2 +-
> >  2 files changed, 7 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index 2157524..351257c 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -67,12 +67,11 @@ static int led_pwm_probe(struct platform_device=
 *pdev)
> >=20
> >  =09=09cur_led =3D &pdata->leds[i];
> >  =09=09led_dat =3D &leds_data[i];
> >=20
> > -=09=09led_dat->pwm =3D pwm_request(cur_led->pwm_id,
> > -=09=09=09=09cur_led->name);
> > +=09=09led_dat->pwm =3D devm_pwm_get(&pdev->dev, cur_led->name);
> >=20
> >  =09=09if (IS_ERR(led_dat->pwm)) {
> >  =09=09
> >  =09=09=09ret =3D PTR_ERR(led_dat->pwm);
> >=20
> > -=09=09=09dev_err(&pdev->dev, "unable to request PWM %d\n",
> > -=09=09=09=09=09cur_led->pwm_id);
> > +=09=09=09dev_err(&pdev->dev, "unable to request PWM for %s\n",
> > +=09=09=09=09cur_led->name);
> >=20
> >  =09=09=09goto err;
> >  =09=09
> >  =09=09}
>=20
> The commit message says that legacy mode is used as fallback if
> devm_get_pwm() (that should really be devm_pwm_get() btw) fails but I=

> don't see where pwm_request() is called.

Oh, true. The fallback has been removed based on earlier comment from B=
ryan=20
Wu. I will correct the commit message.

--
P=E9ter
--nextPart1438956.5CcucmlzIX
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
Tuesday 11 December 2012 08:03:07 Thierry Reding wrote:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; On Mon, Dec 10, 2012 at 11:00:34AM +0100, Peter Ujfalusi wrote:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Update the driver to use the new API for requesting pwm so we ca=
n take</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; advantage of the pwm_lookup table to find the correct pwm to be =
used for</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; the LED functionality.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; If the devm_get_pwm fails we fall back to legacy mode to try to =
get the</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; pwm.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Signed-off-by: Peter Ujfalusi &lt;peter.ujfalusi-l0cyMroinI0@public.gmane.org&gt;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; ---</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  drivers/leds/leds-pwm.c  | 19 ++++++-------------</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  include/linux/leds_pwm.h |  2 +-</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  2 files changed, 7 insertions(+), 14 deletions(-)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; index 2157524..351257c 100644</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; --- a/drivers/leds/leds-pwm.c</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; +++ b/drivers/leds/leds-pwm.c</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; @@ -67,12 +67,11 @@ static int led_pwm_probe(struct platform_dev=
ice *pdev)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09cur_led =3D &amp;pdata-&gt;leds[i];</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09led_dat =3D &amp;leds_data[i];</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; -=09=09led_dat-&gt;pwm =3D pwm_request(cur_led-&gt;pwm_id,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; -=09=09=09=09cur_led-&gt;name);</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; +=09=09led_dat-&gt;pwm =3D devm_pwm_get(&amp;pdev-&gt;dev, cur_l=
ed-&gt;name);</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09if (IS_ERR(led_dat-&gt;pwm)) {</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09=09ret =3D PTR_ERR(led_dat-&gt;pwm);</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; -=09=09=09dev_err(&amp;pdev-&gt;dev, &quot;unable to request PWM=
 %d\n&quot;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; -=09=09=09=09=09cur_led-&gt;pwm_id);</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; +=09=09=09dev_err(&amp;pdev-&gt;dev, &quot;unable to request PWM=
 for %s\n&quot;,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; +=09=09=09=09cur_led-&gt;name);</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09=09goto err;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt;  =09=09}</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; The commit message says that legacy mode is used as fallback if</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; devm_get_pwm() (that should really be devm_pwm_get() btw) fails but I=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; don't see where pwm_request() is called.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Oh,=
 true. The fallback has been removed based on earlier comment from Brya=
n Wu. I will correct the commit message.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">--<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">P=E9=
ter</p></body></html>
--nextPart1438956.5CcucmlzIX--

--===============8997253225246646045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8997253225246646045==--
