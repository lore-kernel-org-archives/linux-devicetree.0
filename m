From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Tue, 22 May 2012 16:55:29 +0300
Message-ID: <20120522135527.GD27874@arwen.pp.htv.fi>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-6-git-send-email-richard.zhao@freescale.com>
 <201205220630.57007.marex@denx.de>
 <20120522045120.GL6206@b20223-02.ap.freescale.net>
 <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
 <20120522100624.GP30559@arwen.pp.htv.fi>
 <20120522103139.GD32035@b20223-02.ap.freescale.net>
 <20120522103516.GR30559@arwen.pp.htv.fi>
 <20120522135257.GQ8140@S2101-09.ap.freescale.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522135257.GQ8140-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 09:52:59PM +0800, Shawn Guo wrote:
> On Tue, May 22, 2012 at 01:35:17PM +0300, Felipe Balbi wrote:
> > My suggestion to Alex is to remove all dependencies for at least a
> > couple of merge windows and only add dependencies for stuff which
> > actually matters; like only building the PCI glue layer when CONFIG_PCI
> > is defined instead of when ARCH_X86 is defined and so on.
> >=20
> As ci13xxx_imx is a DT only driver, it needs to depend on CONFIG_OF.

yes, and I have said that it should depend on CONFIG_OF, rather then
ARCH_IMX... that's fine.

--=20
balbi

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPu5rPAAoJEIaOsuA1yqREIpIQAK/WQb7O7p9Zk5RevLYOSnJs
weloTfY4aCRBLpOv6TYAajgEDT9HUYFOmbKDPHqZuqJ8NznN/7mhL+SvnHNYiCPf
AhBgdRcXKJ+/IdRISwUpcboQeKYMVZewAMx1ahVPRE7+27XAWVT5QDV3YX/++wH2
NQsQTL8IWyxegNAR3vPd/dS7m3qbTa44GTUjYx3KMqCgId9HahyswuFVbDLboEQs
eDynIsZ/HrsIBM1Cr0BviIIVbcbUPTzgmzqj4UboBaGj9Te0MpzmnbiMlCrU00Np
90qfi8FPm400vmO4LpJ0KPwwSlZDWkB6ScVVlQUwR4fuX/qGF1A2xJIWxmETYsPn
r7vpRAMKklk5XDaA/0ibWiZfq+tBfEQwAy7Ar55x0xibO45FOc9+ulwRaHuVQcba
APw0QoZpgf9yIdPSCLpYR0n8G6IRxQ98MUpayobkaKZjPpyoovqTqgqZQzfBMAtY
/IP9V37DQa3It6zT8Eb0I0A6/AqjG+b8p0Jgi0JV9hegGi7Vp5Q/CjcbKw2iO+JK
8W0AkC9lXaJprrdcltZ8XynedJ80riCMcM9EB545PSa+GbADgp19kPHmbMOyfu8/
bkVwxkCE5cFLseiL5zWC1J01KfCleLUX7MZZz502Ktm8feTKkBHnhryv2w0N36wP
cJyc/PQLSVdZxY9nPZYM
=54Op
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
