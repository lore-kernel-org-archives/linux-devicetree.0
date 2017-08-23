From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: Add board dts file for
 Banana Pi M2 Berry
Date: Wed, 23 Aug 2017 16:31:13 +0200
Message-ID: <20170823143113.nt6p4hqeglqmynmg@flea.home>
References: <20170822061742.40869-1-icenowy@aosc.io>
 <20170822061742.40869-3-icenowy@aosc.io>
 <20170822201215.wbpioc7vbse4ajja@flea.home>
 <D377CF9E-AE08-4AA4-AAD4-C9047C8007E9@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjl7patdnin5zmxw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPFD63GAKGQEUSC3TNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <D377CF9E-AE08-4AA4-AAD4-C9047C8007E9-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tjl7patdnin5zmxw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 01:46:50PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B48=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
4:12:15, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Tue, Aug 22, 2017 at 02:17:42PM +0800, Icenowy Zheng wrote:
> >> +&reg_vcc5v0 {
> >> +	gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> >> +	enable-active-high;
> >> +};
> >
> >Same thing here, you're not using that regulator anywhere. You don't
> >even use any of the regulators in sunxi-common-regulators.
>=20
> Maybe I should drop the regulator now, and re-introduce it when adding US=
B/SATA?

If that's what it's used for, then yes, please.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--tjl7patdnin5zmxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnZGxAAoJEBx+YmzsjxAgfZAQALcIPJkvPS2fhK6nmLUIjWmr
h5DmqeRxP4QMvbJ0mtsZwbZuyRt9MYDZHMZ/24KkDs6dHHXi7fFcsiFZVs8kq2ox
BFdQMHSmcXumeAHEhuP4Jy6C4tXlR44N1DH1795MNCsNfZ6Io2OqGjy58zuziZFo
eaVOD06eQnxEdEyc03KQwBDXpo92d+I/AbLVNAoxbFBOWIteSEjKRkmSvrBy90k3
ikG6zAZT3tiNoFZ1i4//70Mgkums0dmNuDAF7G5mfkBvp0E6sKIIuYcH3qCtZ/q6
0hdp9Cj9uSoPE8rSLV/Hq3SuryH3i0zE7KolQAcyitZHP0sbZPAol1xSx5BW/A+V
jxe3LipCjaWuh4RsPPv6iv2egzKMJG07EMGzNhjIa2ZDr2jf61CscBOhZJnbGFeX
ATfmiuknY5KuC4iPvnflYJQzi2CrnGLyoiDMgGTP+NHc0iW/fPnzxgJQpek0wAim
eZh7ctrhKj1yMepB3FS9oAW7gx/PdeyHTuXuTLnioANYFPf09ep8rm6zL1+ZkCyY
ihrF2Q+wDJyFldS26cvJfWJt+4Mr3n6uflh3qE+sBLV6v+giyTb2y0VDn/o+mlXa
j0sUXbcncMqRfj042/crtkolPPGPckridR3E0qbyiLYIpQUlwV3NkELEoH3ElMRx
fFMcyxDrflTeyh+WVerF
=kS8M
-----END PGP SIGNATURE-----

--tjl7patdnin5zmxw--
