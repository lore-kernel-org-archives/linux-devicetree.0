From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 0/7] Convert twl4030-madc to IIO API and add DT support
Date: Sat, 1 Mar 2014 18:12:27 +0100
Message-ID: <20140301171226.GA3337@earth.universe>
References: <1393374270-20079-1-git-send-email-sre@debian.org>
 <1393444990-28140-1-git-send-email-sre@debian.org>
 <5311CA14.6080009@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5311CA14.6080009-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

On Sat, Mar 01, 2014 at 11:52:52AM +0000, Jonathan Cameron wrote:
> Obviously there are a few outstanding bits and pieces to be
> addressed. To get this lined up for a merge...

I will send out a new patchset in a few minutes.

> Lee, do you want to take this through mfd or shall I take it through
> IIO?  I don't mind either way.  It stands pretty separate in IIO so
> shouldn't cause any merge issues beyond minor fuzz.

I think it makes sense to queue it via IIO once I add the ABI
documentation for the IIO *_mean_raw sysfs entries. Also I
think it makes sense to add iio_read_channel_average_raw()
in this patchset, since its needed to convert users of the
old madc API to the IIO API.

-- Sebastian

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTEhT6AAoJENju1/PIO/qa1qcP/3LkizLrH6QnSM9aznFkQ6qW
KZ1eqYXw8umtXxVhljApAUq8QLFCT07yePW7Yhs23eEXBBb/3m/wpDMC54vIaSdS
rJLgNM4Tm0zmB7nVOMFoTto9dpTQZnyb/UP8zzHX2TkMu922j3rt4u/gAuKZ2eu8
4Bcrrx/oEg3DhRpHEwxvNVt7+jcDPHacNreXa0fSv5rMVXz7ptyNvCh4XJVP1b6l
DvniowmwmTTpCA16nnN4xAwiuaKK3XNRyg2ClhR8bWN/iT/C3NFGFyd7hS/iFmJ+
7kUweGnixuBGdfiKCMlh9LZNJcgA+x97trMbA9cPh2p3DMiuSPLWHYP49Q1jyOlR
/FF50/kuOF9i/rLR8cbI5j/EM9KqF4lPsvnEVTsdxVR3ryeYJBpA8dURHdHWWfuZ
ZGI9uSnH4Rul2/7tLKxdVEFmEU0XBKIZTi8cWybpN3nJA42Nvd5D1Ig5U7vy/VEf
9Kg9RW5jzNFiyTrnGytvh+DSforbvCxYsTo8BuBvCx+LAJn1OFcMjbZpcO6RZa0i
yTHeAmF++7Z4kIu/SskNGH/yJ9xzjAYOoBL5H13J+6W6I41dYiNTtt0bUNVi7HFW
8XpYaGd1xYEQE2jWmmCMLHBqnxCL95DU9CVRfHvFtQnUFPeBU6J7It1bByDIHrMb
Ljuxi2QOIrh8A8gjq8HQ
=E5Rg
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
