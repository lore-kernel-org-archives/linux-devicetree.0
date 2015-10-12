From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: pmic: Document Hi655x pmic driver
Date: Mon, 12 Oct 2015 17:49:31 +0100
Message-ID: <20151012164931.GK4238@sirena.org.uk>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
 <1443611111-3196-2-git-send-email-w.f@huawei.com>
 <20150930173921.GJ15635@sirena.org.uk>
 <56160E22.3010703@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nrM5Z5VIJgwP9LWp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56160E22.3010703@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wangfei <w.f@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, khilman@linaro.org, sameo@linux.intel.com, lee.jones@linaro.org, lgirdwood@gmail.com, bintian.wang@huawei.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, puck.chen@hisilicon.com, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, z.liuxinliang@hisilicon.com, william.wfei@gmail.com, zhongkaihua@huawei.com
List-Id: devicetree@vger.kernel.org


--nrM5Z5VIJgwP9LWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 08, 2015 at 02:33:06PM +0800, wangfei wrote:
> On 2015/10/1 1:39, Mark Brown wrote:
> > On Wed, Sep 30, 2015 at 07:05:04PM +0800, Fei Wang wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> >> +                coul: coul@1 {
> >> +                        compatible = "hisilicon,hi655x-coul";
> >> +                        interrupt-parent = <&pmic>;
> >> +                        interrupts = <24 0>, <25 0>, <26 0>, <27 0>;
> >> +                        interrupt-names = "cl_int_i", "cl_out_i", "cl_in_i", "vbat_int_i";
> >> +                        battery_product_index = <0>;

> > For example, the "battery_product_index" property here is undocumented.

> now on hikey, we only enable hi655x-regulator-pmic function, and
> regulator is child node of pmic.do i need to document regulator
> dt-binding in this file or create a new regulator dt-binding file?

Either is possible, though it is common to split the DT documentation
into per subsystem files for ease of reference and to avoid cross tree
merge issues.

--nrM5Z5VIJgwP9LWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWG+SaAAoJECTWi3JdVIfQXFQH/0xssC7qGw4v0YJQ16pzEFru
dImgv/02ZSaYQvfjlKsWUsMXYtzCOsYSSkaf9g1OF4HOdigOQo/3nobUDd9JKk+x
5gmn5jgdjLCjbYLpysAuMXY132rM2UPglQuYL7ayGESJmobmp04HwhvLGXfJcbav
2H7KB/7QP9rHwH/80AmvnKV1MtuyB0Xtjbna3eA57k5tnRW7GDMkeI/CXOoz8vyZ
qcswrOogK5kshXLQUe8gIx78Q0kjiGIFmWiYU31eyuJIZeMMU0YdiGVq6JLTvj+8
pKNbC91GlAgLO/cpwX0Ht7QRxlHV7Jo+6ulNiJ6Hqt0LTCJbtYzY2iHvsHTK32k=
=tBvg
-----END PGP SIGNATURE-----

--nrM5Z5VIJgwP9LWp--
