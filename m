From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: Add empty of_property_match_string() function
Date: Fri, 1 Jun 2012 07:59:20 +0200
Message-ID: <20120601055920.GA15874@avionic-0098.adnet.avionic-design.de>
References: <1334327016-8949-1-git-send-email-thierry.reding@avionic-design.de>
 <20120426190112.GA28018@avionic-0098.mockup.avionic-design.de>
 <20120427164554.2F7E33E0B4D@localhost>
 <20120427204154.GA12617@avionic-0098.mockup.avionic-design.de>
 <20120427205307.GA16099@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6355612326679178518=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120427205307.GA16099-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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


--===============6355612326679178518==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Thierry Reding wrote:
> > The latest series for the PWM subsystem is here[0]. However that version
> > doesn't contain the latest changes that require this. I haven't pushed =
those
> > changes yet because they cause the build to fail (because of these two
> > missing patches).
>=20
> I just pushed the latest code to the for-next branch. That's the state th=
at I
> was going to submit during the 3.5 merge window.
>=20
> Thierry
>=20
> > [0]: http://gitorious.org/linux-pwm/linux-pwm

Hi Grant,

Do you have any comments on this? I really want the PWM subsystem to go into
3.6, and for that to happen we need to find a solution for this. As I stated
previously the empty functions are needed to compile the PWM core in !OF
configurations.

Usually this would be solved by just #ifdef'ing the corresponding code, but
with the recent introduction of the config_enabled() and IS_ENABLED() macros
there seems to be a move to replace #ifdef usage with those in order to have
the corresponding code compile-checked in all configurations and have the
compiler throw away the unused code.

I believe that this is a good thing, but it will required these empty OF
functions to be added. If you don't find this an acceptable solution, please
let me know and I'll convert the OF-specific code in the PWM core to use
#ifdef instead.

Thanks,
Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/IWjgACgkQZ+BJyKLjJp+eNwCeO9XTxDTt6oQvMO6rTVSIk0TG
tlAAoIXWLHvSsVM1UO2h27MOSNTkDK1d
=JRFg
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============6355612326679178518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6355612326679178518==--
