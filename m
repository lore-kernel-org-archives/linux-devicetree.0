From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 21/21] docs: hwmon: Add an index file and rename docs to
 *.rst
Date: Wed, 10 Apr 2019 17:24:24 +0200
Message-ID: <20190410152424.GA11536@latitude>
References: <cover.1554893881.git.mchehab+samsung@kernel.org>
 <5ac1fbc7f19192dcd30a184e62e3f7989a5437a4.1554893882.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4053714340483225101=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ac1fbc7f19192dcd30a184e62e3f7989a5437a4.1554893882.git.mchehab+samsung@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dirk Eibach <eibach@gdsys.de>, linux-aspeed@lists.ozlabs.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Clemens Ladisch <clemens@ladisch.de>, Kamil Debski <kamil@wypas.org>, Marc Hulsman <m.hulsman@tudelft.nl>, devicetree@vger.kernel.org, Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, Steve Glendinning <steve.glendinning@shawell.net>, Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liviu Dudau <liviu.dudau@arm.com>, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: devicetree@vger.kernel.org


--===============4053714340483225101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 10, 2019 at 08:12:11AM -0300, Mauro Carvalho Chehab wrote:
> Now that all files were converted to ReST format, rename them
> and add an index.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
[...]
> diff --git a/Documentation/hwmon/submitting-patches b/Documentation/hwmon=
/submitting-patches.rst
> similarity index 99%
> rename from Documentation/hwmon/submitting-patches
> rename to Documentation/hwmon/submitting-patches.rst
> index 12540b7d9b50..6120db7556aa 100644
> --- a/Documentation/hwmon/submitting-patches
> +++ b/Documentation/hwmon/submitting-patches.rst

I'd additionally suggest:

diff --git a/Documentation/hwmon/submitting-patches b/Documentation/hwmon/s=
ubmitting-patches.rst
index f88221b46153..0000a86be4b9 100644
--- a/Documentation/hwmon/submitting-patches
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -38,7 +38,7 @@ increase the chances of your change being accepted.
 2. Adding functionality to existing drivers
 -------------------------------------------
=20
-* Make sure the documentation in Documentation/hwmon/<driver_name> is up to
+* Make sure the documentation in Documentation/hwmon/<driver_name>.rst is =
up to
   date.
=20
 * Make sure the information in Kconfig is up to date.
@@ -60,7 +60,7 @@ increase the chances of your change being accepted.
=20
 * Consider adding yourself to MAINTAINERS.
=20
-* Document the driver in Documentation/hwmon/<driver_name>.
+* Document the driver in Documentation/hwmon/<driver_name>.rst.
=20
 * Add the driver to Kconfig and Makefile in alphabetical order.
=20

Thanks,
Jonathan Neusch=C3=A4fer

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlyuCqAACgkQCDBEmo7z
X9ssgw//ZmPBGq00gnKgIkdptmktJsCCdbRKqAnKS97nKt6Ad54+llNhFidFR3ij
Owq03OnpCXcu+3rc9qn/bOEv9QHjUmJ9aBysxuMCjbp5Wm69ItkylykWH6DPik8b
BhloTUt0lnoweWJjZ4qtHyp5xuUlsQ2q6RbGR+BQwgvPA3y3FMuMYnvqi4BmuJs4
B2DHhAUQnwgy+CMGBq62WTLZsWU6O4xAGnPRepoEIP4yf3ikOn5uiyYXeJt9sWmB
7TyiXuM+noRFv5qyyiR695nBSlRZN0W690W2au5d8o1d1zp2tnuNTtljFGPv18S9
gxxRiAzJRiXIGlg9cPZuyu/LD+4NbGwbRv8AfYYTcXyf1ZwLU6/y2VYRt9riJ/Ul
1k5LFmFhHlxicwFJmobOor+AxJYtkb6fXCwJ2fSclBgP5tMYiKz3SjMlFxsiAczd
x5uS/ABnXpJXEy3aOKlF3/GLI2ehMXegPLntmgUYGPHybPxTPgMf4ThsKLN0uovd
f5ZeHCR5EtdFtJuECRIbvAeTs7MyawkdRzABA0dVUXmAxRzNxaU5tpFT8S9/AN1I
wHTaekePAAReHn5G87/nu1RwsRWoLe8TyGkpy3IFCPmcYgGzZSF63tM2X0/eHuPi
Q6PdjLqczbpT3X31fJdJ3q9BEWwy+zsHmKCHB81cYGY1F5fAYIY=
=QA5J
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============4053714340483225101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4053714340483225101==--
