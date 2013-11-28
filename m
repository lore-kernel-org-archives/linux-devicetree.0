From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Thu, 28 Nov 2013 21:33:23 +0100
Message-ID: <20131128203322.GB14689@mithrandir>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131127172806.GC2291-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 05:28:06PM +0000, Dave Martin wrote:
[...]
> From will.deacon-5wv7dgnIgG8@public.gmane.org Wed Nov 20 12:06:22 2013
[...]
> A number of discussion points remain to be resolved:
>=20
>   - Use of the ranges property and describing slave vs master bus
>     address ranges. In the latter case, we actually want to describe our
>     address space with respect to the bus on which the bus masters,
>     rather than the parent. This could potentially be achieved by adding
>     properties such as dma-parent and dma-ranges (already used by PPC?)
>=20
>   - Describing masters that master through multiple different buses
>=20
>   - How on Earth this fits in with the Linux device model (it doesn't)
>=20
>   - Interaction with IOMMU bindings (currently under discussion)

This is all very vague. Perhaps everyone else knows what this is all
about, in which case it'd be great if somebody could clue me in.

In particular I'm not sure what exact problem this solves. Perhaps a
somewhat more concrete example would help. Or perhaps pointers to
documentation that can help filling in the gaps.

>  .../devicetree/bindings/arm/coherent-bus.txt       | 110 +++++++++++++++=
++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coherent-bus.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/coherent-bus.txt b/Doc=
umentation/devicetree/bindings/arm/coherent-bus.txt
> new file mode 100644
> index 000000000000..e3fbc2e491c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coherent-bus.txt
> @@ -0,0 +1,110 @@
> +* Generic binding to describe a coherent bus
> +
> +In some systems, devices (peripherals and/or CPUs) do not share
> +coherent views of memory, while on other systems sets of devices may
> +share a coherent view of memory depending on the static bus topology
> +and/or dynamic configuration of both the bus and device. Establishing
> +such dynamic configurations requires appropriate topological information
> +to be communicated to the operating system.
> +
> +This binding document attempts to define a set of generic properties
> +which can be used to encode topological information in bus and device
> +nodes.
> +
> +
> +* Terminology
> +
> +  - Port                : An interface over which memory transactions
> +                          can propagate. A port may act as a master,
> +                          slave or both (see below).
> +
> +  - Master port         : A port capable of issuing memory transactions
> +                          to a slave. For example, a port connecting a
> +                          DMA controller to main memory.
> +
> +  - Slave port          : A port capable of responding to memory
> +                          transactions received by a master. For
> +                          example, a port connecting the control
> +                          registers of an MMIO device to a peripheral
> +                          bus.

"Port" sounds awfully generic. Other bindings (such as those for V4L2,
aka media) use ports for something completely different. Perhaps we can
come up with a more specific term that matches the use-case better?

What exactly does this map to in hardware?

Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSl6iSAAoJEN0jrNd/PrOhn0kP/3Bkkknl+j8QRXmE9/e/rhxC
WcQF68dcYs2TyZLi3zZ3dK+wH837BIVbliwZrZtAwkdCHNSJKYwJuShc1fW//Zdl
XJzcYIW5b1c9RhXTE7QlNXjUUF0O9uc+QjA2aXzF7b9F+0gLJyt9GY+UtupU2xWo
RK9ki6hZ7otjvAh99RRkSgcrTWEuV2HKFb6YK0p/ecbe37Qg9DI/4GljKtxILzbZ
8rJq0pr0m2ooHrK0YRLxQ/7SNNWcM3XPCPi8r+0WzAKp7NLZfPl47mHXwRzKzPvF
kkqFGc7Ewe/TneUO1Z5DTr94XbhZu9OjfoI6rDwBiUIRqMSdFB+Qx4ldOS2vOECm
/9noNuu9Y+2YwuICRpuxbQC6O/enY0EgK2STuXdERGZxqX8+olTiSsN4LV1XB81s
7wxM3Kd/nMPkXVwoiVd3lRUCWIkIXACjar/iybna0+Sb4Um11+ZNVWQqXVGWhRqs
wRz3RP9nD7FL4q/OvUjrNvAUEX+LHUEfIT7KzOSshCRQIawECkjONGJay9cq5bhw
Yn96SxRJgJHUAhcLQ+5Q3crKkE+hiO/HKRT7xtSnRiE/JZB+9Nf49OhHHvp9x2/z
lNG32+1S+kjO0rLBoD2r0FuKA1bmWXxT7RY+duTZGYH57lLnYCIfI8DIWFBo7CeB
Dboj0SQqugXo42LJzxW2
=TwDF
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
