From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 04/12] driver: clk: imx: Add clock driver for imx6sll
Date: Tue, 3 Jan 2017 11:49:09 -0600
Message-ID: <20170103174909.3a5qtds4fpmgzhxs@rob-hp-laptop>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-5-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482832070-22668-5-git-send-email-ping.bai-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jacky.baip-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 05:47:42PM +0800, Bai Ping wrote:
> Add clk driver support for imx6sll.
> 
> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/clk/imx/Makefile                  |   1 +
>  drivers/clk/imx/clk-imx6sll.c             | 369 ++++++++++++++++++++++++++++++

>  include/dt-bindings/clock/imx6sll-clock.h | 204 +++++++++++++++++

This should be part of the binding doc patch.

>  3 files changed, 574 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-imx6sll.c
>  create mode 100644 include/dt-bindings/clock/imx6sll-clock.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
