From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/2] power: reset: support for Atmel alternative
 Shutdown Controller
Date: Wed, 23 Mar 2016 22:11:44 +0100
Message-ID: <20160323211144.GA31473@earth>
References: <1458134390-23847-1-git-send-email-nicolas.ferre@atmel.com>
 <56F27B96.5010406@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F27B96.5010406-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Wed, Mar 23, 2016 at 12:18:46PM +0100, Nicolas Ferre wrote:
> Le 16/03/2016 14:19, Nicolas Ferre a =E9crit :
> > This is a series to add driver for a new Atmel Shutdown Controller. Thi=
s new IP
> > is extensible and some features will be added later (see the TODO secti=
on).
> > Its extensible nature led to write a new binding so that wake-up source=
s can be
> > described easily.
>=20
> I have the feeling that this series is ready. What do you think?

I have see obvious problems with this series and plan to queue this
after the merge window has closed. I give patches one more review
while applying them, so at that point something might turn up.

> So, do you want me to collect everybody's tags and send another version
> or you can do it yourself?

I can collect the tags myself.

> BTW, I will certainly send the device tree updates for the sama5d2 SoC,
> but it will go through the AT91 then arm-soc git trees. No need for
> further synchronization here.

I will ignore the *.dts patches.

-- Sebastian

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW8waMAAoJENju1/PIO/qahC8QAIwqO4cZXF4D7XmeiDP3dLS6
9k6cEW8EvJ3DTUn5gorg1tS870NPhaBVF8hADaR4/g6SMFQDAcT/+NaN6lv71zOz
DuUwcM2tL8WWQO3Wh+72WVfHfqox9+y52GLUmwpINlasaLeWMlp8TD8ojTQsh6+1
HI0tcPXjCOcCLXqI/yDA/p5ff4H36jG6kchWeY1aaShD9inivZQsm6UUNbYuQQ2S
DndTFU7RUs2PFxi72BUcDq2tWAI7KNgKQRx85HC3HqiZSTiwS8DmskB3NJkQoSgU
iaxXQkJfqmtODaAU7778ntDn07KMfZeZW5mjRMbcZynhMpH2GK7TS1SLfdAy9v8b
qHSEiDaJMRcqucJpjSJYtD1QW81Czoec/unZY2RRCgN02vYsOrn6LIUOKr9ZFy9Z
IKRNPVYAFCo0qgjzEcgH2ldRrL/xZ/L4SF42OsIu/h4Fh8dKcRrB7CV8GQNfMiti
wQ+NQXaTniffmEs5aYSr7g70Ui3Mt8fnmOqaOdBMfuJz2KK1yko9ow2TtdE6Sv4/
3Pe8WUDwFGgiBBhBIk6mAbJLqbOV+M9ZxsjJMrjj88gT30plKCr1K95ruyMQh9qd
YqPtrkDtOjdnHuF490+zZ8KHKaQJzKMnDNwxE/UujyuVJw1p98LnNVlBP+ExrO1z
eQR8YnlYXKhPJaH63poc
=Esz4
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
