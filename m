From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
Date: Fri, 26 Jan 2018 00:14:43 +0100
Message-ID: <20180125231443.44yy65ztr6exaam7@ninjato>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <00fc90ee-de26-f819-9c81-27d06918564d@gmail.com>
 <20180125060330.781667e9@vmware.local.home>
 <a30d4cd3-0068-8cca-cc2f-ca207d0d278b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n4w6rxijzavoppz7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a30d4cd3-0068-8cca-cc2f-ca207d0d278b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--n4w6rxijzavoppz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This means that ftrace can not be used for the of_node_get(),
> of_node_put(), and of_node_release() debug info, because
> these functions are called before early_initcall().

For the record: You can still unbind/bind devices. This is how I
debugged an issue.


--n4w6rxijzavoppz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpqZOMACgkQFA3kzBSg
KbaAZQ/+OJuePdP2xy5w1SKxHCqgxaovSERYGNlXVBRkH7gRB336v4p/YprZM6qR
+0LXfF8awfZXFd574ZlAaT+rCR0LtsP5IG0URrONoGb5Shu50ywM0Y0+dgcqUruh
2h4vdPGGLooI+Seu28spakiT+yK/K0uPhuGffouZEriyCIZB+EUO4NGpsKmHFUnP
n2fSJGDvUk6gY630NZROwkaTPJrj0+7Q2gZTfIBVDa2pHYLqST5sOjhXAcTPHAjM
rt5eTs4QOWfN8njoDPzUreLVWP/ZYxtA1S83p0YZ4UDcAEuo5/XKPyhHcegriBYB
aNCdg26Axf1JDbfrpYC1oYLjhvFGxoyiNZyr2JhhlpIQPbwHRXu3glC8fnMZxH2H
tx3UMg9Zr8QlgQ1M9OHGQP/7luK/wxSpc7TBJdLIzospaceJxXKKj4C64i7zjT66
PpyWCxYPvSp8Q8SW5NJ62WklVuPY04cM2Wpu6Eq2dv2v7Ci0JaHuLm53bIfK0Ipj
z3I7fKHGX+L1oqTnCnGm3p2jNnpyiJu97EvSPyqh283qjkDvFq3WDOHelf6XKQos
PRhVFcqQNbieT4ukd3CQFBskuavznXEYHaSfHZjr1CEver7s78ocXXzbmTgE4QfL
kS9LwcvZwgrCHeZX6B97lyas1btGTvyHcEQPPPtfKOJPtuWh/8Y=
=awQJ
-----END PGP SIGNATURE-----

--n4w6rxijzavoppz7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
