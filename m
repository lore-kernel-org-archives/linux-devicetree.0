From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH v2 1/2] rtc: add rtc-lpc24xx driver
Date: Fri, 15 May 2015 12:53:30 -0500
Message-ID: <20150515175330.GL23600@jcartwri.amer.corp.natinst.com>
References: <1431696306-19093-1-git-send-email-manabian@gmail.com>
 <1431696306-19093-2-git-send-email-manabian@gmail.com>
 <20150515152312.GG23600@jcartwri.amer.corp.natinst.com>
 <CAGhQ9VxpN-dSgWS0tJMeik7o_DsRdRo=Mf=Ap1L3j988abcHfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdEQJo40s7ofW8iR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9VxpN-dSgWS0tJMeik7o_DsRdRo=Mf=Ap1L3j988abcHfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kevin Wells <wellsk40-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sdEQJo40s7ofW8iR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2015 at 06:31:53PM +0200, Joachim Eastwood wrote:
> On 15 May 2015 at 17:23, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org> wrote:
> > Hello again,
> >
> > On Fri, May 15, 2015 at 03:25:05PM +0200, Joachim Eastwood wrote:
> >> Add driver for the RTC found on NXP LPC24xx/178x/18xx/43xx devices.
> >> The RTC provides calendar and clock functionality together with
> >> periodic tick and alarm interrupt support.
> >>
> >> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
[..]
> >> +static int lpc24xx_rtc_read_time(struct device *dev, struct rtc_time =
*tm)
> >> +{
> >> +     struct lpc24xx_rtc *rtc =3D dev_get_drvdata(dev);
> >> +     u32 ct0, ct1, ct2;
> >> +
> >> +     ct0 =3D rtc_readl(rtc, LPC24XX_CTIME0);
> >> +     ct1 =3D rtc_readl(rtc, LPC24XX_CTIME1);
> >> +     ct2 =3D rtc_readl(rtc, LPC24XX_CTIME2);
> >> +
> >> +     tm->tm_sec  =3D CT0_SECS(ct0);
> >> +     tm->tm_min  =3D CT0_MINS(ct0);
> >> +     tm->tm_hour =3D CT0_HOURS(ct0);
> >> +     tm->tm_wday =3D CT0_DOW(ct0);
> >> +     tm->tm_mon  =3D CT1_MONTH(ct1);
> >> +     tm->tm_mday =3D CT1_DOM(ct1);
> >> +     tm->tm_year =3D CT1_YEAR(ct1);
> >> +     tm->tm_yday =3D CT2_DOY(ct2);
> >> +
> >> +     if (rtc_valid_tm(tm) < 0) {
> >> +             dev_warn(dev, "retrieved date and time is invalid\n");
> >> +             rtc_time64_to_tm(0, tm);
> >> +             lpc24xx_rtc_set_time(dev, tm);
> >> +     }
> >> +
> >> +     return 0;
> >
> > Forcing the read time to be the epoch on failure seems like a pretty
> > poor way to handle errors, in my opinion.
>=20
> When the device doesn't have battery the CTIME registers contains an
> invalid value. So if you don't set them to something valid you will
> get a warning each time you try to read the RTC. To "fix" that problem
> I set the time at epoch which make the CTIME registers to contain a
> valid value. Since the value is already useless I think setting it to
> epoch is an improvement in this case.

I see.  I think doing this setting in your read_time callback is the
wrong place to do this check.  I'm thinking a better place for it would
be in your driver's probe().

> I guess it deserves a comment in the driver.

Yes, I agree.

  Josh

--sdEQJo40s7ofW8iR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVVjKXAAoJEKp7ZBKwQFArldQH/iWNtf8idt6ORu8BUFk+waPi
meFS6puY8+Nkz4MJ6KAUWspmn+f7+uCKfbff1y288X0nJ83Oz455eS8OxTH2lIug
lV/LjlW0x/WUbJrQsVzd/GlVlwN87WEr8zjRLzzYA33jPdRhv+Zw52De/685u7DW
V65LqunxpGTuYPhkEMzV9kMwYhXOV+zgIJc1q1u7aAbSoAGouutDcoIcMdI+WIFF
ImUPbuVITh0wNPQ7QNH5MvBtwN97//OZWCxbHo7r5X9vCocWkXqsUlqKqV7KmrKX
cn6RFFBv1clO8YVfS39tn0hVNRIzE+gP73VENWMpfDbs2f62ZCPLf4GrqrJOryE=
=Vb0Q
-----END PGP SIGNATURE-----

--sdEQJo40s7ofW8iR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
