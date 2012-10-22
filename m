From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 3/3] DOC: PWM: Adding binding document for via,vt8500-pwm
Date: Mon, 22 Oct 2012 08:35:58 +0200
Message-ID: <20121022063558.GB17181@avionic-0098.mockup.avionic-design.de>
References: <1350643135-13197-1-git-send-email-linux@prisktech.co.nz>
 <1350643135-13197-3-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1350643135-13197-3-git-send-email-linux@prisktech.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Prisk <linux@prisktech.co.nz>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 11:38:55PM +1300, Tony Prisk wrote:
> Add a binding document describing the PWM controller found
> on arch-vt8500 supported SoCs.
>=20
> Signed-off-by: Tony Prisk <linux@prisktech.co.nz>
> ---
>  .../devicetree/bindings/pwm/vt8500-pwm.txt         |   17 ++++++++++++++=
+++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/vt8500-pwm.txt

I think this can be folded into the previous patch. One other comment
below.

> diff --git a/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt b/Docum=
entation/devicetree/bindings/pwm/vt8500-pwm.txt
> new file mode 100644
> index 0000000..e8ba133
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt
> @@ -0,0 +1,17 @@
> +VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
> +
> +Required properties:
> +- compatible: should be "via,vt8500-pwm"
> +- reg: physical base address and length of the controller's registers
> +- #pwm-cells: should be 2.  The first cell specifies the per-chip index
> +  of the PWM to use and the second cell is the period in nanoseconds.
> +- clocks: pHandle to the PWM source clock

I think the common spelling is "phandle".

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQhOlOAAoJEN0jrNd/PrOhzjAP/i6cVI9kMmk9xapzqJeY11U8
jrr7epbE3plPZiHF/luIk2f2B7rTm3OsKxr9giTZzfl7Tq9ztoXivRUF4wMewkaK
cYrOA1L1ud9QUmLde+t98I+xhPXcG20uXP3YBmXHwEePzBBad0ZnVLDEktjJY6XC
AX/1/ebWZQ/wyJx2CFmWkRaKbbQH7SuFo8qBasgVcGDg44xiimbwwpmm0Wkj579B
8WKG2C6I85LDGuUusonEbMMK2y5a7e6Xu5aUEJ7zDzkCCGwmXwLuZJCWnafsUAdI
sdJYQ0ag6JNmJj1DZOYpzh8OeC2DAge+Aw/tVS97ute282kS7NZvn0z6B2Toiev9
CLNnanVeCZsfkAIuCMBS5JTLzjM+RH8n54MgSIJHPMHHr0ZAExocy9S5ApTPshfH
4l1YRUpljK5+QAA9CUYb67VTWhpvhes95DnFHU67UxgOI8kDztBrYBuoul1+EhWx
KKA4YgTg8P/VAAIMKFPCM6NZnjrrj9su/I4Uvm7g4vIHF+6fmu1JcMxwnIGbW94L
L8qCrCl7xfTV2kAF+3q27pSTL/8y5V1NLE9nOiPb3YQrqOuaEutLjoNiowT4JJNc
1seDArkgDImmYXTSUviNgxN2HygcQBDkUfEwl2930TVp9i33jnRk22oNEnjQBmKK
fbGHY3rnbaL0PYTEeakQ
=FaDT
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
