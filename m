From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 09/11] Documentation: devicetree: Fix ADI AXI SPDIF
 specification
Date: Mon, 28 Jul 2014 17:39:46 +0200
Message-ID: <53D66EC2.1050408@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-10-git-send-email-afaerber@suse.de> <53D20A61.1050506@metafoo.de> <53D21066.8000905@monstr.eu> <20140725101815.GO17528@sirena.org.uk> <53D2324B.4070602@suse.de> <20140725103905.GP17528@sirena.org.uk> <53D63746.3000905@suse.de> <20140728122042.GR17528@sirena.org.uk> <53D641DC.4020804@suse.de> <20140728134420.GU17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="k0CjAvVJUkGbaXStHfnhCSKuL7nVI8vip"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140728134420.GU17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k0CjAvVJUkGbaXStHfnhCSKuL7nVI8vip
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 28.07.2014 15:44, schrieb Mark Brown:
> On Mon, Jul 28, 2014 at 02:28:12PM +0200, Andreas F=E4rber wrote:
>=20
>> I will *re*-submit it for your convenience.
>=20
> Which is what I originally requested when I got CCed into the thread -
> I'm being grumpy because instead of getting the patch sent to me as
> requested I got sent a link to patchwork.

Hindsight, had you simply replied with "Yes, please." instead of the
non-telling "Documentation/SubmittingPatches.", you would've spared
yourself keystrokes and us four mailing list messages. ;)

Similarly, your statement about false negatives didn't really help in
resolving the not-CC'ed problem. I now know to CC you if I ever have
something for adi,axi-spdif-tx.txt again, but the next person might make
you grumpy again and potentially demotivates new contributors, so
certainly worth fixing.

Regmap, SPI, regulators, touchscreen MAINTAINERS entries seem unrelated.
Should your "SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)"
MAINTAINERS entry get an
F: Documentation/devicetree/bindings/sound/
or is the "ANALOG DEVICES Inc ASOC DRIVERS" entry missing a line
F: sound/soc/adi/
F: Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt
(which would then still not CC you)
or is a new MAINTAINERS section needed that CCs specifically Lars-Peter
and you on the latter?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


--k0CjAvVJUkGbaXStHfnhCSKuL7nVI8vip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT1m7CAAoJEPou0S0+fgE/50gP/0wo9o1Q1gZsa4mUCfvpAWqq
l3kbaua1x960mqSGk4irjKx2dK9sbYt3nfoxZj0sY9oVhIy9SW65vccDR7dwwQau
rYn4qYLNeZppp0pusxxE3YWbSY1vI/qLjfUfy751ru0kz9jQ6Ssf5r+QQu9CGRBe
cVInJTpfmymh9I9vjajmBztceGWAbP1ptFp2WxTU/PERsfrYrjsxQpVNMnjF5RSR
jGO0v3gmBFU8owUnJofdkDkfmHKbzRXZVjMpXo7O3VujuGz03mWrGKvL3Hxsw7QQ
sSF6WpBVXGeK6FprV0yk8qA0JLnE+/08YEGM4fXmWRB3DIWl+VILgrS66ULbEtAu
xGYri4CIvyPEXB9MgJINWMQcNVWqx2b1mwqyEQIaYbzB6uqvkQSal3r74qSLR0sq
pVbeLmmkuYXCXeav+Pi7CJvUIMnu9jdEGpkZ9oy0ESc609lazA314KQX7OiVhI3P
nXq/pCQi8F4hBXW4IcgGLEnEu/NmvvxtnvfPJBTA+UqtmKzd7eP47Xsd4Jk52MKZ
L/kp/sfLvSLQ4hNDCEUSWr9vY4eWhw/sH8clwf2McJQTwrzvZxvcAbDitloml8l6
x8T2/giCaI3NxmkDuNjB9IfL8B84qa4WTcwUsvKRgTscQ5PzYTa6qYlfTPIeSj1w
OIPvTduihl1hWe2Yc7BE
=068Q
-----END PGP SIGNATURE-----

--k0CjAvVJUkGbaXStHfnhCSKuL7nVI8vip--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
