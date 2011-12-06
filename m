From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding
	GPIO definitions
Date: Mon, 5 Dec 2011 22:55:59 -0500
Message-ID: <201112052256.00939.vapier@gentoo.org>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<4EDD440C.80002@nvidia.com>
	<CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998838338=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: u-boot@lists.denx.de
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

--===============0998838338==
Content-Type: multipart/signed;
  boundary="nextPart1979436.ZpTLeaD5Zj";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1979436.ZpTLeaD5Zj
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 05 December 2011 17:52:01 Simon Glass wrote:
> On Mon, Dec 5, 2011 at 2:22 PM, Stephen Warren wrote:
> > On 12/05/2011 02:56 PM, Simon Glass wrote:
> > * A system-wide GPIO ID, in which case the numbering is "virtual" (e.g.
> > a concatenation of the GPIOs on all the present controllers), and you
> > can choose to start the first controller's GPIOs at 0, 1, 1000 etc.,
> > thus leaving -1, 0, -n..999 etc. as invalid GPIOs. This is what the
> > Linux kernel's gpiolib uses (and some say this global numbering scheme
> > was a mistake).
>=20
> Well maybe it was a mistake, but it seems painful for the user to
> translate GPIO numbers in this way. U-Boot's GPIO command takes a GPIO
> number, which starts at zero.

u-boot should simply follow what linux is doing as it keeps things a hell o=
f a=20
lot simpler for us: the code is done, people moving between the worlds don'=
t=20
get surprised and screw something up, and we don't accidentally forget "oh,=
 in=20
u-boot we do XXX instead of YYY" and screw things up ourselves.

> >> I currently use the max value available to the u8. We can change it at
> >> will when we update the u8 type to u16 which is why I made it a
> >> constant.
> >=20
> > include/asm-generic/gpio.h seems to use an int to represent a GPIO. I'd
> > suggest these APIs do the same, rather than use a u8.
>=20
> Do you mean the fdt_gpio_state structure? I have not used u8 for any
> function calls and would not.

the asm-generic/gpio.h using "int" as a gpio is wrong.  it should be=20
"unsigned".  there's a patch somewhere to fix this.

> This adds 3 bytes for every entry. What is the benefit? People get
> upset when we waste memory!

some systems have more than 256 GPIOs.  it's actually not that hard to hit =
the=20
limit.
=2Dmike

--nextPart1979436.ZpTLeaD5Zj
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJO3ZJQAAoJEEFjO5/oN/WB0KgP/2dFXhrMGEq4J3KS8aPj+PhL
W7Nfn+85Z6Aj1Fy9bfnksKPRkev2ppt2LH8urOp/8MSSmGMiBY4xV9DfUZuPc7BG
VLRudiL/p1qRRgzqXsC9UMbD0MEcbJY77kQ86UxiGjfuPf0jODba2aB3uJfjqi2m
thNmm8LV7p0s24D5BO0jsMU0t3MMBAuPL7rLxaJbuYaVWHA+SNM7zpIcIEbR74du
eFMe/xcBXw9KNmcIlwz5f5sw2Aj6AEgrtf+Qj3uXeYB/etnsig50eBSYkpDBAKB0
88LZsrojUVJegiReqWy4Zh6DynKqCWLiJqXcQ5xzdCKPkhjuEzG5e0dgXT4xBv//
OvfImdfzWm5gtLzoTntbXu6pPtbIuKdjlSIhSfEflRqKTj+WB2fV59Z4SzE6+2Vo
ANNq5fCQeKZLCDmuMBqiQPsvVLNvDMZcpbwAWcROAWaJwuYU6b8mcrij/A+X59LB
iv0HZYPhbhc9CRUThKOOhnimBMeyQBX/eNZyAZqEZ2m9zg6ra8IPFY+G73pdx9A0
iPdlG1mhVAXaOul/n3p+XZe0zWLLxZLanpvG6krWF2i/BNyI4vKny93Wnu6NusFp
gV8P/zGCQJ8l79aSEShA5CC7KEn6QFLfK4w0xkrDGrcLcfVBKWRw7nZMVV/2twox
pQ0ue6AN5zszLtcf68Bj
=xdKR
-----END PGP SIGNATURE-----

--nextPart1979436.ZpTLeaD5Zj--

--===============0998838338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0998838338==--
