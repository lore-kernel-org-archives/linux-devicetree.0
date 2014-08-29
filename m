From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/5] regulator: RK808: remove redundant code
Date: Fri, 29 Aug 2014 19:56:10 +0100
Message-ID: <20140829185610.GY29327@sirena.org.uk>
References: <CAD=FV=X1xOg=-_xZ70X5=ZzRLiuws_2gv5n2fj_AaLTYMq58=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iIOavGAISvUeFFLW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=X1xOg=-_xZ70X5=ZzRLiuws_2gv5n2fj_AaLTYMq58=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@chromium.o>
List-Id: devicetree@vger.kernel.org


--iIOavGAISvUeFFLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 29, 2014 at 06:13:10AM -0700, Doug Anderson wrote:
> On Wed, Aug 27, 2014 at 2:01 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Aug 26, 2014 at 10:18:57PM +0800, Chris Zhong wrote:
> >> remove the redundant code, since pdata has been removed from stuct rk808

> > I've applied this but if there's further changes needed please wait
> > until the MFD changes they depend on have been accepted before
> > resending.  This will be less work all round.

> Can you clarify?  As Chris makes the MFD changes that Lee and others
> have requested then the regulator driver needs to change as well.
> It's helpful for reviewers (and testers) of Chris's changes to see how
> the regulator driver changes as the MFD interface changes.  Should he
> just take you off the CC list until he's ready?

Yes, the frequent resends of MFD serieses are in general a problem and
since these ones still don't seem to be getting threaded they're
especially problematic.

--iIOavGAISvUeFFLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUAMzHAAoJELSic+t+oim9+vwQAJaWHeM8Pq0zaxEnY9xanWSr
HegWLq+DBWm9Sc+3w5HbMFPy9N4EuREx1Z1YhuhYmg4JU1sh2uIAinkwilS4BQKy
C5BmRgKTyR5AA3Ms7uJGkTT4OTpcXKOAqV6ZvQxJpGV4PI6N2uP53jgGTrHEzzru
I1VYjvabcjjQn7H8Jzdw/QLsmc02EkeqvgogF+SVNFkJ/zfvF/rJ4Xbx8Q2ksKha
7yj0464gEmV6ixb2lPO6yjj58B8Tt1dJFA4C/ktGbYESRATcX8M2u7ys9E7RRn1e
fEDsHPvalpZ/caCd7fFAzpLr4PQd9nnkj5WugYOwwvhUsYLWD+MOX/3Lg1U1J3IE
bXwJseSgkHYpHgEey36d5O0jJnyBGQQgngz2/NeVfX5KK5ogr0NJvltm7tp4ETC2
XMjj/KjTasNEQmqQl4xWTVJfACD01kUTLzZI17z4yNKDMya949S+wbEgap7DLazi
5eXD7obBYaZ1GXCCFMAPdDheAUdLisAI/Wxl1C/nULPcauude9rCAj62yFPEPT57
JW/Hsbf/WP4t2o8I5AoePV+bKiWbatngRZySKRC7Rd7bpAQLH257im3XK31+MTwd
jO4HjqKdCYdDwK0TxVYNH7EKkJ3NNrmqrwWOgSd1iWJnT40cegd3NXiEUrWyfAOd
GQz3dVQH0Fogl1gv2Gw9
=7zVz
-----END PGP SIGNATURE-----

--iIOavGAISvUeFFLW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
