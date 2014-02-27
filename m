From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v4 3/8] staging: imx-drm: Document updated imx-drm
 device tree bindings
Date: Thu, 27 Feb 2014 15:16:03 +0200
Message-ID: <530F3A93.501@ti.com>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
 <1393338203-25051-4-git-send-email-p.zabel@pengutronix.de>
 <530F1C4C.2010504@ti.com> <20140227115652.GI21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8116069682168050974=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140227115652.GI21483@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, kernel@pengutronix.de, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============8116069682168050974==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="foqLoKuqlr442jmqXTjpwTjdJlmHBWwgd"

--foqLoKuqlr442jmqXTjpwTjdJlmHBWwgd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 27/02/14 13:56, Russell King - ARM Linux wrote:

>> Is there even need for such a master device? You can find all the
>> connected display devices from any single display device, by just
>> following the endpoint links.
>=20
> Please read up on what has been discussed over previous years:
>=20
> http://lists.freedesktop.org/archives/dri-devel/2013-July/041159.html

Thanks, that was an interesting thread. Too bad I missed it, it was
during the holiday season. And seems Laurent missed it also, as he
didn't make any replies.

The thread seemed to go over the very same things that had already been
discussed with CDF.

 Tomi



--foqLoKuqlr442jmqXTjpwTjdJlmHBWwgd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTDzqTAAoJEPo9qoy8lh71yAIP/AxqvGdAgpRXjfLLkj6GmNeB
Yi8AvICCa5PH3mXhwAMjDA3tzpjs//Cm+kbvdD/qXKxcsTQz3FmB3h0zQVMPi50S
DSeZ4mqBxIBJhq/f6ohRlBac7IghVnSY+mnmi/eJjlFS4VbSxoahPObtW2a+dOHP
66wRyQFd+2pvY8Wt3MBiPI5zjoXjoGcSrc1uB6av2ZsDKlDB0uTxxJuw4lHsP42N
kJSOz/oYVxwEiOQyD4QtxSMQPsExV9/SImjA+e5jZpdwdRyijEc/dxL+u2yQsV6G
KiH/yM8U0qVHR1+JwBPTyRz6XqqnxBK+g0EYrAi5Vba4j1nhchzpqNfJeMlF/DX+
DDbina7LjmCagh8x2wTAPOgfo2wdgToTED5TuBpLPId4Ef8KLj/GjiYOp1n38gnq
6z/RjZXfEIYYuTnm9sOp9ni6JUEAiw2kee7vAvjCqgxKFwirT+sQjhdMHfUNvsT+
zAEnBRhnDXZrVMtRGQl0OVNwftndkkFsLasYbWxbCOi0lFPbXB1R3rOql75+B1vW
eyWokZ4AwO+rKsMNoT2qnY6+cp6c68UJssdC50eDSAQGul+3cq9cqZxh6Sx7gXDJ
h5lA1Pf4qtch3KTbCtPdSvvGlEkwe53R2qiz1TzKkitykFMFyBIMGlUE8bVABs3O
pD5G218tucNul1H2maOo
=XV+0
-----END PGP SIGNATURE-----

--foqLoKuqlr442jmqXTjpwTjdJlmHBWwgd--


--===============8116069682168050974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8116069682168050974==--
