From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [RFC PATCH 1/5] of: introduce the overlay manager
Date: Thu, 27 Oct 2016 16:54:25 +0200
Message-ID: <20161027145425.x6idpcrq6nbhmihv@kwain>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
 <20161026145756.21689-2-antoine.tenart@free-electrons.com>
 <CANLsYkyszsn2TLYhUjHMt2ZnEUmE9eSc71W2KWBL0fWhh3PPBw@mail.gmail.com>
 <20161027140342.kidk4gqxwbtphrbs@kwain>
 <CANLsYkxF4_fZwaBe+_0twMhND3TfpnmkXA_1q=AN_j9=cQ5ukw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3478746711418185243=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANLsYkxF4_fZwaBe+_0twMhND3TfpnmkXA_1q=AN_j9=cQ5ukw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, pantelis.antoniou@konsulko.com, Antoine Tenart <antoine.tenart@free-electrons.com>, sboyd@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3478746711418185243==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6d7u2vamgma2rn2j"
Content-Disposition: inline


--6d7u2vamgma2rn2j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2016 at 08:49:29AM -0600, Mathieu Poirier wrote:
>=20
> I agree - something like this should have attracted more reviews.  I
> suggest providing a better explanation, i.e what you are doing and why
> in more details.  I reviewed your set and I'm still not sure of
> exactly what it does, hence not being able to comment on the validity
> of the approach.
>=20
> I'm pretty sure there is value in what you are suggesting, it's a
> matter of getting people to understand the approach and motivation.

That's what I tried to do in the cover-letter. What do you think is
missing that I should add in it?

Thanks,

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6d7u2vamgma2rn2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYEhUhAAoJEFxNi8it27zYjqwQAIJm4r3ogx0fylLlqA61jIlO
zgwY472yvC4VWjtGZIUAymhFmHSZnX2LvmL/o3zbYvI13AkxZRESy4kiYcWdfRGN
Is/9rjKyB2LC6DvIzmdQ186JcyEbXcHoALZpNzpDrrBF+ZCvMpdW1Fri0FVtkWnM
NFTBsZQJNW3OsOOITuLJSry+Boyr8ZMUpHDxTD9AsIYK4kEu5GC3bI0/eNCTjOnT
mkLKUA+R21Szl7a2ERs7+yRSXIBf/wRYxTLc0c/3eJ7usfWdg3wD3JCD5JpSSKYA
tTAf9xEA38iBqubaVDHVa22O4lf++U6nPw+TTVsn97WuQk+kYHC1UtLyuFqSgENc
+ATffg4KBets+mkq2/H/wxARBRsuNyQ4jJaByA5mwanCyEfKYFbOXN3+te8T/kch
+BMQeQF996VPkYQFcdzcirVh9J3LDeH4jZRg3bWlEbGavHuLuvH5z8zKiSDdKyV/
NjmVssl4L+7o0c1JmwmRasBHP1oPyToOF/vFG/tN/JjqBOgFEWtcbSoBgna8ILpN
7BlRxWbNnI7xNA/x9LiS448x+JVGZHwAOm+4MKvzSMqnsl8cNoJGWx0E1IFmCuM/
sb0O2Bf1gmkVidZPR5Yvr59e9AtyRzMgq5JgM0vtqz3t5lQa74N1RdBjbgmmi8i2
8F7CoY+nudRC3LNQfn1b
=g0bj
-----END PGP SIGNATURE-----

--6d7u2vamgma2rn2j--


--===============3478746711418185243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3478746711418185243==--
