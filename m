From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 00/10] ARM: STi: Add Clock driver support STiH415 &
 STiH416
Date: Thu, 15 May 2014 16:01:42 +0200
Message-ID: <5374C8C6.8060202@st.com>
References: <1400073858-28912-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400073858-28912-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gabi,

	For the series:

	Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>

	It will be part of DT pull request I'm preparing for v3.16.

Thanks,
Maxime

On 05/14/2014 03:24 PM, Gabriel FERNANDEZ wrote:
> Changes in v2:
>   - move stih415-clks.h & stih416-clks.h to include/dt-bindings/clock/
>   - add clk_ignore_unused to bootargs. Interconnect clocks are not yet
>     managed at the init, then we have to start the kernel with
>     clk_ignore_unused.
>
> The goal of this series is to add DT definition for STiH415
> and STiH416 SoCs on B2000 and B2020 boards.
>
> Gabriel Fernandez (10):
>    ARM: STi: DT: STiH416: 416 DT Entry for clockgen A0/1/10/11/12
>    ARM: STi: DT: STiH416: Remove unused CLK_S_ICN_REG_0 fixed clock
>    ARM: STi: DT: STiH416: Remove unused CLK_S_GMAC0_PHY & CLK_S_ETH1_PHY
>      fixed clocks
>    ARM: STi: DT: STiH416: 416 DT Entry for clockgen B/C/D/E/F
>    ARM: STi: DT: STiH416: 416 DT Entry for clockgen A9/DDR/GPU
>    ARM: STi: DT: STiH415: 415 DT Entry for clockgen A0/1/10/11/12
>    ARM: STi: DT: STiH415: Remove unused CLK_S_ICN_REG_0 fixed clock
>    ARM: STi: DT: STiH415: Remove unused CLK_S_GMAC0_PHY & CLK_S_ETH1_PHY
>      fixed clocks
>    ARM: STi: DT: STiH415: 415 DT Entry for clockgen A9
>    ARM: STi: DT: STiH41x Add clk_ignore_unused to bootargs
>
>   arch/arm/boot/dts/stih415-clock.dtsi     | 517 +++++++++++++++++++++-
>   arch/arm/boot/dts/stih415.dtsi           |  10 +-
>   arch/arm/boot/dts/stih416-clock.dtsi     | 732 ++++++++++++++++++++++++++++++-
>   arch/arm/boot/dts/stih416.dtsi           |  10 +-
>   arch/arm/boot/dts/stih41x-b2000.dtsi     |   2 +-
>   arch/arm/boot/dts/stih41x-b2020.dtsi     |   2 +-
>   include/dt-bindings/clock/stih415-clks.h |  15 +
>   include/dt-bindings/clock/stih416-clks.h |  15 +
>   8 files changed, 1258 insertions(+), 45 deletions(-)
>   create mode 100644 include/dt-bindings/clock/stih415-clks.h
>   create mode 100644 include/dt-bindings/clock/stih416-clks.h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
