From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] clk: meson-axg: add clock controller drivers
Date: Tue, 28 Nov 2017 10:30:22 -0600
Message-ID: <20171128163022.7b7wvfqedkhhnaj6@rob-hp-laptop>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171128125330.363-3-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 08:53:29PM +0800, Yixun Lan wrote:
> From: Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> 
> Add clock controller drivers for Amlogic Meson-AXG SoC.
> 
> Signed-off-by: Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/Kconfig.platforms         |   1 +
>  drivers/clk/meson/Kconfig            |   8 +
>  drivers/clk/meson/Makefile           |   1 +
>  drivers/clk/meson/axg.c              | 948 +++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/axg.h              | 126 +++++

>  include/dt-bindings/clock/axg-clkc.h |  72 +++

This belongs in the binding patch.

Otherwise, 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


>  6 files changed, 1156 insertions(+)
>  create mode 100644 drivers/clk/meson/axg.c
>  create mode 100644 drivers/clk/meson/axg.h
>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
