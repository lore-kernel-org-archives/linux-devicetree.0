From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/2] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 04 Mar 2016 11:39:06 -0800
Message-ID: <87mvqeowx1.fsf@eliezer.anholt.net>
References: <1457116769-8567-1-git-send-email-eric@anholt.net> <1457116769-8567-2-git-send-email-eric@anholt.net> <20160304184136.GB5033@leverpostej> <874mcm3wfs.fsf@eliezer.anholt.net> <20160304185923.GC5033@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160304185923.GC5033@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Mark Rutland <mark.rutland@arm.com> writes:

> On Fri, Mar 04, 2016 at 10:55:03AM -0800, Eric Anholt wrote:
>> Mark Rutland <mark.rutland@arm.com> writes:
>>=20
>> > On Fri, Mar 04, 2016 at 10:39:29AM -0800, Eric Anholt wrote:
>> >> For now this doesn't support the new hardware present on the Pi 3 (BT,
>> >> wifi, GPIO expander).  Since the GPIO expander isn't supported, we
>> >> also don't have the LEDs like the other board files do.
>> >>=20
>> >> Signed-off-by: Eric Anholt <eric@anholt.net>
>> >> ---
>> >>  arch/arm/boot/dts/Makefile            |  3 +-
>> >>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 22 ++++++++++++
>> >>  arch/arm/boot/dts/bcm2837.dtsi        | 68 +++++++++++++++++++++++++=
++++++++++
>> >>  3 files changed, 92 insertions(+), 1 deletion(-)
>> >>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> >>  create mode 100644 arch/arm/boot/dts/bcm2837.dtsi
>> >
>> >> +	timer {
>> >> +		compatible =3D "arm,armv7-timer";
>> >> +		interrupt-parent =3D <&local_intc>;
>> >> +		interrupts =3D <0>, // PHYS_SECURE_PPI
>> >> +			     <1>, // PHYS_NONSECURE_PPI
>> >> +			     <3>, // VIRT_PPI
>> >> +			     <2>; // HYP_PPI
>> >> +		always-on;
>> >> +	};
>> >
>> > Are the CPUs in an always-on power domain? Or is it jsut that the kern=
el
>> > doesn't perform power management of CPUs?
>> >
>> > The always-on proeprty is only intended for the former.
>>=20
>> The kernel doesn't get to do power management of CPUs.  We only have
>> control of power domains through the firmware, and the firmware's
>> keeping the CPU domain on.
>
> So there is no way that the CPUs could request for the firmare to place
> them in a state where the timer would lose context (but other events
> coukd wake them up), even if they don't do that today?

I don't see any mechanism in the RPi firmware for the ARM to request
suspend or anything like that.  Enabling something like that would
definitely require an updated DT, to enable a driver that talks to the
firmware to make requests like that.

(Note that this is the same timer setup we have in bcm2836.dtsi)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW2eRbAAoJELXWKTbR/J7omjoP/2BoRn6JLqCsY7urHCzn0DEK
Mve6j7/EXTm7KSRxDN4QXZccdK/qhjEBjxvDwJh0Yw1yMtGWbM/6kTo1bLVBzamF
P0bdDiFNa79fT3lpLtSMOGW6MQSIPGv34p3G4qseNUO26IYC1llwXPS7Kt5aBa4O
UYgCcMoO6HF8qcrf96ucT9b3jtGmcdfPZBK2yr5u9EvhoLWfniJILa19F98FZmI4
VfhH+a3CNnkvDCC19+rcfPs/nEkXKyFTER69OCfL5GYsbtBfaiGi3X/HiIx9i6Xk
K0CPg2G6N2hSoi9MrPOHLV8qB/qe1+3NXz5aA4wUSBRpi8Y7TyUUm4VYpGccty7y
bwUo3JgQMSuawsELk1/tPMsw6M7FNSDRDzTVRsLoBvxJKxRPSzcK+uY4rSX/l1rn
ihd2ozEY6GXAHt3zGZogOrlwy14f9WhEzw4+ci271CpL4Jl9LeCJlaMQIR5Cp5bl
HN/uSbrXwx7nCpMToSQFgTMfSM0qQhIylKzgF+xQln2Li1jMLhL4+KWpuRU6tPta
52B5WrNWC06fW59hlHQ3vKbWKUv9t6IzwtPHdVeOY7GOecEn5lyRZw9uOoL3BH1B
350WF62CZLLPc7USsJn+Kh5fDSe/pCXvVVOmoKFWe/pweYzJjLykuWqGcwreT8jC
ulIuaFFvlmhBkyhCM4OY
=yPVS
-----END PGP SIGNATURE-----
--=-=-=--
