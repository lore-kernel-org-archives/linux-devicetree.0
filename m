From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Subject: Re: [PATCH v4 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral
 assocation to DSTI
Date: Thu, 8 Sep 2016 10:02:13 +0200
Message-ID: <20160908080213.GA32547@carbon.kippendief.biz>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-5-git-send-email-jorik@kippendief.biz>
 <20160908062317.GD8913@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160908062317.GD8913@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Maxime, Chen-Yu: thanks for taking the effort to go through my patches=20
again!

On Thu, Sep 08, 2016 at 08:23:17AM +0200, Maxime Ripard wrote:
>On Wed, Sep 07, 2016 at 09:58:57AM +0200, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
>> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
>>
>> Users using this UART without RTS/CTS should override the association in
>> their board specific DTS. All (1) board using this UART uses RTS/CTS, so
>> this breaks nothing.
>
>Using RTS / CTS is very rare among the boards. Forcing it down the
>throat of every user doesn't seem like the right thing to do.

So, I'm going for a v5, with these changes:
- rename uart0_pins to uart0_pa_pins (as there could be a pf)
- associate uart0_pa_pins with uart0 on all H3 board DTS files
- put rts/cts in seperate pinmux sets for uart1 (2,3: see below)
- associate rx/tx for uart1-3 in H3 DTSI (this is the only option)
- associate UART1 rts/cts as pinctrl-1 in sun8i-h3-bananapi-m2-plus
  (to prevent breakage for existing users)

I am a bit in doubt if I should include pinmux definitions for the=20
following things, as Chen-Yu said to only include stuff that is actually=20
used in a board:

- uart0_pf_pins, since there is no board using it
- uart{2,3}_rts_cts, as I agree RTS/CTS is a bit exotic

Maxime/Chen-Yu: what do you think of this?

Best,
Jorik

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfRGwUACgkQ0IyxrguT4/9z4ACfQ9KdrR91yPtoHZg3xgNqH5V4
NaAAnRVTlNaZJ5RBYUTI8KFnmStNlqJ4
=DJ46
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
