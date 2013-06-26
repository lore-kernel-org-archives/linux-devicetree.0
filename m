From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Wed, 26 Jun 2013 15:24:23 +0200
Message-ID: <51CAEB87.2070209@linaro.org>
References: <1372247318-28869-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1372247318-28869-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stuart Menefy <stuart.menefy@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On 06/26/2013 01:48 PM, Srinivas KANDAGATLA wrote:
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
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Rob Herring <robherring2@gmail.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Will Deacon <will.deacon@arm.com>
> CC: Thomas Gleixner <tglx@linutronix.de>
> ---
> Thankyou for reveiwing the v6 patch.
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
> And most of the patches are in next branches.
>=20
> If its not too late can this patch be considered for 3.11 via clockso=
urce tree?
> This patch has no build dependencies.

I took it in my tree but it is too late for a 3.11, sorry.

Thanks
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

