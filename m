From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Banana Pi: increase
 startup-delay for the GMAC PHY regulator
Date: Tue, 11 Nov 2014 18:34:35 +0100
Message-ID: <20141111173435.GJ14919@lukather>
References: <1415539714-7652-1-git-send-email-merker@debian.org>
 <1415539714-7652-2-git-send-email-merker@debian.org>
 <545FD716.5060305@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOcTNEe3AzgCmdo9"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBT4RRGRQKGQEWKRVFQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <545FD716.5060305-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zOcTNEe3AzgCmdo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2014 at 10:05:26PM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 11/09/2014 02:28 PM, Karsten Merker wrote:
> > On the LeMaker Banana Pi, probing the external ethernet PHY connected
> > to the SoC's internal GMAC module sometimes fails.  The PHY power
> > supply is handled via a GPIO-controlled regulator, and the existing
> > regulator startup-delay of 50000us is too short to make sure that the
> > PHY is always fully powered up when it is queried by phylib.  To
> > guarantee a reliable PHY detection, the startup-delay has to be
> > increased to 60000us.
>=20
> We should probably just increase it to 100000us to be safe, otherwise:
>=20
> Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Soooo, should I merge it or will there be a v2?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--zOcTNEe3AzgCmdo9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUYkirAAoJEBx+YmzsjxAglp0P/0PfLFoo+1WoIDayEyMPcyKA
tE3HKEUdRDRCnW8qpuzIapqre1jnH03VqJ0JoJZr4wdkv0NhmIieiUM4jkhyXs4C
uSALdcWb9UZDi4UAl0j86v2f8ugFGFYkCjfBGylG1c6/LctRd/IXXlSCBmELLWE2
M2VAWTMQZj4zUpxlEmL3xc/kstbGwXr2RouFshhXjJUjm7VGnkpNBow00Nt9OV6o
n7PJhkfWu1anOHh3JUFiL685DsTaDhLUO7pLEn7c/ceJUnEc/b9YYeRmQtVlbYZ0
VyZyxnk+/LcPlo5tH904nsToMRrq3SWn4yefA6wAPORcDv4lRqsh6gXcPD3kpjFN
05xhPhVhOJ63UMcXBZp8ul/kgfsvnp2Joh1NS5GpEt5IDYarIuFyp/2vSVxuGXw3
I2uLKh0lfUVVy31RDLeL1tP7PdjaVw+1gTha1FmV+VSDaAyThO0NkBWr63XsAK3m
YPiwlkDBgaYC/aUgtVeK44qoufwkiLBaEgn+0rPYNneGDtY3AtiyjHj5TkmYDVSW
d4aD8PkXxHSzzEAV1cqgCKaVsAL4aIBpuIvY73MYopgiiVOtZ7IGwFLZDjEgueB8
LmJZXxSYBVJC/S+brnC2NEH8YtL+zrApLte7qxyE8Ew4Nuj6DvULSPeXbpGICxqE
WzzJ8Ts3JcqQlgKUz3+L
=JaZ0
-----END PGP SIGNATURE-----

--zOcTNEe3AzgCmdo9--
