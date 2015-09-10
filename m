From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/4] clk: bcm2835: Add support for programming the audio domain clocks.
Date: Thu, 10 Sep 2015 14:35:10 -0700
Message-ID: <87vbbigdpt.fsf@eliezer.anholt.net>
References: <1441562263-19888-1-git-send-email-eric@anholt.net> <1441562263-19888-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1441562263-19888-4-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> This adds support for enabling, disabling, and setting the rate of the
> audio domain clocks.  It will be necessary for setting the pixel clock
> for HDMI in the VC4 driver and let us write a cpufreq driver.  It will
> also improve compatibility with user changes to the firmware's
> config.txt, since our previous fixed clocks are unaware of it.
>
> The firmware also has support for configuring the clocks through the
> mailbox channel, but the pixel clock setup by the firmware doesn't
> work, and it's Raspberry Pi specific anyway.  The only conflicts we
> should have with the firmware would be if we made firmware calls that
> result in clock management (like opening firmware V3D or ISP access,
> which we don't support in upstream), or on hardware over-thermal or
> under-voltage (when the firmware would rewrite PLLB to take the ARM
> out of overclock).  If that happens, our cached .recalc_rate() results
> would be incorrect, but that's no worse than our current state where
> we used fixed clocks.
>
> The existing fixed clocks in the code are left in place to provide
> backwards compatibility with old device tree files.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

> +	onecell->clk_num = BCM2835_CLOCK_COUNT;
> +	onecell->clks = kzalloc(sizeof(*onecell->clks), GFP_KERNEL);

Review of another clock driver I wrote pointed out that I missed the
multiply by BCM2835_CLOCK_COUNT here.  I'll send an updated version.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV8feOAAoJELXWKTbR/J7oRCwQAJtPQDzHzQVmm4FJrrM62AzB
ADW9jborHJ79UIFkv5Clhvs4jVF4HJE9wJgoJ+dU5vnNcCRNzyLkG3qs4o83d+9p
wrjbwRGI6MmMJ1rwiSP2D3jIkqBumHaCooNbVVVAP1RMPBvwkRkeU9oClZZmdYvm
JSwt9jMjZMLa0iOeDVBGWe1iDY19zIUEOWm8UpWMSbYgj4SJ3+RqXpu/RtM1tHF+
coWZ0CRv51b8UPN/XbvI3fxssRkgj769xIddm5AoyVT6cdY96IKXPTcux0n/frLD
7VFM5K8Tp1iHbJPCTsaZXkjSw3ErqAMxgjhDD5BT6FvpuSYVU7zitWhraI6iU21r
oV3NiougCXfFncwZoNi+aOouC+ef3HDMwaWxI+f53rLpW2Rjq+aGUdPTAbyILleM
ai5G/PmLRQr515FJDVCOWQSu09kZPoxThqYwnw2DYzEvPJ2f5gnuFwccVz4UP+ra
YOlB4GRgVgcijj/yazo7AzOZ8qBVvurpUTy35WMeg3AQoJ/89AJAEg0hh+FzEurb
PvletKc0yGiBYumbypiRvBho38Q26VKIqbUkRzDGcqIpDPV+7bMrKW15+b8A7xqa
bqMbZIy/SKMlsoYXNmsBF48NE5yKEKyhRT6woOE+FAQ/m5XxpzVOjr5Oae61Yw6f
w2NZZ76Z8OmTiU5C4D8B
=FPEY
-----END PGP SIGNATURE-----
--=-=-=--
