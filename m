From: =?UTF-8?Q?Martin_Strba=c4=8dka?= <martin.strbacka@nic.cz>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 7 Nov 2016 08:41:39 +0100
Message-ID: <e8f73fe4-0b8b-0b53-4ae1-c592ac5b576a@nic.cz>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105212326.GC1216@lunn.ch>
 <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8545141832835743603=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Tomas Hlavacek <tomas.hlavacek@nic.cz>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8545141832835743603==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QN31JgM8CLKKH2kcWJQx0IBCMLFGs2vUo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QN31JgM8CLKKH2kcWJQx0IBCMLFGs2vUo
Content-Type: multipart/mixed; boundary="Qdh2OCRT7kjvfKinIs6imXHv6ta58jaI9";
 protected-headers="v1"
From: =?UTF-8?Q?Martin_Strba=c4=8dka?= <martin.strbacka@nic.cz>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tomas Hlavacek <tomas.hlavacek@nic.cz>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <e8f73fe4-0b8b-0b53-4ae1-c592ac5b576a@nic.cz>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105212326.GC1216@lunn.ch>
 <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
In-Reply-To: <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>

--Qdh2OCRT7kjvfKinIs6imXHv6ta58jaI9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 5.11.2016 22:27, Uwe Kleine-K=F6nig wrote:
>>> Do I need to "register" turris in vendor-prefixes.txt for that?
>> >=20
>> > Yes please.
> OK, will wait for Martin to comment what we want there. cznic or turris=
=2E

Hello,

please use CZ.NIC in this case. Turris Omnia is a model name.

Thanks for your work!

Martin
--=20
Martin Strbacka CZ.NIC, z.s.p.o. tel. +420 604 217 854


--Qdh2OCRT7kjvfKinIs6imXHv6ta58jaI9--

--QN31JgM8CLKKH2kcWJQx0IBCMLFGs2vUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYIDA0AAoJEIHiGEHFlmvPnSEIALAid45RpkSB//8E/nxjPUDQ
yT9tr52SEpoSbHDbeYGQ6vi6gOEqzFFugEz0nwoOxY0GDPGaLgWJqCg1UMve6lNS
9Hg3k8yjhalxlXU75Sb2Aw4CJTbZViXy0AWjltlBT3SMPo446DDJBDby67x0OHaD
4MLACO20lZYkSDMZ4VxGvytbt7us4J/D1oL0Yv2hXb5NVfy/kpQDmkyyoBzF6xJ0
cWis9sg1krf5SO/c1iQwkg5A1+kCRXnaQqiP/lja3u6VLoI5e51XiZwdhUXZHAIq
Iv4tUy1UngIX+oF4vSmdqibSnVmcLVGj7zymz2+dwfmJlfK8QAjCShs3dS2TsW4=
=9uHj
-----END PGP SIGNATURE-----

--QN31JgM8CLKKH2kcWJQx0IBCMLFGs2vUo--


--===============8545141832835743603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8545141832835743603==--
