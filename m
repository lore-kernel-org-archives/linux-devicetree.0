From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 09/11] Documentation: devicetree: Fix ADI AXI SPDIF
 specification
Date: Fri, 25 Jul 2014 11:39:05 +0100
Message-ID: <20140725103905.GP17528@sirena.org.uk>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-10-git-send-email-afaerber@suse.de>
 <53D20A61.1050506@metafoo.de>
 <53D21066.8000905@monstr.eu>
 <20140725101815.GO17528@sirena.org.uk>
 <53D2324B.4070602@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XqFDY9bHNWRmuMQr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53D2324B.4070602-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XqFDY9bHNWRmuMQr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 12:32:43PM +0200, Andreas F=E4rber wrote:

> I used scripts/get_maintainer.pl --nogit-fallback. If you were not
> CC'ed and need to be, please submit a MAINTAINERS patch. :)

You need to think about what you're doing when you use get_maintainer,
it gives both false positives and false negatives.

> Maybe this works for you?
> https://patchwork.kernel.org/patch/4620191/

> Otherwise I can resend with Ab/Rb.

Documentation/SubmittingPatches.

--XqFDY9bHNWRmuMQr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT0jPFAAoJELSic+t+oim91qcP/isi2MsxkEcpE869c2mD6n5M
0159BsrMF65Qy93w1RH4mO+8nmIuImgiqfU+8yrIk6oX1BtLNCYPlhxGi8SOfOuA
BJD9AQnWiZvrOUuwdBDNnc9hcpbbd2EpRfKAqdRvLlPogLJr67tI5bggkB4DggME
rhOna7CkF6WwG13YZOeVe/FaLfpvdbgm485f5MuWqLDv845veVdEGMGYQ9IwPkbH
JnTdT007jOFccrxHtXwdKMti+659cfzsu5WxCtBeR+Dd2adVTCyjqkVIhuZfLvhQ
9M0yWAw5OzwBD3n3Tr4vVxonqabeKk5Tk2iIYx3rUCslUa28BdGmERJ+AhRwKF94
k8VO0ZHs2aOdznw8qP91ESMr8FoW1l3wBhN+zHx+cqOvCg/GkLuf5BIUl23+w9xl
SaM2OcR951tzhONHKrxJo8lm40aMGnDcl1nHVUiJqeKYKSEw2fqhxnlY6BXZ6vve
kVY26noB+YUmNkjdljmayuDVUmZjFUkwpNyb21gJop3WurRRCmXmGH/8PEijFUcw
R62plRupmEZ002SDj+aL7GeZb13PYHtooYP1Np1NhEt6avv5CZj39XzHeXylzWVp
OfjanWt4b3R4MlW5/xmDkX7sOZMh3NwGeeDK2gXIr9U7Pq/rixy/b4kXBvtDY4Ut
PMtwQqXm8KlDiBvJVofE
=8NFN
-----END PGP SIGNATURE-----

--XqFDY9bHNWRmuMQr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
