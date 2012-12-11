From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 11 Dec 2012 09:36:35 +0100
Message-ID: <20121211083632.GC27084@avionic-0098.adnet.avionic-design.de>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <1355133637-2784-2-git-send-email-peter.ujfalusi@ti.com>
 <20121211070307.GB8294@avionic-0098.adnet.avionic-design.de>
 <3193669.Hv54bBklsP@barack>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5197243072301597514=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3193669.Hv54bBklsP@barack>
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
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5197243072301597514==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 09:29:21AM +0100, Peter Ujfalusi wrote:
> On Tuesday 11 December 2012 08:03:07 Thierry Reding wrote:
> > On Mon, Dec 10, 2012 at 11:00:34AM +0100, Peter Ujfalusi wrote:
> > > Update the driver to use the new API for requesting pwm so we can take
> > > advantage of the pwm_lookup table to find the correct pwm to be used =
for
> > > the LED functionality.
> > > If the devm_get_pwm fails we fall back to legacy mode to try to get t=
he
> > > pwm.
> > >=20
> > > Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/leds/leds-pwm.c  | 19 ++++++-------------
> > >  include/linux/leds_pwm.h |  2 +-
> > >  2 files changed, 7 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > > index 2157524..351257c 100644
> > > --- a/drivers/leds/leds-pwm.c
> > > +++ b/drivers/leds/leds-pwm.c
> > > @@ -67,12 +67,11 @@ static int led_pwm_probe(struct platform_device *=
pdev)
> > >=20
> > >  		cur_led =3D &pdata->leds[i];
> > >  		led_dat =3D &leds_data[i];
> > >=20
> > > -		led_dat->pwm =3D pwm_request(cur_led->pwm_id,
> > > -				cur_led->name);
> > > +		led_dat->pwm =3D devm_pwm_get(&pdev->dev, cur_led->name);
> > >=20
> > >  		if (IS_ERR(led_dat->pwm)) {
> > >  	=09
> > >  			ret =3D PTR_ERR(led_dat->pwm);
> > >=20
> > > -			dev_err(&pdev->dev, "unable to request PWM %d\n",
> > > -					cur_led->pwm_id);
> > > +			dev_err(&pdev->dev, "unable to request PWM for %s\n",
> > > +				cur_led->name);
> > >=20
> > >  			goto err;
> > >  	=09
> > >  		}
> >=20
> > The commit message says that legacy mode is used as fallback if
> > devm_get_pwm() (that should really be devm_pwm_get() btw) fails but I
> > don't see where pwm_request() is called.
>=20
> Oh, true. The fallback has been removed based on earlier comment from Bry=
an=20
> Wu. I will correct the commit message.

I'm not so sure that's a good idea. After all there may still be users
who rely on the legacy behaviour.

Thierry

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxvCQAAoJEN0jrNd/PrOhG/UQAIi2y/4nZ9jysjd/hUMvP2HF
3Q9HeQIhFBocZVzI5KweSvOTpdP8/zJtoVZOAQGatHNSZuUC4Tth53umPMe0C/7d
6pHeZaBt1sBJBw34kIr+AReL0+KM7iiGf+nmZAVM+ZjfoNagGzi9dqGoqyrvTSlM
K/P+EYom16Zq8VsK8kF/qo37rP4ltcQPjeSRHTrC0VLNrYYeRwi1+rLu9DQ8nmbe
fOJ6LGbn//9/B3p0OrHyTz16BeRxQABWxZzUZhXRRzfwfISWix3kMnIhTcGJskYL
3zjDnA/Ug6/aoBx1Vkc/vN6e5Az9I+jl4S1ocC7kvuj9KciEfffKHDPYxov6KiSe
yDqLHVR95CAC2+aeO/x8D3khf3Zfxt/wv7VwRqi17x8SAZKJG8EXn5ow13d/IXlJ
giLaeP3dTrHKrfVSOaLQ2Te3qxxpupj0MCOfQZQ8yTRLlwmjpzFVzxVxvkCF+fjn
XEFZLirHrVh6i01QTmMIo83Q3VN67Bhv551BQy4rzgBYzpU3++85sAuuqT3hHk58
TANQMQ4xoLhOshhUhv6Bm5rE90zJMwcVlBfxH/pDn/5LVEoFrl1+CPZtVYk8g6aK
GCrnQrF3FojrW+C5NnCtJIAVMUFp61b4oRWEb4Sj/YemdXp/JISDqRFUkwOO+WPl
iNIvBkiShCjwjzuY0rbn
=tKtb
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--

--===============5197243072301597514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5197243072301597514==--
