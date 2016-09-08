From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 1/8] dts: sun8i-h3: drop _a and address suffix from
 uart0 pinmux
Date: Thu, 8 Sep 2016 08:17:34 +0200
Message-ID: <20160908061734.GA8913@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-2-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2558519445090704449=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1473235141-12768-2-git-send-email-jorik@kippendief.biz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jorik@kippendief.biz
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2558519445090704449==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 07, 2016 at 09:58:54AM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> These are the only possible pins for UART0 on H3

That's not true, you can also mux it on PF2 / PF4.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0QJ+AAoJEBx+YmzsjxAgS3QP/1leijQPWZn7UCLAOi6Xi7r3
9pWpkk+lctaiOi1XiIXb1IwsVCIKktgtLBgS98qSubFKFYpo6exsSKJUU8DrX461
QWxMgt1YfnmhWCP07qwgdvUDUn3GPkeAa99Ur6BnUcqpD/f4AHbcBig8jPOb5hXy
4eVrq6pD9POuO3seE8tObto/f9+eXYQImXch0+5m6a8f5rRCbGQTYQCpVAYUbXGA
ZGugkzb9eoUKtbRX0elCzLkESIQH8IouApxAiDf7JSfyv00+Nsx79WNlnHR5dxH3
dziCE0cYxZkj1kVW95UlKCv+zjCbg67dpjAJf2cmGNC9EyY9RupoLmqqh0iBnAg+
6rjovu3BfMIzzteu8PXmwDIr40UY4WwY/pnSdpJQm5a4pgAuAErqzoEgCzu3QwUc
ne86pLhXxSUL36p7zpb4D+3pp190jUb0gip6XU5ZwZ9HJqvA7cHzq4i1NVx4V5Fx
krGdsJlmXv8eDTBaFo5iVIRjc+eJjWWPj5X5HV1FivJS8iyBJEO20JXH0/b3UBFm
re8GrrMkIK8Wqu3YP8OkCsh1O0MHnZISAD2kkPigKD6Uje0AUaM8sGoZQueG/ZkD
T0ThaoX4f+ziKHweLdpDx5kEV9RPUeqLYFq2BSMgqXBcQ0VHZ5rv6TdtC9YPaxH8
Fl1ubYdtCrq/Tw8avPhE
=rlb6
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--


--===============2558519445090704449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2558519445090704449==--
