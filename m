From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed-lpc: Document LPC Host
 Interface Controller
Date: Fri, 16 Feb 2018 15:34:19 +1030
Message-ID: <1518757459.10440.32.camel@aj.id.au>
References: <20180212070847.32387-1-joel@jms.id.au>
         <20180212070847.32387-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-gNbZ4d3BCzIKF12NhpLC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180212070847.32387-2-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-gNbZ4d3BCzIKF12NhpLC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-12 at 17:38 +1030, Joel Stanley wrote:
> The LPC Host Interface Controller is part of a BMC SoC that is used for
> communication with the host.
>=20
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 40 ++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Docum=
entation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 514d82ced95b..94a31de109c4 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -109,6 +109,46 @@ lpc: lpc@1e789000 {
>  	};
>  };
> =20
> +BMC Node Children
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +LPC Host Interface Controller

This should be under the Host Node Children header given the
function's position in the MMIO layout and the split prescribed by the
bindings.

> +-------------------
> +
> +The LPC Host Interface Controller manages functions exposed to the host =
such as
> +LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> +management and bus snoop configuration.
> +
> +Required properties:
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc-ctrl";
> +		"aspeed,ast2500-lpc-ctrl";
> +
> +- reg:		contains offset/length values of the host interface controller
> +		memory regions
> +
> +- clocks:	contains a phandle to the syscon node describing the clocks.
> +		There should then be one cell representing the clock to use
> +
> +- memory-region: A phandle to a reserved_memory region to be used for th=
e LPC
> +		to AHB mapping
> +
> +- flash:	A phandle to the SPI flash controller containing the flash to
> +		be exposed over the LPC to AHB mapping
> +
> +Example:
> +
> +lpc-host@80 {
> +	lpc_ctrl: lpc-ctrl@0 {
> +		compatible =3D "aspeed,ast2500-lpc-ctrl";
> +		reg =3D <0x0 0x80>;
> +		clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> +		memory-region =3D <&flash_memory>;
> +		flash =3D <&spi>;
> +	};
> +};

ACK wrt the content, just need to fix its location.

> +
>  Host Node Children
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
--=-gNbZ4d3BCzIKF12NhpLC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJahmZTAAoJEJ0dnzgO5LT52c4P/3ZzJU8r2LgucUqkicb8QSTq
EK3WKpJcyJGYkIrvd8pf/8VdG0rTnz2jLVdNGUUMFRDWjG7aUo8rL0GtCPpFWsjB
j9DRVdwZLrdAfYmZ8Bv8CK6isBx9jzjAWeFN7i+LvcjmS5LM/slRvk+n7UuwATe/
1s5dpYu+6FrFSPV/1Fa0tG1VuEw9Iv2bDK1DdVPyVu0Lt1IogXnNnDLHkauFEhxU
67XQbBBXRXNAklMrWDwnRtgdotKXVpmv5IcPA9uGgwAXH5J8QnEQ8DKRpLw+VPIt
s2E3l2yZLydQ1sAoWaJeD5CUeAadt+p6CutV1oIU3o4YrgE4H0Lx1ikfFYXI6E2+
xdL5ObabsBi9p4hJ/0kc5VUqX/FWkuTqMqsU7MOxjUocf9iKDRX8AP40zzppCqIO
OqnySRxDrRy/sWEdPUrjM/XotooW55FPLlugP7MzFogoJAUMTJ+imZevEHUOK/Wx
ZQY4ExX9fblB/r4hGiAu+guw3uRRqM027enVbJVIyW+8X126W7WCWXgB5tRcHg3E
/2zxMwWwiEO2NLBHVKvju7V5uOH/jXifAISPrqfoyc2trJb4nf9vN40EFwq3YnEs
0gh9rXGqxGI0WM8VxkhXO9qkYZ1LLzduElQG8Ly5XNj1Wu/WM60Ba+7p8zGdVU2Y
Q5zBxZj6FzhZdTqPjLKe
=Fyfi
-----END PGP SIGNATURE-----

--=-gNbZ4d3BCzIKF12NhpLC--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
