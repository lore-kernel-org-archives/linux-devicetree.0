From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/3] ARM: sun7i/sun6i: irqchip: Add
 irqchip driver for NMI controller
Date: Mon, 3 Mar 2014 11:55:14 +0100
Message-ID: <20140303105514.GV607@lukather>
References: <1393529662-8663-1-git-send-email-carlo@caione.org>
 <1393529662-8663-2-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MqIM5Iaa8ROQPHlo"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBM6B2GMAKGQEWMVATJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393529662-8663-2-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MqIM5Iaa8ROQPHlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Carlo,

On Thu, Feb 27, 2014 at 08:34:20PM +0100, Carlo Caione wrote:
> Allwinner A20/A31 SoCs have special registers to control / (un)mask /
> acknowledge NMI. This NMI controller is separated and independent from GI=
C.
> This patch adds a new irqchip to manage NMI.
>=20
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--MqIM5Iaa8ROQPHlo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTFF+RAAoJEBx+YmzsjxAgsc0QAJYVz+kzafClo9FmZz9Rfuwp
bxWfcsnsRmgm1tSkO2A299mr55jjFyp2+voU4GvAMqZwOsogq9/+ee9RTXfevB4U
bgpywO01xnACtrPrDVLRkzox4i/11fQZl381vv23KipRNaVoagzaxFtiwYTpbCEg
zxsAJmQJa6A/6DeT86BdlXAAoRTQmWZqhjr8hZdcHRDcBPbdMg/KuC/1cOjjQY6l
hxdHDkNhCT2L/TSzTDXGPav/RSzayZOg2tMqLFPna5UZvs1onThtwkOiDAxn/kFF
bd6fd6qp4QsFNKCieDoGTWbQSgoX2Lb7Ek8bKYOMr+TwANYw9Neip0+hIVoNJeIG
I3vBnIpbWrCtOBDe2wSwDe9Pd5rxOyhvr5k1Yh6KVRfa/tPY+ltK7azDGBOErOrH
pkMavYVc0FpPMqNe5rloAbN5115kBFrMKiki6We16+qPoQxdEmL7HzQj7jH26d5I
9PQ9M3730f+o1Qo0EJsh+2/WiuNpgDCFlgudkTWzTSboV2NER4cJilnviM5U8Hzn
bxFlGR75TkGoKIKnpps+T+tFKP1EZVLekbEM+CwSooRBFYx53X7RXXXhSXbvMmkS
sWotKwWnJe0wDhF9NwZKBUfu/1KCjVMSDQ+//AVQYqvspQtyA+NVA5zWvNwKF6bg
lebDVkt/qhNUTyfB8o+O
=JQdA
-----END PGP SIGNATURE-----

--MqIM5Iaa8ROQPHlo--
