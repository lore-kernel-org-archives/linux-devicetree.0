From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 14 Mar 2012 21:49:35 +0100
Message-ID: <20120314204935.GB12334@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-3-git-send-email-thierry.reding@avionic-design.de>
 <ADE657CA350FB648AAC2C43247A983F0020695DB57DC@AUSP01VMBX24.collaborationhost.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3001474250754362541=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F0020695DB57DC-gaq956PjLg32KbjnnMDalRurcAul1UnsRrxOEX5GOmysTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: H Hartley Sweeten <hartleys-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============3001474250754362541==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* H Hartley Sweeten wrote:
> On Wednesday, March 14, 2012 8:56 AM, Thierry Reding wrote:
[...]
> > +#ifdef CONFIG_DEBUG_FS
> > +	void			(*dbg_show)(struct pwm_chip *chip,
> > +					    struct seq_file *s);
> > +#endif
>=20
> This doesn't compile...
>=20
> include/linux/pwm.h:87: warning: 'struct seq_file' declared inside parame=
ter list
> include/linux/pwm.h:87: warning: its scope is only this definition or dec=
laration, which is probably not what you want

Okay, pwm.h probably needs a seq_file.h include. Thanks for noticing.

Thierry

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9hBF8ACgkQZ+BJyKLjJp9KwACff499kVkDhB/+YgUX9HhiMDad
BQEAn3G0vLtYb0xbljKGP5rolWN6HNS5
=V1Ih
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--

--===============3001474250754362541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3001474250754362541==--
