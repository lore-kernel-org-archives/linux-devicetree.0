From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] arm64: dts: Fix various entry-method properties to
 reflect documentation
Date: Thu, 23 Aug 2018 15:46:47 -0500
Message-ID: <CADRPPNRpquUgwjft=vLNcxy223BLrS=toWii1XExPb7SghGr-A@mail.gmail.com>
References: <113f28acbc55f64762c9f0bcefe076a811f2ed82.1535014078.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <113f28acbc55f64762c9f0bcefe076a811f2ed82.1535014078.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: amit.kucheria@linaro.org
Cc: lkml <linux-kernel@vger.kernel.org>, lorenzo.pieralisi@arm.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, liviu.dudau@arm.com, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, matthias.bgg@gmail.com, orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, Michal Simek <michal.simek@xilinx.com>, Shawn Guo <shawnguo@kernel.org>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, andy.tang@nxp.com, Ran Wang <ran.wang_1@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Yao Yuan <yao.yuan@nxp.com>, sumit.garg@nxp.com, Marc Zyngier <marc.zyngier@arm.com>, madalin.bucur@nxp.com, Thomas Gleixner <tglx@linutronix.de>, open list:OPEN FIRMW
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 3:55 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be
> set to "psci".
>
> commit a13f18f59d26 ("Documentation: arm: Fix typo in the idle-states
> bindings examples") attempted to fix this earlier but clearly more is
> needed.
>
> Fix the cpu-capacity.txt documentation that uses the incorrect value so
> we don't get copy-paste errors like these. Clarify the language in
> idle-states.txt by removing the reference to the psci bindings that
> might be causing this confusion.
>
> Finally, fix devicetrees of various boards to reflect current
> documentation.
>
> [1] Documentation/devicetree/bindings/arm/idle-states.txt (see
> idle-states node)
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Acked-by: Li Yang <leoyang.li@nxp.com>

For fsl/nxp device trees:

>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi         | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi         | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi         | 2 +-

- Leo
