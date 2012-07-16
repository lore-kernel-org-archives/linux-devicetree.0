From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65910: set input_supply on desc
 unconditionally
Date: Mon, 16 Jul 2012 20:57:57 +0100
Message-ID: <20120716195756.GA10774@opensource.wolfsonmicro.com>
References: <1342446294-2644-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9040332630029312047=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1342446294-2644-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============9040332630029312047==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 16, 2012 at 07:14:54PM +0530, Laxman Dewangan wrote:
> Set the supply_name in the regulator descriptor unconditionally
> and make this parameter as required parameter in the device
> node for successfully registration of the regulator.

This doesn't apply against topic/drivers, please check what's going on
here.

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQBHIrAAoJEBus8iNuMP3dTcoP/1xS0IJP0JYlk7oAeYhtV581
zGsQkC9WCQqDYdbsEz7c5ZCI0v92mHPbvONs0n1lBNclynyuIggj7GuNM7w1SFIE
jwpwCZmbHSev9Z7JIAEHK4c5/nVV0SSnX0Eo2/toMmS5SYtPeU55FMfBd4YlBJH6
GaZTAkCjNcOLM+GApMkMXroMpe38Iw9rF7PlF3J5nobSKJ6iSXFeiiRO5JItZ7Zo
PcLHwKQVWkW4zL5G2VUWoRT5reYq3vHke+A7v8YDmjGv4NSYU5JOmo97zvsyiu77
B+bsXl5uwm/zgInfeSpPMinCoxXVI4TKvgoeWgf4wj+c9pJzs9EpmqUKykFPMEno
/vuqfJeYLfcIzGYcJWipdYp3bHU48RN1Bz8Ell2cixtnpBwpNZ9TosERX6+m1mOb
9aVUVpba28w59lnK7BTnm095H8YMIgr+aw3rFCA8yCJKOPJ3jVL2ordPxGJRGw1m
DaSVSi+uZVtV5iWJ3200WSAsaMIg+eiN61nPu+Yx/tp9zxl6eyA07n7sFP5Jup21
bCs8rnFeqN7GSm/qoim+ZhpKnwfuAfgR06IOqo13KDaHcCqAZHCdpEJFccmI9yCt
WLT1+HO+Imok88t6E7AiZJcEz65sxZ5nmWiXWWYtAvozNGfZO3GJ4/k6a+1j0cIa
inMJAIfz6gHoX6qhM1TM
=eV7c
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

--===============9040332630029312047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9040332630029312047==--
