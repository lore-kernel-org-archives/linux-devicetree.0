From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 05/11] usb: gadget: at91_udc: Remove non-DT handling code
Date: Tue, 13 Jan 2015 10:36:54 -0600
Message-ID: <20150113163654.GI16533@saruman>
References: <1417606330-17753-1-git-send-email-boris.brezillon@free-electrons.com>
 <1417606330-17753-6-git-send-email-boris.brezillon@free-electrons.com>
 <20150112213905.GI2858@saruman>
 <20150112225330.GQ2447@piout.net>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150112225330.GQ2447-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 12, 2015 at 11:53:30PM +0100, Alexandre Belloni wrote:
> Hi Felipe,
>=20
> I've rebased that patch series but it depends on another one (the mfd:
> syscon: part of "memory: add Atmel EBI (External Bus Interface)
> driver") that is not taken yet so applying it now will break the
> build. I still hope to get it merged for 3.20 and I'll resend it as
> soon as possible.

In that case, we either take the entire series through MFD (including
the gadget patches) or we delay the gadget patches until all
dependencies have been sorted out.

--=20
balbi

--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtUmmAAoJEIaOsuA1yqRE040QAJH7NOLe/DsC9soHqjM/ywuR
FmMDrqitvIIcCsAJZL989OwiLNtKV1zlF1xUV0NQxMakmgzefpetKJONdPZ2iwts
mwV224mSVg19kYK5gMf03+ILldMfkArAzw90YBTVYDJdCY+MihuKWT8qzT1lI8pZ
+7w6dPFAncsA7XMA734t/n/56775z6FtVLtY9lL44zrS0J+T9ard11JRyzMO9Ike
mP5fLIz/Ig2+JCecw8MU75UAev54sS36CqZkCp5gEM3eiVGMMOuxGdpbyS8Wm/4K
9YmTbO2N1gdFyKGzdcoB8wf9NivzopGFheZRI2ny1B7Ns9Z2MRXi/EZOmKg/kggc
wpmtiIY4BI0B4gE5j2H3WqhPnrVMOGB+7+k68lCGBkWVd5RpMpF+Ha1JjnFVTJya
Ds7S1ibtgZNDjGtkgkEL7XiURHiOs21WzimRb6p6SZxFfZZmWbr/Hn/gmkiODKF1
gcRP7c8dIKDHhYqju3Nl6PGSyQdEpu74fqvmiBcYsFTF6egzaO/HvJw1w8vzBBwl
CvRpvVOVSETOllKziP3rnqacAwrHajOL32jANmHkBm0sTH7nmh/JoI4hzpAiO/O4
6iyBR00nMP4kBNM43ii+r71yURpyfKG3q3Y9CS/lVIHonvlNA3pVSfFYiAmrTqUp
ckDK0LlNeBssyUIXaOgs
=LXLg
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
