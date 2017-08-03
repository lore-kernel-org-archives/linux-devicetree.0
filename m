From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/8] Add board support for TS-4600
Date: Thu, 3 Aug 2017 09:26:54 +0800
Message-ID: <20170803012652.GB31819@dragon>
References: <20170714203218.14409-1-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170714203218.14409-1-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 04:32:10PM -0400, Sebastien Bourdelin wrote:
> This patch serie adds support for the TS-4600 boards rev A and B. These
> boards, manufactured by Technologic Systems, are based on an i.MX28.
> 
> This serie include the support for the watchdog which could be enable
> at Linux boot time depending on the bootloader.
> 
> The watchdog and few peripherals are implemented in a FPGA, and can
> only be access using a custom GPIOs bit-banged bus which is called the
> NBUS by Technologic Systems.
> A driver for this bus is also included and used by the watchdog.
> 
> Sebastien Bourdelin (8):
>   of: documentation: add bindings documentation for TS-4600
>   ARM: dts: TS-4600: add basic device tree
>   dt-bindings: bus: Add documentation for the Technologic Systems NBUS
>   bus: add driver for the Technologic Systems NBUS
>   ARM: dts: TS-4600: add NBUS support
>   dt-bindings: watchdog: add documentation for TS4600 watchdog
>     controller
>   watchdog: TS-4600: add driver for TS-4600 watchdog controller
>   ARM: dts: TS-4600: add watchdog support

You are mixing changes on 3 subsystem in a single patch series.  It
makes the merge process unnecessarily hard.  I suggest you split the
series as following:

 - nbus dt-bindings and driver
 - watchdog dt-bindings and driver
 - ts-4600 board bindings and dts

You should get the first two into mainline through corresponding
subsystem tree, and then submit the last one to me.  In that case, NBUS
and watchdog dts changes do not have to be separate patches.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
