From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH 0/3] clocksource: Add Freescale FlexTimer Module (FTM)
 timer support
Date: Mon, 21 Apr 2014 08:09:40 +0000
Message-ID: <2b156cf0fffb42df84c0035535bc6672@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1398064800-27250-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398064800-27250-1-git-send-email-Li.Xiubo@freescale.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "Jason.Jin@freescale.com" <Jason.Jin@freescale.com>, "Dongsheng.Wang@freescale.com" <Dongsheng.Wang@freescale.com>, Jingchang Lu <jingchang.lu@freescale.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

@All,

Please ignore this patch series, I just forgot the V2 tag, I have resent a 
New one.

Thanks,
BRs
Xiubo



> -----Original Message-----
> From: Xiubo Li [mailto:Li.Xiubo@freescale.com]
> Sent: Monday, April 21, 2014 3:20 PM
> To: daniel.lezcano@linaro.org; tglx@linutronix.de; shawn.guo@linaro.org; Jin
> Zhengxiong-R64188; Wang Dongsheng-B40534; Lu Jingchang-B35083
> Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Xiubo Li-
> B47053
> Subject: [PATCH 0/3] clocksource: Add Freescale FlexTimer Module (FTM) timer
> support
> 
> 
> Changes in V2:
> - Add big-endian support.
> - Add using pr_err instead of BUG_ON.
> - Add more detail comment message of FTM.
> - Add DT binding documentation.
> - Remove some header files and macros not useful.
> 
> 
> 
> Xiubo Li (3):
>   clocksource: ftm: Add FlexTimer Module (FTM) Timer devicetree
>     Documentation
>   ARM: dts: vf610: Add Freescale FlexTimer Module timer node.
>   clocksource: Add Freescale FlexTimer Module (FTM) timer support
> 
>  .../devicetree/bindings/timer/fsl,ftm-timer.txt    |  31 ++
>  arch/arm/boot/dts/vf610.dtsi                       |  12 +
>  drivers/clocksource/Kconfig                        |   5 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/fsl_ftm_timer.c                | 344
> +++++++++++++++++++++
>  5 files changed, 393 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/fsl,ftm-timer.txt
>  create mode 100644 drivers/clocksource/fsl_ftm_timer.c
> 
> --
> 1.8.4

