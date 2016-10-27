From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200
 SoC
Date: Thu, 27 Oct 2016 08:48:33 -0500
Message-ID: <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
References: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477013830-11481-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bin.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 09:37:10AM +0800, Jiancheng Xue wrote:
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

What Stephen asked for is send this and the Hi3516CV300 series as one 
series since there is a dependency.

> 
>  .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  11 +-

In any case, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
