From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V4 0/7] clk: bcm2835: add clocks and add MASH support
Date: Sat, 16 Jan 2016 10:40:34 +0100
Message-ID: <F080092E-555E-4196-963F-A96C42CAA150@martin.sperl.org>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> On 15.01.2016, at 15:20, kernel@martin.sperl.org wrote:
>=20
> From: Martin Sperl <kernel@martin.sperl.org>
>=20
> The clk-bcm2835 driver right now relies on BCM2835_CLOCK_COUNT define=
d
> in include/dt-binding/clocks/bcm2835.h
> With every new clock introduced this value needs to increase,
> which is not what should happen for bindings.
>=20
> So we reorganize the driver so that it is no longer necessary
> to define BCM2835_CLOCK_COUNT.
>=20
> Also the driver calculates fractional clock dividers correctly,
> but it does not enable the bit to enable support in the register.
> As a minimal extension we now can also define higher order MASH
> support when defining the clocks.
>=20
> There is also an issue when the clock divider is < 2 - in that
> case no clock-output is generate. The clamping code has been
> enhanced to handle this as well.
>=20
> Similarly there is also the clamping of the highest divider now
> limited to the highest possible integer divider instead of the
> highest possible fractional diviver.
>=20
> Finally we add all the 23 different HW clocks that have not been
> configured in the driver.
>=20
> Changelog:
> 	V1 -> V2: split the asoc/sound patches from the clock patches
> 	      	  enable frac/mash support
> 	V2 -> V3: clamp clock divider to be >=3D 2
> 		  clamp max clock divider to be integer (not fractional)
> 		  added additional limit checks for divider selection
> 		    allowing fallback to lower mash levels.
> 		  use a newer probing mechanism based on a single array
> 	V3 -> V4: fixed bad NULL pointer check in init
> 	      	  fixed (mash) limit checks
> 		  separated basic mash support from limits checks
> 		  really tested with I2S device (unfortunately V3 was
> 		  not well tested in this respect)
>=20
> Martin Sperl (7):
>  clk: bcm2835: the minimum clock divider is 2
>  clk: bcm2835: clamp clock divider to highest integer only
>  clk: bcm2835: remove use of BCM2835_CLOCK_COUNT in driver
>  clk: bcm2835: enable management of PCM clock
Please note that Mark Brown has already merged the patch to
bcm2835-i2s that makes use of the PCM-clock added with this patch.

>  clk: bcm2835: add missing 22 HW-clocks.
>  clk: bcm2835: enable fractional and mash support
>  clk: bcm2835: apply limits on dividers to MASH mode.
>=20
> drivers/clk/bcm/clk-bcm2835.c       |  583 ++++++++++++++++++++++++++=
++++-----
> include/dt-bindings/clock/bcm2835.h |   25 +-
> 2 files changed, 521 insertions(+), 87 deletions(-)
>=20
> --
> 1.7.10.4
>=20

There is still some discussion around the best clock selection
method (especially low jitter for PCM and possibly PWM), but as I guess
not all =E2=80=9Cuse-cases=E2=80=9D for clocks are identical it would r=
equire some
parametrization.

As such parameters typically would go into device-tree here a
proposal for how we could implement the device-tree options:

	clocks: cprman@7e101000 {
		compatible =3D "brcm,bcm2835-cprman";
		#clock-cells =3D <1>;
		reg =3D <0x7e101000 0x2000>;

		/* CPRMAN derives everything from the platform's
		 * oscillator.
		 */
		clocks =3D <&clk_osc>;

		/* non default override for some clocks */
		clock@BCM2835_CLOCK_PCM {
			reg =3D <BCM2835_CLOCK_PCM>;

			/* all of the below properties are optional */

			/* only use the following as parents - but must
			 * be a member of all the permissible plls for this
			 * clock.
			 * note that PLLC is used for overclocking
			 * the ARM by downstream kernels, so it should not
			 * get used for PCM.
			 */
			parent-clock-names =3D =E2=80=9Cxosc=E2=80=9D,
					     =E2=80=9Cplla_per=E2=80=9D,
					     =E2=80=9Cplld_per=E2=80=9D,
					     =E2=80=9Cpllh_aux=E2=80=9D;
			/* alternate clock/divider selector */
			bcrm,clock-selector =3D <BCM2835_CLOCK_SELECTOR_LOWJITTER>;
			/* minimum divider used for fractional support */
			bcrm,min-div-f =3D <20>;
			/* alternatively defined explicitly as jitter */
			max-jitter-ns =3D <500>;
			/* mash_support defining the max MASH order */
			bcrm,max-mash-order =3D <BCM2835_MASH_ORDER_3>;
			/* possibly other parameters needed by the chosen
			 * clock selector.
			 */
		};
	};

Would something like this be acceptable?

I would then create a separate patchset based on this patchset to
introduce those features when I get back.

Thanks,
	Martin