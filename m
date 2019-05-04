From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCHv2 1/2] ARM: dts: imx6sx: Use MX6SX_CLK_ENET for fec 'ahb' clock
Date: Sat, 4 May 2019 08:03:55 -0300
Message-ID: <CAOMZO5BbA6oq8okTR-r800k4XY76XxxEdufd1mjcV6HdTpVotA@mail.gmail.com>
References: <1556190530-19541-1-git-send-email-liuk@cetca.net.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556190530-19541-1-git-send-email-liuk@cetca.net.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Kay-Liu <liuk@cetca.net.cn>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kay-Liu,

On Thu, Apr 25, 2019 at 8:09 AM <liuk@cetca.net.cn> wrote:
>
> From: Kay-Liu <liuk@cetca.net.cn>
>
> The imx6sx's dts file defines five clocks for fec, the
> 'ahb'clock's value is IMX6SX_CLK_ENET_AHB, but in the
> i.MX6SX Reference Manual there is no such enet ahb clock,
> there is only one "enet clock" in the CCM_CCGR3 register
> which is controlled by bits 5-4, the enet clock is defined
> for the 'ipg' clock, this can cause problem.
> The original phenomenon is using imx6-solox processor and
> Marvel 88E6390 switch with linux OS, the kernel will hang
> during the startup of the linux OS.
> After analyzing the phenomenon, the reason of CPU hang is
> read/write enet module's register when the enet clock
> is disabled. The kernel code try to avoids the problem
> by resume enet clock before read/write enet register.
> But the enet module's clock config will cause a special
> environment which can bypass the clock resume mechanism.
> The CPU has only one enet clock, after kernel parses
> the dts file, the two clock variables 'ipg' and 'ahb'
> finnaly point to the same enet clock register. This will
> cause enet clock be disabled after fec probe over.
> Because the power saving module will affect the BUG, so
> there are two situations for this problem:
> 1)Turn off power saving
> Turn off power saving means that the resume mechanism is
> disabled, so after fec probe over if any one read/write
> enet module's register, the CPU will hang because no one
> could resume the enet clock.
> 2)Turn on power saving
> Turn on power saving could resume enet clock before
> read/write enet register by enable 'ipg' clk, this will
> cause 'ahb' variable state and enet clock register value
> don't match.If any task read/write enet at a high
> frequently, the kernel will keep resume state and never
> enter suspend process, this means that the kernel will
> only modifies the register value during the first resume.
> But the kernel init will check unused clock variable in
> the late initcall, the 'ahb' clock will be treated as
> unused, at this time, the enet clock will be disabled
> bypass the resume mechanism, then the next read/write
> enet module's register will cause the CPU hang.
> Proposed solution is delete the 'ahb' clock's definition
> in the clk-imx6sx.c, and modify fec device=E2=80=99s clocks in
> the dts file, point =E2=80=98ahb=E2=80=99 from IMX6SX_CLK_ENET_AHB to
> IMX6SX_CLK_ENET
>
> Signed-off-by: Kay-Liu <liuk@cetca.net.cn>
> ---
> Change since v1:
> -inproved commit log description
> -add platform related clock change instead of describe is in the external=
 URL
>
>  arch/arm/boot/dts/imx6sx.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dts=
i
> index 5b16e65..b8b23a6 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -919,7 +919,7 @@
>                                 interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVE=
L_HIGH>,
>                                              <GIC_SPI 119 IRQ_TYPE_LEVEL_=
HIGH>;
>                                 clocks =3D <&clks IMX6SX_CLK_ENET>,
> -                                        <&clks IMX6SX_CLK_ENET_AHB>,
> +                                        <&clks IMX6SX_CLK_ENET>,

Yes, there is really no IMX6SX_CLK_ENET_AHB as per the Refernce Manual
and it is the same we do on imx6qdl.dtsi:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
