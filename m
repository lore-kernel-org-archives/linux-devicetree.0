From: Jorik Jonker <jorik@kippendief.biz>
Subject: Re: [PATCH v4 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral
 assocation to DSTI
Date: Thu, 8 Sep 2016 11:51:09 +0200
Message-ID: <20160908095108.GA14915@carbon.kippendief.biz>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-5-git-send-email-jorik@kippendief.biz>
 <20160908062317.GD8913@lukather>
 <20160908080213.GA32547@carbon.kippendief.biz>
 <20160908090153.GL8913@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160908090153.GL8913@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: wens@csie.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 11:01:53AM +0200, Maxime Ripard wrote:
>On Thu, Sep 08, 2016 at 10:02:13AM +0200, Jorik Jonker wrote:
>> So, I'm going for a v5, with these changes:
>> - rename uart0_pins to uart0_pa_pins (as there could be a pf)
>> - associate uart0_pa_pins with uart0 on all H3 board DTS files
>
>Please don't. We use that naming scheme everywhere else. Plus, nothing
>prevents any one from using one PF pin and one PA pin.

OK, I will leave uart0 untouched, that's a good point.

>> - put rts/cts in seperate pinmux sets for uart1 (2,3: see below)
>> - associate rx/tx for uart1-3 in H3 DTSI (this is the only option)
>
>I'm still a bit skeptical about this. This wouldn't be in any way
>consistant. I prefer to have something consistant and a bit duplicated
>over something without any duplication but that confuses everyone
>about what should be placed where.
>
>> - associate UART1 rts/cts as pinctrl-1 in sun8i-h3-bananapi-m2-plus
>>  (to prevent breakage for existing users)
>
>You can also set it in pinctrl-0.

OK, sounds reasonable, but also a bit contradictive. One the one hand=20
you prefer consistency (so, let uart2-3 follow uart1 and include rts/cts=20
in them), on the other hand the common case over the rare (so split off=20
rts/cts). What should I do with uarts2-3 and should I do that to uart1=20
too?

Moreover, Chen-Yu prefers to drop _a and @0 when they are redundant,=20
which does not appear to be the convention, looking at existing=20
sun*dsti. What's your opinion on this?

Best,
Jorik

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfRNIwACgkQ0IyxrguT4//O4wCgjRW6JLUMFqkjSGtCexZCcZBT
84cAmwXuB01giuBJVYU392fcuPCnUk/L
=Ha1I
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
