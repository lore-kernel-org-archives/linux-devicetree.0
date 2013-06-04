From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH v2 0/4] dw_apb_timer: osc as sched_clock, clocks and
 clocksource_of support
Date: Tue, 4 Jun 2013 10:28:50 -0500
Message-ID: <1370359730.16167.4.camel@linux-builds1>
References: <201306041136.09566.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306041136.09566.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Tue, 2013-06-04 at 11:36 +0200, Heiko St=C3=BCbner wrote:
> This is split off of my Rockchip support series from yesterday. It's =
now
> a patch more than before, as the third patch enables the timer to be =
used
> thru clocksource_of_init and moves picoxcell and socfpga to it.
>=20
> changes since v1:
> - hopefully improve the patch description of patch 1
>   after a suggestion by Linus Walleij
> - move the selection of DW_APB_TIMER and CLKSRC_OF into DW_APB_TIMER_=
OF
>   after a suggestion by Baruch Siach
>=20
> Heiko Stuebner (4):
>   clocksource: dw_apb_timer_of: enable the use the clocksource as sch=
ed clock
>   clocksource: dw_apb_timer_of: add clock-handling
>   clocksource: dw_apb_timer_of: select DW_APB_TIMER
>   clocksource: dw_apb_timer_of: use clocksource_of_init
>=20
>  Documentation/devicetree/bindings/rtc/dw-apb.txt |   19 +++++
>  arch/arm/mach-picoxcell/Kconfig                  |    1 -
>  arch/arm/mach-picoxcell/common.c                 |    2 -
>  arch/arm/mach-socfpga/Kconfig                    |    1 -
>  arch/arm/mach-socfpga/socfpga.c                  |    2 -
>  drivers/clocksource/Kconfig                      |    2 +
>  drivers/clocksource/dw_apb_timer_of.c            |   95 ++++++++++++=
++-------
>  include/linux/dw_apb_timer.h                     |    1 -
>  8 files changed, 84 insertions(+), 39 deletions(-)
>=20

=46or all the mach-socfpga parts:

Acked-by: Dinh Nguyen <dinguyen@altera.com>

Thanks,
Dinh
