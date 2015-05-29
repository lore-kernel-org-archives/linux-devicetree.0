From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/7] ARM: bcm2835: Add a Raspberry Pi-specific clock driver.
Date: Fri, 29 May 2015 12:09:41 -0700
Message-ID: <87mw0ncia2.fsf@eliezer.anholt.net>
References: <1431978219-14226-1-git-send-email-eric@anholt.net> <1431978219-14226-3-git-send-email-eric@anholt.net> <55679085.6040402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55679085.6040402@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 05/18/2015 01:43 PM, Eric Anholt wrote:
>> +	init.flags = CLK_IS_ROOT;
>
> Is it possible to add clock parent information to the driver, so the
> clocks are all hooked together into the correct tree, rather than all
> looking like root clocks?
>
> One of the many reasons I didn't do anything FW-wise for the kernel was
> the hope that such information would be forthcoming, and hence we could
> have complete kernel drivers.

As far as I can tell, none of these clocks are the parent of any other.

There's a layer of PLLs, then clockman almost always just dividing off
of those.  In response to a clockman request (which is what this
property tag quickly maps to), only PLLH ever gets changed as a result
of RPI_CLOCK_PIXEL.  PLLH feeds the HDMI and VEC (SDTV).  We don't have
an SDTV clock for us to control through these interfaces, so there are
no conflicts that I can see.  Only two clockman clocks I see divide off
of on other clockman clocks, and we don't have access to those.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVaLl1AAoJELXWKTbR/J7olTcP/2iM26XYmG+ClekdnTw5gxR8
hzZXDh0Mqy2tzK1oLFWL/EeccgfLV2wApLhHiJeu89X6OyKYg0VlAEH+ewlOUxX1
7Ygf4XJQHUJAjRqz2vj14btwTR84Y0dZXLaC4Xq36es8qZmHWATta+OkWq28uFmW
6Z0j8vLQxRT4gzjiKq5Xaj3/XIaA31NdHeNhXCfQvaWiatxPhGofKCniOYqyobvM
vyQ8EeS8P4cccbV2IzrevcKdSb6QulMALHI+CERLEcIet7X1ZC9p3/esgIQGiRZS
eYSQL+MvAaNCt3U5WQN/FCZccYjx4e19PIyiYbtSVSYPsI9JEwR0+LxBbeRUrVF0
RJ2gLWGfQfCGykillmCcepTka7R40SX/Nd178kCIKdOPZpjmTSUGVpyBAc/eQMxB
301Epow7eAo+fe1c/sfAxoWnJUVwRolRZ2RyNgNOQJkQUAwIKGeNvlBwX86Lr+jk
qynsBWwiPl3g3iO7Qiy/860kpPlJoz/i6jCXB9uMjCNR//XPiPwYSLu3k3hiR7RD
wKX3HKudunaEr0W+O2Drt5Mm+vFqABsCkpPCd5iPJ412p/k9wZPpmYLcZkf177QT
Fi4ZMUaRzrnsZdd1Oy+x7Xipc3Ixh5vumTNzDOVNzcEZQyRjgZjAjM3wKTcWdrPV
8bSZA55gPD6DE8STYvGU
=yRns
-----END PGP SIGNATURE-----
--=-=-=--
