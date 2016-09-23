From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Date: Fri, 23 Sep 2016 12:47:04 -0500
Message-ID: <20160923174704.GA32729@rob-hp-laptop>
References: <1474183821-7570-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474183821-7570-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, scott.bambrough-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.gregotski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2016 at 03:30:21PM +0800, Jiancheng Xue wrote:
> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
> Generator) module generates clock and reset signals used
> by other module blocks on SoC.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
> change log
> v2:
> - Fixed compiling error when compiled as a module.
> - Fixed issues pointed by Stephen Boyd.
> - Added prefix HISTB for clock index macro definitions.
> 
>  .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  11 +-
>  drivers/clk/hisilicon/Kconfig                      |   8 +
>  drivers/clk/hisilicon/Makefile                     |   1 +
>  drivers/clk/hisilicon/crg-hi3798cv200.c            | 305 +++++++++++++++++++++
>  drivers/clk/hisilicon/crg.h                        |  34 +++
>  include/dt-bindings/clock/histb-clock.h            |  64 +++++
>  6 files changed, 419 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (82%)
>  create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
>  create mode 100644 drivers/clk/hisilicon/crg.h
>  create mode 100644 include/dt-bindings/clock/histb-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> similarity index 82%
> rename from Documentation/devicetree/bindings/clock/hi3519-crg.txt
> rename to Documentation/devicetree/bindings/clock/hisi-crg.txt
> index acd1f23..e3919b6 100644
> --- a/Documentation/devicetree/bindings/clock/hi3519-crg.txt
> +++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> @@ -1,7 +1,7 @@
> -* Hisilicon Hi3519 Clock and Reset Generator(CRG)
> +* HiSilicon Clock and Reset Generator(CRG)
>  
> -The Hi3519 CRG module provides clock and reset signals to various
> -controllers within the SoC.
> +The CRG module provides clock and reset signals to various
> +modules within the SoC.
>  
>  This binding uses the following bindings:
>      Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -10,7 +10,10 @@ This binding uses the following bindings:
>  Required Properties:
>  
>  - compatible: should be one of the following.
> -  - "hisilicon,hi3519-crg" - controller compatible with Hi3519 SoC.
> +  - "hisilicon,hi3516cv300-crg"
> +  - "hisilicon,hi3519-crg"
> +  - "hisilicon,hi3798cv200-crg"
> +  - "hisilicon,hi3798cv200-sysctrl"

Why crg and sysctrl?

>  
>  - reg: physical base address of the controller and length of memory mapped
>    region.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
