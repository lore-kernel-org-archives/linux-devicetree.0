From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v6] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Tue, 25 Jun 2013 14:14:43 -0700
Message-ID: <96d7573f-0991-4bda-8f4e-d1f36b743f95@VA3EHSMHS021.ehs.local>
References: <1372152678-29530-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1372152678-29530-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stuart Menefy <stuart.menefy@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

On Tue, Jun 25, 2013 at 10:31:18AM +0100, Srinivas KANDAGATLA wrote:
> From: Stuart Menefy <stuart.menefy@st.com>
>=20
> This is a simple driver for the global timer module found in the Cort=
ex
> A9-MP cores from revision r1p0 onwards. This should be able to perfor=
m
> the functions of the system timer and the local timer in an SMP syste=
m.
>=20
> The global timer has the following features:
>     The global timer is a 64-bit incrementing counter with an
> auto-incrementing feature. It continues incrementing after sending
> interrupts. The global timer is memory mapped in the private memory
> region.
>     The global timer is accessible to all Cortex-A9 processors in the
> cluster. Each Cortex-A9 processor has a private 64-bit comparator tha=
t
> is used to assert a private interrupt when the global timer has reach=
ed
> the comparator value. All the Cortex-A9 processors in a design use th=
e
> banked ID, ID27, for this interrupt. ID27 is sent to the Interrupt
> Controller as a Private Peripheral Interrupt. The global timer is
> clocked by PERIPHCLK.
>=20
> Signed-off-by: Stuart Menefy <stuart.menefy@st.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Rob Herring <robherring2@gmail.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Will Deacon <will.deacon@arm.com>
> ---
>=20
> Thankyou for reveiwing the v5 patch.
> This patch is split out of the orignal 10 patches submitted for Stixx=
xx SOC
> support to arm-kernel mailing list. This patch has undergone few cycl=
es of
> reviews in arm-kernel mailing list.
>=20
> This patch is generated on top of timers/core branch.
>=20
> Arnd already picked up SOC support patches [4-10] and merged them via=
 arm-soc
> tree for 3.11.
>=20
> If its not too late can this patch be considered for 3.11 via clockso=
urce tree?
> This patch has no build dependencies.
>=20
> Thanks,
> srini
>=20
> Changes since v5:
> 	- moved to using cpu notifiers as suggested by Stephen Boyd.
> 	- removed un-necessary headers as suggested by Stephen Boyd.
> 	- patch rebased on top of timers/core.
>=20
> Changes since v4:
> 	All the comments are from Thomas G.
> 	- disabled irq and comp enable bits while setting one-shot mode.
> 	- remove double pointer usage of clock_event_device structure.
> 	- remove spaces from device name.
> 	- remove few un-necessary comments.
> 	- Fix error checks and error case handling in global_timer_of_regist=
er
>=20
> Changes since v3:
> 	- Arnd suggested to replaced all __raw_readl/__raw_writel with
> 	readl/writel or readl_relaxed/writel_relaxed(for optimized path)
> 	as __raw* apis are not Endian safe.
>=20
> Changes since v2:
> 	- cleaned up arm-global-timer code for non-dt as suggested by Linus =
W and
> 	- fixed minmum clock tick setting pointed by Linus W.
>=20
> Changes since RFC:
> 	Most of the comments are suggested by Linus W.
> 	- moved to drivers/clocksource.
> 	- added revision check in driver.
> 	- removed unused header file.
> 	- moved to u64 from union gt_counter
> 	- comments added in get_counter
> 	- removed leftover debug code.
> 	- moved code to use __raw_readl/writel.
> 	- used DIV_ROUND_CLOSEST
> 	- added check in interrupt handler.
> 	- expanded CE and CS acronyms usage.
> 	- Fixed minimum clock ticks value.
> 	- move to use clocksource_register_hz
> 	- added arch sched_clock support.
> 	- added ERRATA 740657 workaround.
>=20
>  .../devicetree/bindings/arm/global_timer.txt       |   21 ++
>  drivers/clocksource/Kconfig                        |   13 +
>  drivers/clocksource/Makefile                       |    1 +
>  drivers/clocksource/arm_global_timer.c             |  325 ++++++++++=
++++++++++
>  4 files changed, 360 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/global_time=
r.txt
>  create mode 100644 drivers/clocksource/arm_global_timer.c
>=20
> diff --git a/Documentation/devicetree/bindings/arm/global_timer.txt b=
/Documentation/devicetree/bindings/arm/global_timer.txt
> new file mode 100644
> index 0000000..b64abac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/global_timer.txt
> @@ -0,0 +1,21 @@
> +
> +* ARM Global Timer
> +	Cortex-A9 are often associated with a per-core Global timer.
> +
> +** Timer node required properties:
> +
> +- compatible : Should be "arm,cortex-a9-global-timer"
> +		Driver supports versions r2p0 and above.
> +
> +- interrupts : One interrupt to each core
> +
> +- reg : Specify the base address and the size of the GT timer
> +	register window.
> +
> +Example:
> +
> +	timer@2c000600 {
> +		compatible =3D "arm,cortex-a9-global-timer";
> +		reg =3D <0x2c000600 0x20>;
> +		interrupts =3D <1 13 0xf01>;
> +	};
Isn't a 'clocks' entry missing here?

	S=C3=B6ren


