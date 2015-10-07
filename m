From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4] clk: bcm2835: Add support for programming the audio domain clocks.
Date: Tue, 06 Oct 2015 18:24:44 -0700
Message-ID: <87bncbo4gz.fsf@eliezer.anholt.net>
References: <1443815696-11528-1-git-send-email-eric@anholt.net> <56143AC9.60506@lategoodbye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56143AC9.60506@lategoodbye.de>
Sender: linux-clk-owner@vger.kernel.org
To: Stefan Wahren <info@lategoodbye.de>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <info@lategoodbye.de> writes:

> Hi Eric,
>
> Am 02.10.2015 um 21:54 schrieb Eric Anholt:
>> This adds support for enabling, disabling, and setting the rate of the
>> audio domain clocks.  It will be necessary for setting the pixel clock
>> for HDMI in the VC4 driver and let us write a cpufreq driver.  It will
>> also improve compatibility with user changes to the firmware's
>> config.txt, since our previous fixed clocks are unaware of it.
>>
>> The firmware also has support for configuring the clocks through the
>> mailbox channel, but the pixel clock setup by the firmware doesn't
>> work, and it's Raspberry Pi specific anyway.  The only conflicts we
>> should have with the firmware would be if we made firmware calls that
>> result in clock management (like opening firmware V3D or ISP access,
>> which we don't support in upstream), or on hardware over-thermal or
>> under-voltage (when the firmware would rewrite PLLB to take the ARM
>> out of overclock).  If that happens, our cached .recalc_rate() results
>> would be incorrect, but that's no worse than our current state where
>> we used fixed clocks.
>>
>> The existing fixed clocks in the code are left in place to provide
>> backwards compatibility with old device tree files.
>
> only a few nits.

I think I've done all of these now, sending out v5.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWFHRcAAoJELXWKTbR/J7omdUQAJLhe4jma2B2Adg05rHi6OgF
aXfzBN8AK+rDKf2Cv14nmejuBZrg2oNu+DCaOfic0ewl8OtrB4QDAdbHqAlXisUH
W5dTqKxHN2K9Gxx8A3OJFKzoJCjfXmuD0W3eIdJQDZ7sDh7eOrhiPbWYjl33hg7A
yE7CnminSRbm1n/vwZgYvLmNNtue6j5zV0E+g6p8+lkjX4ggHPub0tgjJQBAnkGa
0FgqaNjsQuJyK/ghS1FUWDIRCWrCyx71cDe3dAnJRgbTEIIRojTEdv4xzBNf6PT/
76xxTOnf55RVi+ePxbR6gFgxyxHgkz5sQXHYDoKbiTdykiGpTDsuF3qrFqTlZ9xh
aaTiQrQrTtGx+/PSjuNWQhR1ua8HD794yKifQToi80l9XGwL9RZ5T107uwiKFUaf
7xbdMO10B/TDI99ZFDXeyZ+jeFR9UrOKR/0C2gCzlImLDlhz1uNVM2Qbn4pNruBA
OaWuNlbRXG7uD2D2VnPMXDarbSPqAKiCMJWv79DTkMoExzQCMyeFf8E6Mp7wA1mS
gSS88OPZkLfT2zHnlwbeoFAftVH7DZYjuM1TTkGn5GjcrOzSKHDxBnVcV1xFWeUD
FbP6I3fHeXIQi5syP4NRjyPMQWnFF/H5GISrgvzTqTJ2ZBu5f+Omw9CSYIeqjNia
+VKpmDG2ru08HZv4kbkr
=Dkgw
-----END PGP SIGNATURE-----
--=-=-=--
