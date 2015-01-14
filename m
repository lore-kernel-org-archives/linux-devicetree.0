From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] rtc: armada38x: Add the device tree binding
 documentation
Date: Wed, 14 Jan 2015 09:13:10 +0100
Message-ID: <20150114081310.GI4891@lukather>
References: <1420817565-28800-1-git-send-email-gregory.clement@free-electrons.com>
 <1420817565-28800-2-git-send-email-gregory.clement@free-electrons.com>
 <87iogai8sc.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yJLks8MEB0SlUFSu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87iogai8sc.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yJLks8MEB0SlUFSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2015 at 12:02:27AM +0100, Arnaud Ebalard wrote:
> Hi Gregory,
>=20
> Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>=20
> > The Armada 38x SoCs come with a new RTC which differs from the one
> > used in the other mvebu SoCs until now. This patch describes the
> > binding of this RTC.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../devicetree/bindings/rtc/armada-380-rtc.txt          | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/armada-380-rt=
c.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt b=
/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
> > new file mode 100644
> > index 000000000000..2c56bef9dd7e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
> > @@ -0,0 +1,17 @@
> > +* Real Time Clock of te Armada 38x SoCs
> > +
> > +RTC controller for the Armada 38x SoCs
> > +
> > +Required properties:
> > +- compatible : Should be "marvell,armada-380-rtc"
> > +- reg: physical base address of the controller and length of memory ma=
pped
> > +  region. The second entires is for the IP configuration part.
>                         ^^^^^^^
>                         entry
>=20
> I had to read probe function to understand precisely the purpose of each
> region, i.e. IMHO the description could be made a bit clearer.

Maybe using reg-names would make it easier to understand, both in the
documentation and the DT itself (as well as not needing to enforce a
particular ordering of the two areas in the documentation)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yJLks8MEB0SlUFSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtiUWAAoJEBx+YmzsjxAgbFwP/RF3LlMLV4XfzX2HCB6+IH9A
XAEHhTkDuUQV7p7tzJ5zbu+IWXppFXvk7WRoxj3eulY/72SQsPpHgBSJSY54VBE0
peB2tsER6Y/JSxK3+C+dltbsIDJkvuG5Uus73X9aNyM25nCGhpv1Zwo8yBAOKNXy
JRv/g3QlGr9dJg0qxBcWAU/Duc25/cv5nLoFX31WCQL4sERsfrP+O1KNkX+zBhKw
FDu6KgoqDhDGHMBUKZwSMQF4g2LdODp+akXz39ZxKR8WN2E/6E09+I6jt+I8fZsd
LpYPjeMgDBtyha/vusJNYj2MzWHc+bb9tZOOauWJA2QJytUbIcxXcDcqbef3FkmE
lfpIWRjDeBUNssbIFUwQ6RaSmYDOGVQXrgmb54/iB9V3LrL35vIjt7XrkZjd4axJ
Vqm0D1l0fN5BEYgjd9MsBNSNpDK2pUGTryHgC8KEgXNuf62og1KZQWi7m0Qnj0VF
rWmxWRCxBzW0Yqac98svZ0NM2FbLEsCOMQkAfT2JCrDESnXfHKa5FfuDicjZvbjB
NguW+zXUZoM/wflUsc9H422rbzzDt7KgvXn5FXMDN6nwZ9l0Dhak1WNKfiYsOg11
nzKQVeKYHk9ZRpUUGlEQsqQ86WsTeUcHFLj7qShjn1de/TjympSCqkz5pkVEXrE6
hYMCGbRtK1LPuT8D2rHW
=3Ipf
-----END PGP SIGNATURE-----

--yJLks8MEB0SlUFSu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
