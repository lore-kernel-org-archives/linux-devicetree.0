From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/2] usb: doc: dwc3-xilinx: Add devicetree bindings
Date: Wed, 18 Nov 2015 17:02:53 -0600
Message-ID: <87ziyagbc2.fsf@saruman.tx.rr.com>
References: <1447851031-16241-1-git-send-email-sbhatta@xilinx.com> <20151118225331.GA22325@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151118225331.GA22325@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh@kernel.org> writes:
> On Wed, Nov 18, 2015 at 06:20:31PM +0530, Subbaraya Sundeep Bhatta wrote:
>> This patch adds binding doc for Xilinx DWC3 glue driver.
>>=20
>> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
>
> I really dislike how the DWC3 binding has been done. The sub-node here=20
> is pointless. The only thing the outer node does is add clocks which=20
> should simply be part of the DWC3 node. Presumably the IP block needs=20
> some clocks...
>
> Anyway, it's self-contained within the DWC3, so I won't make you clean=20
> up the mess.

heh, it's definitely not pointless. We get a lot of free goodies by
doing it that way. I'm just not going to repeat it once again. But in
summary:

a) we force people to write glue layers for *only* their HW specific
details

b) there's really no way to abuse dwc3 core because there's no symbol
exported from dwc3 core to glue

c) PM (both system sleep and runtime) becomes a lot simpler with core
only caring about what PM details delivered by SNPS (e.g. Hibernation
mode from DWC3) and glue only has to consider the SoC integration parts
of PM (for OMAP that would be PRCM details, hwmod, etc).

I'm definitely not going to change dwc3 because it has made my life a
lot saner. Definitely a lot saner than MUSB. Besides, DTS is supposed to
describe the HW and that's, really, how the HW is.

There's a piece of HW which is somewhat platform agnostic and delivered
by SNPS as a black box (SNPS customers don't touch SNPS RTL) and there's
another piece of HW which bridges this dwc3 to the platform specific
details and integration context of the platform (for OMAP that would the
SYSCONFIG/SYSSTATUS registers, Clock autogating, PRCM, etc, etc etc).

So you _do_ in fact, have two separate pieces of HW which are SW visible
and controllable independently. They each have their own IRQs (though in
some SoCs they share the same line), they're own address space, yada
yada yada.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTQOeAAoJEIaOsuA1yqREDD8QALTt9u5rdbFM53ahZdG22gl5
6kNl8oSay5LZfeGBVmbBkBUzcVFionZxusLYRasavz/MAhorMvXpQwDaJnS8lP8b
Rpxv/21R9c0aDuAlGlDbDI8IlFyq1pN3wzQFqO2b2MIhZ1ZfrfOvliTIkvh1Efxn
EUblv9YTjiQiDZmJhKnqRb+Rp7w0WY+Jm5DmkZY/WUz/TtxDNGRVsqmMsqjSizIC
eKBDOd3Y5KpBb79i9JcuusoTYVJy3kctM8pA7HjeVWBac7oHft1OrnGudye7MLNJ
nV4zACJwlbQFBT5iaERLc0SX2oun4CbuVhXoLq/fekumtOdObPHuwfmsuK+bk9pQ
ypJ4YOY1QJPRekPHu3YkLWuWe1MUlO/1NApW8y/KbQgtxxx9aGst/gedpPWrFI3+
7aATWSqIr9yDboLiotQ0oO6RfD3Rqj2hhfHSCNMKWaqEu75Ygj2nkJ40HitTfRJv
DOqugXdLUvDyLE0zvyLmCyGUOlzioc2EJK5JoFRdJKIeDfWIw8pl37SgoIlbgcSZ
ICZU/vDntq1OjVP5W+cAdOieJwSnA67pHSdDiLOG8deHfw/bj24wZIx6MxY5r+Jx
JaDuOqvQ90kDkR/Pr3QhnQ+pgnTCv6KZxS6SiX0muMoqsQm01/RtCuLuWI+aV+1c
VevxUBGUuEJX5cAJ6m1D
=a2Jf
-----END PGP SIGNATURE-----
--=-=-=--
