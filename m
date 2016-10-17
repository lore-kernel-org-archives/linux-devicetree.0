From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 2/7] ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.
Date: Mon, 17 Oct 2016 09:58:39 -0700
Message-ID: <87shrukj40.fsf@eliezer.anholt.net>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com> <1474274603-24215-3-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474274603-24215-3-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: swarren@wwwdotorg.org, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Gerd Hoffmann <kraxel@redhat.com> writes:

> From: Eric Anholt <eric@anholt.net>
>
> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
> function selects do for the pins, and there are a bunch of obvious
> groupings to be made.  With these created, we'll be able to replace
> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
> references to specific groups we want enabled.
>
> Also add pinctrl groups for emmc and sdhost.
>
> Based on patches by Eric Anholt <eric@anholt.net>

I amended this line to "Based on patches by Eric Anholt, with fixups by
Gerd Hoffmann." to explain why it had me as author but you in signoff.

I had to resolve some conflicts on the way in because apparently you had
built this against a tree with 14 and 15 already dropped from alt0.  I
think those resolutions were sufficiently mechanical that it didn't
merit a respin.

Merged the series to bcm2835-dt-next.  Thanks for getting this done!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYBQM/AAoJELXWKTbR/J7oQmcP/Ai3EDisLEjOaM6iJae5pe8/
S4VCNzIGFJuojbNsEpoLu7mpeoB7kL2w5DI2YUd+IoZgsESagwg3z3VkI9UXguK9
hwdanTQcDnwwJiekAZ4290Pl2jT89cgZLNXipmCmOZ3sr5V4huiOAqiUK2tCxRQ3
8Pnl0qFixpvfo/WszyrenHT4BMoJhx53Yog/8cSkRluQI/QRLtfJtiQ3tJLvt2vp
RwxpxUYq0hYoBqTzidl/VXYT3Wth5JkTvO3y0ljbDQdD4HanR8qBiieMMMr+/2UF
rBhimL40SPAQz+9cpVxQbwvJwEsJ9tZ4xKyJZNV5vSBcJFDnpf3DKdDNQfDgoClY
PXSvDUMvNyA+d5Ds/Fx6F8Vs/+6R9fDqWU5BqYK3yVH0RomZ9Oxi5LiZNgYGXwm5
fp0dN8uWR5dKfjvN0d//lvr+tQTE1s6DwEY0weZYHwUbN4oDVEze3MB4lr9ZrISx
eSEhTSIuNMZwB+/BV169zmWI/aZabkVZtX5hc8/aa0lYRnDAWlPV9YKxYtvNOGc8
0ABKhaNb+HwAQ7PTputCCRLCy1BkhHUpELdU2voUOWkTf7aDgzpGzmDcN+H6EJb6
hKXU2O17ApiWW1SYTk0onC4AzYraNtHFLCBEdkEqvpVjosiiSDCbRX4N+ae91G9j
udxA500rqppopM9YTmcO
=1Vlp
-----END PGP SIGNATURE-----
--=-=-=--
