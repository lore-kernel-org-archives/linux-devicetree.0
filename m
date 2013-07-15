From: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Mon, 15 Jul 2013 20:58:48 +0100
Message-ID: <20130715195848.GC11538@sirena.org.uk>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
 <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
 <20130715165620.GA29040@kroah.com>
 <20130715170600.GW11538@sirena.org.uk>
 <20130715184157.GB17220@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0374736469450815975=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130715184157.GB17220-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
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
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: ksummit-2013-discuss-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0374736469450815975==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A1Iwnsx6rNfRhs6P"
Content-Disposition: inline


--A1Iwnsx6rNfRhs6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2013 at 11:41:57AM -0700, Greg KH wrote:
> On Mon, Jul 15, 2013 at 06:06:00PM +0100, Mark Brown wrote:

> > At the minute it's about at the level of saying that if you're not sure
> > or don't know you should get the devicetree-discuss mailing list to
> > review it.  Ideally someone would write that document, though I wouldn't
> > hold my breath and there is a bunch of convention involved.

> So, what should I, as a subsystem maintainer, do if I get a patch with a
> binding in it?  Wait some random amount of time before I can just apply
> it because no one on the mailing list said anything about it?  Trust the
> developer who wrote it?  Or just reject them all?

> What do you advise?

Right, this is the problem.  Given that this is supposed to be about
defining an ABI probably sit on it until someone with more DT experience
turns up to help though obviously that isn't always constructive.
Trying to figure things out enough to decide if it's sane is another
option, as is helping the submitter make their binding easier to review
by doing things like split out more complex elements into incremental
additions or making sure they aren't deluging the DT list with lots of
subsystem stuff other than bindings.

Ideally a lot of this stuff will be fairly standard for the subsystem so
hopefully it'll very quickly become apparent what's unusual which will
help a lot.

--A1Iwnsx6rNfRhs6P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5FR1AAoJELSic+t+oim94YUP/0dL6pVprmyqNeL+PkZ3RqTy
rapA18gieYKjwkCipZF9vQvux+fEEM5XpDDAQC9mzOSzfH6FeNP94R0fO+8NFrcE
N55Tgj1/8j5BtpG2Wgeg7TDRtgj4ILiTHxh0WNX3ttGvZoFNyxN0BUhH4RPJKLf0
x6iu6ODEHgG2cHrvTZwNIk/y8UDIxjUJ44HWbbEet3cKp2EM5mcci/77/BaC04m3
ce08X63zAjjOYTfFB6CVcZX2AyR9W41yNJuWBUVn095Os+7Kf4rjqukWjiuJQv1h
3irwAje02hSo6J1y6D99tp7xLwC2YIGr2biclASvl6MlSoL8DOUcycXei5um5U7O
QsffYQO/4FWypDOW3rTLRL+3VZmudETg9SuW65XFjNfwNWHfuES5x890e8eQDMcO
kCStsbP0JzxufSST/wIm8GDDuVE2By/MvRIitNNvTl0XzK4yMzdl93mGLGqBJnYb
gO7oYL9dzQLjyWTv9AMGwd1Wmm1M8xybARBPc2+ayAk6MXDxe6NeAhqXLt7yAAfk
+tJbOD6n3SnEyHtKfcmv+M1BG7Cidn/hqusECjQa3zdC+0Kt/tWwIZBny0p1GoiS
kHgtopIqu64hz4mquCBUe8adPQJTbNgitne0dSrzyXpOvAFxHAXCWdMaoRm2ZtD3
ESEDc0+LdfgRaObi7XjX
=842x
-----END PGP SIGNATURE-----

--A1Iwnsx6rNfRhs6P--

--===============0374736469450815975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0374736469450815975==--
