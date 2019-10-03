From: Gerald BAEZA <gerald.baeza@st.com>
Subject: RE: [PATCH v3 0/5] stm32-ddr-pmu driver creation
Date: Thu, 3 Oct 2019 10:08:06 +0000
Message-ID: <013321ff60ae44da892d806fbd3024d4@SFHDAG5NODE1.st.com>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Dear all

Gentle reminder for this review.

Thanks in advance !

G=E9rald

> From: Gerald BAEZA <gerald.baeza@st.com>
> =

> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1
> SOC.
> =

> This series adds support for the DDRPERFM via a new stm32-ddr-pmu driver,
> registered into the perf framework.
> =

> This driver is inspired from arch/arm/mm/cache-l2x0-pmu.c
> =

> ---
> Changes from v1:
> - add 'resets' description (bindings) and using (driver). Thanks Rob.
> - rebase on 5.2-rc1 (that includes the ddrperfm clock control patch).
> =

> Changes from v2:
> - rebase on 5.3-rc6 that has to be completed with
>   'perf tools: fix alignment trap in perf stat': mandatory.
>   'Documentation: add link to stm32mp157 docs': referenced from this seri=
es.
> - take into account all remarks from Mark Rutland: thanks for your time!
>   https://lkml.org/lkml/2019/6/26/388
> - fix for event type filtering in stm32_ddr_pmu_event_init()
> =

> Gerald Baeza (5):
>   Documentation: perf: stm32: ddrperfm support
>   dt-bindings: perf: stm32: ddrperfm support
>   perf: stm32: ddrperfm driver creation
>   ARM: configs: enable STM32_DDR_PMU
>   ARM: dts: stm32: add ddrperfm on stm32mp157c
> =

>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt     |  16 +
>  Documentation/perf/stm32-ddr-pmu.txt               |  37 ++
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |   8 +
>  arch/arm/configs/multi_v7_defconfig                |   1 +
>  drivers/perf/Kconfig                               |   6 +
>  drivers/perf/Makefile                              |   1 +
>  drivers/perf/stm32_ddr_pmu.c                       | 426 +++++++++++++++=
++++++
>  7 files changed, 495 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-
> pmu.txt
>  create mode 100644 Documentation/perf/stm32-ddr-pmu.txt
>  create mode 100644 drivers/perf/stm32_ddr_pmu.c
> =

> --
> 2.7.4
