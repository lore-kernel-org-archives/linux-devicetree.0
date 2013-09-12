Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46708 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137Ab3ILJto (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 12 Sep 2013 05:49:44 -0400
Date: Thu, 12 Sep 2013 10:49:35 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130912094935.GC29403@sirena.org.uk>
References: <CAPgLHd-RK8nDVDAps549BKB5A_yoPSA3JQB-oJFDB0itSC7sYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xyk/aOhL4uAzAsnA"
Content-Disposition: inline
In-Reply-To: <CAPgLHd-RK8nDVDAps549BKB5A_yoPSA3JQB-oJFDB0itSC7sYg@mail.gmail.com>
Subject: Re: [PATCH] spi: mpc512x: fix error return code in
 mpc512x_psc_spi_do_probe()
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--xyk/aOhL4uAzAsnA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 07:15:39PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.

Applied, thanks.

--xyk/aOhL4uAzAsnA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMY4sAAoJELSic+t+oim9DiEP/14r+HqnIHvIW5FHc8JYtdLH
yRmT0+Wk5z+RvZlV8u9G78Xm6RkduGq67JSM+6IlwIpYf3HBL4GNvaszj0Pc6x35
1IThJkLreQcHoawmmw5lmtoXdzpG1NQqBLVNEJHmyEn3/QD2ZATEfmRnAM36taZQ
vqPnFpVst//MyLZhVxSCNt5GW4uIWZfPz29GtIl2dYDFbxXQAD3NAihkz646Hsqa
GhBf12PjQDjVPHECvnx/esgdmYEuMpVt/1+Ao1yjKQjj2NomGfTGn2ATwigWVm+B
XOEnN3veB/nUk6yNq/1mUw7ysB33OM84qjzaH/RCrvXyKOGYpAV9I0YrW+8EeRvP
T9sHOxFkwr5bTG+uq4LzHCkYMZKhOZ5NK0aGRt54U/muk/l3RyrEEQOj58yNvx9i
p0d3itcFdj3CcScrcf1z/fzAUqKholNlAS4R63uPZOEa65ymwbDz1/JnkvG5yCd2
/Jsf7FhnnT0aDpFqAIzr0tU9hmGutNV1lxMYl4deyPKLeO2ujPqiS0Cv2uNOG5qK
Yeagtz5ujTnlU/L1dWr6XVBNnHLBliyqsLIPKvuyZIy77Vk59AussIvellP6cB0s
aTnQXzPP77qVM6SnbKYo8kwEluDaAcmTbT4yOQDxCr84oOr/vmjz0mErQD2ePkaI
ViEp1dtKPQEToQXjG6kv
=PkGR
-----END PGP SIGNATURE-----

--xyk/aOhL4uAzAsnA--
