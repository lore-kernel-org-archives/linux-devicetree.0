From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier@javigon.com>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sat, 18 Apr 2015 11:36:53 +0200
Message-ID: <FCFF5E10-0DDC-4ED1-A8B8-D649ADD5E506@javigon.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-3-git-send-email-jens.wiklander@linaro.org>
 <20150418085747.GC29858@kroah.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: multipart/mixed; boundary="===============0018772154696427688=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150418085747.GC29858@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Valentin Manea <valentin.manea@huawei.com>, devicetree@vger.kernel.org, emmanuel.michel@st.com, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jean-michel.delorme@st.com, tpmdd-devel@lists.sourceforge.net, Jens Wiklander <jens.wiklander@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0018772154696427688==
Content-Type: multipart/signed; boundary="Apple-Mail=_5B2C881E-5628-4DC3-B515-B14E53998F84"; protocol="application/pgp-signature"; micalg=pgp-sha512


--Apple-Mail=_5B2C881E-5628-4DC3-B515-B14E53998F84
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
We have discussed and implemented an in-kernel interface for the driver.
However, we need to agree on that interface with the kernel submodules =
that
can be interested in using it (e.g., IMA, keyring). We though it was =
easier
to have a framework in place before taking this space. This makes sense
since a TEE driver will be, as for today, mostly used by user space.
applications.

Best,
Javier

> On 18 Apr 2015, at 10:57, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
>=20
> On Fri, Apr 17, 2015 at 09:50:57AM +0200, Jens Wiklander wrote:
>> Adds mostly stubbed OP-TEE driver which also can be compiled as a
>> loadable module.
>=20
> Please provide a "real" driver, so that we can see how this is all =
going
> to work.  Otherwise it's not really that useful to create some =
framework
> that nothing in-kernel is going to use.
>=20
> thanks,
>=20
> greg k-h


--Apple-Mail=_5B2C881E-5628-4DC3-B515-B14E53998F84
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVMiW1AAoJEDxGAX0tJXjg0ZgP/2TnVnisLfTpgcfDMmaChqZC
oqdQgun/dc0df4PJn43jw23zuAQgqex71+WwSoomvSUw3aHM7dPcTSGf4/S9Dcmr
kr8vZOpKh/5XH5EI5BGkr7JSRtxTa1YhbIqM79+bWEHcblsGpNu0UtCWleoDHp/g
emy6K8eUnhrPJURLkQYj+3ZWYFx5kjk7CZ4RJBf7jLtoC1Nn1eeeqnRHUf/6N0aJ
b8c7IQM2Nr60chA+po7SAaBoMQGEfLhpc3UtdrgQ5TcUVt42HejJ7q7iIQ/xOFbj
yY/YruJwLXO4VhU29jWH99r5WapkG1cnbqjpJ5c5djpALw/ALbrRgAWsybuDpItc
vgj+zlcocffANVMVqiAM+sP0jdqF+/vo4Ec8xqRMaeKcrZqEXakuplCrty76Vdcz
URYZDOxxQHjq4bpdAsI71Hmyce0UxpO5itcpB+ku8M0DYJZm1w0TPlm0Y/XHifm6
lhivZSuwFcWZhWhUQh//76kjuWOO2IonwkzrUHMAD5TM7xoLCVu5k+1Z04Y/Gjmx
RbcQG7gwNglrWZNbKqiC+PBdTI5FzFIJ+8rgd4MoamG8CUu2YE5UYWoaqsZkCDwa
UW2P0huSv7DwynbLFlfRVPJtkpfUU5prVlC3d2lj6M9uyUKz+pZtf0X2RQy8HIrh
3i7SWA1/p2cng/UED6r1
=21b7
-----END PGP SIGNATURE-----

--Apple-Mail=_5B2C881E-5628-4DC3-B515-B14E53998F84--



--===============0018772154696427688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0018772154696427688==--
