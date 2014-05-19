From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCHv3 0/3] clocksource: Add Freescale FlexTimer Module (FTM)
 timer support
Date: Mon, 19 May 2014 11:14:04 +0200
Message-ID: <5379CB5C.1070202@linaro.org>
References: <1398737939-5334-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398737939-5334-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>, tglx@linutronix.de, shawn.guo@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/29/2014 04:18 AM, Xiubo Li wrote:
>
> Changes in V3:
> - Fix the ftm_irq_disable.
>
> Changes in V2:
> - Add big-endian support.
> - Add using pr_err instead of BUG_ON.
> - Add more detail comment message of FTM.
> - Add DT binding documentation.
> - Remove some header files and macros not useful.
>
>
> Xiubo Li (3):
>    clocksource: ftm: Add FlexTimer Module (FTM) Timer devicetree
>      Documentation
>    ARM: dts: vf610: Add Freescale FlexTimer Module timer node.
>    clocksource: Add Freescale FlexTimer Module (FTM) timer support
>
>   .../devicetree/bindings/timer/fsl,ftm-timer.txt    |  31 ++
>   arch/arm/boot/dts/vf610.dtsi                       |  12 +
>   drivers/clocksource/Kconfig                        |   5 +
>   drivers/clocksource/Makefile                       |   1 +
>   drivers/clocksource/fsl_ftm_timer.c                | 344 ++++++++++=
+++++++++++
>   5 files changed, 393 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/timer/fsl,ftm-=
timer.txt
>   create mode 100644 drivers/clocksource/fsl_ftm_timer.c

By the way, when reposting the serie, could you please add Rob Herring=20
and Grant likely as Cc to review the dts part ?

Thanks
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

