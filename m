From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: Add empty of_property_match_string() function
Date: Fri, 27 Apr 2012 22:41:54 +0200
Message-ID: <20120427204154.GA12617@avionic-0098.mockup.avionic-design.de>
References: <1334327016-8949-1-git-send-email-thierry.reding@avionic-design.de>
 <20120426190112.GA28018@avionic-0098.mockup.avionic-design.de>
 <20120427164554.2F7E33E0B4D@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359234801351774399=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120427164554.2F7E33E0B4D@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0359234801351774399==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Grant Likely wrote:
> On Thu, 26 Apr 2012 21:01:12 +0200, Thierry Reding <thierry.reding@avioni=
c-design.de> wrote:
> > * Thierry Reding wrote:
> > > This commit adds an empty of_property_match_string() function for
> > > !CONFIG_OF builds.
> >=20
> > Grant, Rob,
> >=20
> > can these two patches be queued for 3.5? I need them to build the PWM
> > subsystem for !OF builds.
>=20
> I could merge them, but can you point me at the code that needs them?
> I get a little nervous when OF-specific stretches of code get compiled
> when !CONFIG_OF.  In a lot of cases the OF data decoding should be in
> a separate function that gets completely selected out.  That isn't
> always the case of course, but I do like to put a bit of back-pressure
> on this issue.

The latest series for the PWM subsystem is here[0]. However that version
doesn't contain the latest changes that require this. I haven't pushed those
changes yet because they cause the build to fail (because of these two
missing patches).

Arnd Bergmann recommended to not #ifdef the CONFIG_OF code out but instead
use the IS_ENABLED(CONFIG_OF) construct and let the compiler's DCE handle
this so that we get full compile coverage for the code, even in !OF
configurations.

Thierry

[0]: http://gitorious.org/linux-pwm/linux-pwm

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+bBJIACgkQZ+BJyKLjJp8l7ACgmL2YJU1o17FwIlUAf1MioI1M
IMAAoKBUTNQBpv2ZFwGD13osm2IPASoV
=yixF
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============0359234801351774399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0359234801351774399==--
