From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 00/14] add imx usb driver based on Greg next tree
Date: Thu, 21 Jun 2012 11:10:23 +0200
Message-ID: <4FE2E4FF.8030700@pengutronix.de>
References: <1340260875-21934-1-git-send-email-richard.zhao@freescale.com> <4FE2CC37.8010202@pengutronix.de> <20120621085246.GC1582@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig149E093440F412817F122127"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120621085246.GC1582-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig149E093440F412817F122127
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/21/2012 10:52 AM, Richard Zhao wrote:
> On Thu, Jun 21, 2012 at 09:24:39AM +0200, Marc Kleine-Budde wrote:
>> On 06/21/2012 08:41 AM, Richard Zhao wrote:
>>> The work is based on  ci13xxx rework done by Alexander Shishkin.
>>>
>>> To let Greg pick up, I also added patches Alex queued that I depends =
on.
>>> Patch #1 - #9 : It can also be found at
>>> http://github.com/virtuoso/linux-ci.git ci
>>>
>>> This patch series can also be found at:
>>> https://github.com/riczhao/kernel-imx/commits/topics/usb-driver
>>>
>>> Status:
>>>   - this version only support host
>>>   - usbotg controler works at host role
>>
>> I'm interested in usb device support on mx28, what has to be implement=
ed
>> to get it working?
> I don't have patch yet, but on the plan.

What needs to be done? I want to help/implement it.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig149E093440F412817F122127
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/i5QMACgkQjTAFq1RaXHN2BwCcD4jjAYksXHqmT8eHc2Z2O8TJ
XCoAn188OUvsDmXUxJBVQ6QO1XkeDUcB
=Lrek
-----END PGP SIGNATURE-----

--------------enig149E093440F412817F122127--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
