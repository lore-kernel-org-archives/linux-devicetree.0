From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] watchdog: ts4600: add driver for TS-4600 watchdog
Date: Mon, 8 May 2017 08:27:25 -0500
Message-ID: <20170508132725.c3fnbz2lwz3khs7u@rob-hp-laptop>
References: <20170505193259.16517-1-sebastien.bourdelin@savoirfairelinux.com>
 <20170505193259.16517-7-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170505193259.16517-7-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 05, 2017 at 03:32:59PM -0400, Sebastien Bourdelin wrote:
> This watchdog is instantiated in a FPGA and can only be access using a
> GPIOs bit-banged bus, called the NBUS by Technologic Systems.
> The watchdog is made of only one register, called the feed register.
> Writing to this register will re-arm the watchdog for a given time (and
> enable it if it was disable). It can be disabled by writing a special
> value into it.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> ---
> Changes v2 -> v3:
>   - rebase on master
>   - remove the timeout table to simplify the logic (suggested by
>   Guenter Roeck)
>   - fix the set_timeout function (suggested by Guenter Roeck)
>   - hardcode the max_hw_heartbeat_ms value based on the ts4600 max
>   timeout value supported (suggested by Guenter Roeck)
>   - remove the max_timeout usage and set a default timeout value
> (suggested by Guenter Roeck)
>   - use the devm_watchdog_register_device function instead of
>   watchdog_register_device (suggested by Guenter Roeck)
> 
> Changes v1 -> v2:
>   - rebase on master
>   - retrieve the ts_nbus instantiated by the parent node (suggested by
>   Linus Walleij)
>   - rename the wdt by watchdog in the device tree and in the
>   documentation (suggested by Rob Herring)
>   - add a dependency to the TS_NBUS driver in the Kconfig (suggested by
>   Guenter Roeck)
>   - simplify the set_timeout function (suggested by Guenter Roeck)
>   - use the max_hw_heartbeat_ms callback instead of the max_timeout
>   callback (suggested by Guenter Roeck)
> ---
>  .../devicetree/bindings/watchdog/ts4600-wdt.txt    |  16 ++
>  arch/arm/boot/dts/imx28-ts4600-common.dtsi         |   5 +

Please add acks when posting new versions. I acked v2.

>  drivers/watchdog/Kconfig                           |  11 ++
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/ts4600_wdt.c                      | 185 +++++++++++++++++++++
>  5 files changed, 218 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ts4600-wdt.txt
>  create mode 100644 drivers/watchdog/ts4600_wdt.c
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
