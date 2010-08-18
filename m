From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Thu, 19 Aug 2010 01:18:56 +1000
Message-ID: <20100819011856.bfef5f65.sfr@canb.auug.org.au>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
	<20100816204211.GA17571@angua.secretlab.ca>
	<20100817134039.fc1108c7.sfr@canb.auug.org.au>
	<20100818143926.GB2849@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0892444477437513409=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100818143926.GB2849-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0892444477437513409==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Aug_2010_01_18_56_+1000_j7Y8IpmBi+6UQ0n9"

--Signature=_Thu__19_Aug_2010_01_18_56_+1000_j7Y8IpmBi+6UQ0n9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

On Wed, 18 Aug 2010 15:39:26 +0100 Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> wrote:
>
> Kconfig will pick the default machine which is an IP22 for allyesconfig
> and allmodconfig.  The makefile will then pick the right flags for the
> compiler based on machine, processor and endian selection.  so it'll
> happily build a big endian kernel with a little endian compiler.  All
> that's really different between those compilers are the defaults.  Buildi=
ng
> more different defconfigs is a better investments of CPU cycles.
>=20
> An issue with very large functionss for which I've posted a patch earlier
> today used to break makeallconfig / makeallmodconfig on MIPS.  I'll sort
> those out but right now I just don't have the CPU cycles to regularly
> build such monster kernel configs.
>=20
> A suggested set of kernel defconfigs to test:
>=20
> bigsur_defconfig
> cavium-octeon_defconfig
> ip22_defconfig
> ip27_defconfig
> ip32_defconfig
> malta_defconfig
> allmodconfig
>=20
> These cover a huge variety of features, UP, SMP & weirdo SMP, flatmem & N=
UMA,
> 32-bit, 64-bit, little and big endian.

OK, I will adjust the MIPS builds tomorrow.  Thanks for the suggestions.
Just be clear, I only need to build with one compiler (presumably what
gcc/binutils produces when I ask for a "mips" toolchain) and can drop the
other ("mipsel"), correct?

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_Aug_2010_01_18_56_+1000_j7Y8IpmBi+6UQ0n9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMa/ngAAoJEDMEi1NhKgbsiXMH/2bOR2K7i9XtpX6mPxzDxame
8CCWt95rYo1+b2e8bKRvHn8gAnjDPVfrXtOMISaodcLdwuvO8PtbD1uOMO93YUej
dK1krXMUYf1GMHkyeydTM5KrLOALfY2QpOCmGg3oC0h+WERe5REXw4uNHxYZ3jD8
okNUbMQMT9y+6VodbpfnLK7sksAkJn//F5gdEe+UZCejMzUyLFG4vGpXwpEcvfpQ
LFCT+mzlIdW7kEIiwBICQXq8N/D6sFIzavx+E43mt+zxRz7YXlTuJMTMVp8gJqaO
v8HAtkGwhzGsQBDFJkbjqOMqRzUDNvmRsuLEl31qFBzqz45+xbCjwt9ykP4SP/k=
=FjZK
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Aug_2010_01_18_56_+1000_j7Y8IpmBi+6UQ0n9--

--===============0892444477437513409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0892444477437513409==--
