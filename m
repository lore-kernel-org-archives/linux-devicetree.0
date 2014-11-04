From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v6 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Tue, 4 Nov 2014 11:41:20 +0000
Message-ID: <20141104114120.GJ3815@sirena.org.uk>
References: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141031164418.GC18557@sirena.org.uk>
 <20141104004333.GA2965@jack-ThinkPad-T520>
 <20141104005329.GA3815@sirena.org.uk>
 <20141104054534.GA4108@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wv56KCa6/aA7yLgk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141104054534.GA4108@jack-ThinkPad-T520>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wv56KCa6/aA7yLgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 04, 2014 at 02:45:34PM +0900, Gyungoh Yoo wrote:
> On Tue, Nov 04, 2014 at 12:53:29AM +0000, Mark Brown wrote:

> > I'm having a hard time understanding why it is difficult to split the
> > two changes - they are in completely separate files.

> I am sorry for the hard time.

> That was because the symbol changes had a dependency with 1/8.
> In this case, Should Kconfig symbol change back from MFD_SKY81452
> to SKY81452 in this patch series? And then should I submit to change to MFD_SKY81452
> with seperate patch?

No, what I'm saying is that if you want to rename the Kconfig symbol you
should do that as part of a separate patch to changing the DT stuff.

--wv56KCa6/aA7yLgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWLtfAAoJECTWi3JdVIfQSHUH/12eFd925csd7DlYQxfYh+Tf
7OdzGpaZ2MGdiDrRiGmzdPcaN6T3hD7WIzdDOKCMCQq8eqd+SHh7Vpvfj/WkXsNQ
czRZx4CrTuvzvuvxtRI0hK6HiJARLlvQSUmtMiPjOvKokRcZ2c70PiwkdCmRiOu+
9K6hDJu7M9sVh46kY5sTo2tS4EkpcI7aqrTTTuWlwtdeLj3GPb2v8SDPTnh00Lom
HrYDr/CIVaq79nIytTIVbimdVk9IeDvjh6roF0rfQuPBSrVyB638+wKV3zD7dHgq
6ZLIovTVl4fwmen/wAw8475AujuHmd2ZZCrfRj1KEVr1gu8287Vwt0GKKgfjhpY=
=ymkh
-----END PGP SIGNATURE-----

--wv56KCa6/aA7yLgk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
