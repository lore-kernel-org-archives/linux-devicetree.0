From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: Add empty of_property_match_string() function
Date: Wed, 13 Jun 2012 09:02:56 +0200
Message-ID: <20120613070256.GB5670@avionic-0098.mockup.avionic-design.de>
References: <1334327016-8949-1-git-send-email-thierry.reding@avionic-design.de>
 <20120426190112.GA28018@avionic-0098.mockup.avionic-design.de>
 <20120427164554.2F7E33E0B4D@localhost>
 <20120427204154.GA12617@avionic-0098.mockup.avionic-design.de>
 <20120427205307.GA16099@avionic-0098.mockup.avionic-design.de>
 <20120601055920.GA15874@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3271055486421253413=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120601055920.GA15874-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============3271055486421253413==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2012 at 07:59:20AM +0200, Thierry Reding wrote:
> * Thierry Reding wrote:
> > * Thierry Reding wrote:
> > > The latest series for the PWM subsystem is here[0]. However that vers=
ion
> > > doesn't contain the latest changes that require this. I haven't pushe=
d those
> > > changes yet because they cause the build to fail (because of these two
> > > missing patches).
> >=20
> > I just pushed the latest code to the for-next branch. That's the state =
that I
> > was going to submit during the 3.5 merge window.
> >=20
> > Thierry
> >=20
> > > [0]: http://gitorious.org/linux-pwm/linux-pwm
>=20
> Hi Grant,
>=20
> Do you have any comments on this? I really want the PWM subsystem to go i=
nto
> 3.6, and for that to happen we need to find a solution for this. As I sta=
ted
> previously the empty functions are needed to compile the PWM core in !OF
> configurations.
>=20
> Usually this would be solved by just #ifdef'ing the corresponding code, b=
ut
> with the recent introduction of the config_enabled() and IS_ENABLED() mac=
ros
> there seems to be a move to replace #ifdef usage with those in order to h=
ave
> the corresponding code compile-checked in all configurations and have the
> compiler throw away the unused code.
>=20
> I believe that this is a good thing, but it will required these empty OF
> functions to be added. If you don't find this an acceptable solution, ple=
ase
> let me know and I'll convert the OF-specific code in the PWM core to use
> #ifdef instead.

Grant, Rob,

any update on this?

Thierry

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/YOyAACgkQZ+BJyKLjJp+QUQCgj2Oxhjbl8eMs90OaKdcyKd4m
8RMAnjCIomrb36eedi6WPxmWN7fh7X5f
=dlY1
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--

--===============3271055486421253413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3271055486421253413==--
