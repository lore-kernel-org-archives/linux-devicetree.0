From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Fri, 2 Nov 2012 16:26:44 -0400
Message-ID: <201211021626.50503.vapier@gentoo.org>
References: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2343845681159323509=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332296626-19707-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2343845681159323509==
Content-Type: multipart/signed;
  boundary="nextPart3769070.okbKvxx1uN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3769070.okbKvxx1uN
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 20 March 2012 22:23:46 Stephen Warren wrote:
> On Ubuntu, /bin/sh is dash (at least by default), and dash's echo doesn't
> accept the -e option. This means that fdtget-runtest.sh's EXPECT file will
> contain "-e foo" rather than just "foo", which causes a test failure.
>=20
> To work around this, run /bin/echo instead of (builtin) echo, which has
> more chance of supporting the -e option.
>=20
> Another possible fix is to change all the #! lines to /bin/bash rather
> than /bin/sh, and change run_tests.sh to invoke sub-scripts using $SHELL
> instead of just "sh". However, that would require bash specifically, which
> may not be desirable.
>=20
> --- a/tests/fdtget-runtest.sh
> +++ b/tests/fdtget-runtest.sh
>=20
> -echo -e $expect >$EXPECT
> +/bin/echo -e $expect >$EXPECT

the better fix is to use printf and %b:
	printf '%b\n' "$expect" > $EXPECT
=2Dmike

--nextPart3769070.okbKvxx1uN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJQlCyKAAoJEEFjO5/oN/WBmyYQAJDjSg3AjqXsaNOQtgC0ATzg
jUmiBxVqisBjIBhwRWaGat+7YDsiS2qolB15XRSGVUZkcdI89Jf+e4QDclX5nB27
tcZ8W7JP29B2R/pw2wr16ctcOElbsJvteBPMQnQ71qiaZWqj/yvJxLMqEf+vogCC
D0IZpUOcoszBud5NFidgcrYj2ORa0c90D/nrthcFz5byrrxoaoOJhNZrGtZVkm5E
RdDDeP0C8gbr5w3OPsRajDfnkiOu4ajTLOgwTN1rA9n8RHzxGPqSA+aTAds+gzqa
mw3qr8riz+CiN2JYe6XxoHqYMSP6rpqgTZdhjNdQDDP8BsZOXIJ0ppOyZf0bebGf
5Q03midtZ7OfS1KivT6V0NpSJocOgP1yWypFQTmNBN19msz7k5NwTAzG+EFgPWmT
mPREkc+4jXnp0oJzXowILFGqV/Kbd1IWzgFpZ1uKNsmNUDbumMvMRkTrg8WC61Ef
sJGWycWfu5q3LFyORqgUzy/jDT2SIR4sQe8jtFdzemybAsK4UdJIC0UFig/Q3r9n
mNhRyQbW/2jMioSw1qPf2GBf0pCEjiiVynsQyF8b7vYux1mIeDolMPbegGYE7Xu1
8rlQMKl49xN8fM+y1vvIgkQIX9gDdkog2AUIYKKFRDgjbfLGCkOGbgNjwuiyUkuu
KFPIidzsSPmc529rZRME
=2iYT
-----END PGP SIGNATURE-----

--nextPart3769070.okbKvxx1uN--

--===============2343845681159323509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2343845681159323509==--
