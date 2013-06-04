From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 3/3] clocksource: dw_apb_timer_of: use clocksource_of_init
Date: Tue, 4 Jun 2013 07:36:20 +0300
Message-ID: <20130604043620.GU11798@tarshish>
References: <201306032157.40488.heiko@sntech.de>
 <201306032159.55685.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201306032159.55685.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Jamie Iles <jamie@jamieiles.com>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, John Stultz <john.stultz@linaro.org>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Mon, Jun 03, 2013 at 09:59:55PM +0200, Heiko St=FCbner wrote:
> dw_apb_timer_init used to search the devicetree for matching timer
> devices, making calls to it from board files necessary.
>=20
> Change the dw_apb_timer_init to work with CLOCKSOURCE_OF_DECLARE.
> With this change the function gets called once for each timer node
> and tracks these number of calls to attach clockevent and clocksource
> devices to the nodes.
>=20
> Also remove the calls to dw_apb_timer_init from all previous users, a=
s
> clocksource_of_init is the default for init_time now.
>=20
> Tested on the upcoming rk3066 code.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Rob Herring <rob.herring@calxeda.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-picoxcell/Kconfig       |    1 +
>  arch/arm/mach-picoxcell/common.c      |    2 -
>  arch/arm/mach-socfpga/Kconfig         |    1 +
>  arch/arm/mach-socfpga/socfpga.c       |    2 -
>  drivers/clocksource/dw_apb_timer_of.c |   41 ++++++++++++++++-------=
----------
>  include/linux/dw_apb_timer.h          |    1 -
>  6 files changed, 22 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/arm/mach-picoxcell/Kconfig b/arch/arm/mach-picoxcel=
l/Kconfig
> index 13bae78..3ef6bbe 100644
> --- a/arch/arm/mach-picoxcell/Kconfig
> +++ b/arch/arm/mach-picoxcell/Kconfig
> @@ -6,6 +6,7 @@ config ARCH_PICOXCELL
>  	select CPU_V6K
>  	select DW_APB_TIMER
>  	select DW_APB_TIMER_OF
> +	select CLKSRC_OF

Shouldn't DW_APB_TIMER 'select CLKSRC_OF if OF' instead of selecting is=
 for=20
each and every platform? While at it we can do the same to DW_APB_TIMER=
_OF.

baruch


--=20
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Sy=
stems
=3D}------------------------------------------------ooO--U--Ooo--------=
----{=3D
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
