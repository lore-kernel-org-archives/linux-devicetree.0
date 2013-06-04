From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] clocksource: dw_apb_timer_of: use clocksource_of_init
Date: Tue, 4 Jun 2013 09:57:27 +0200
Message-ID: <201306040957.27920.heiko@sntech.de>
References: <201306032157.40488.heiko@sntech.de>
 <201306032159.55685.heiko@sntech.de> <20130604043620.GU11798@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130604043620.GU11798@tarshish>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 4. Juni 2013, 06:36:20 schrieb Baruch Siach:
> Hi Heiko,
> =

> On Mon, Jun 03, 2013 at 09:59:55PM +0200, Heiko St=FCbner wrote:
> > dw_apb_timer_init used to search the devicetree for matching timer
> > devices, making calls to it from board files necessary.
> > =

> > Change the dw_apb_timer_init to work with CLOCKSOURCE_OF_DECLARE.
> > With this change the function gets called once for each timer node
> > and tracks these number of calls to attach clockevent and clocksource
> > devices to the nodes.
> > =

> > Also remove the calls to dw_apb_timer_init from all previous users, as
> > clocksource_of_init is the default for init_time now.
> > =

> > Tested on the upcoming rk3066 code.
> > =

> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> > =

> >  arch/arm/mach-picoxcell/Kconfig       |    1 +
> >  arch/arm/mach-picoxcell/common.c      |    2 -
> >  arch/arm/mach-socfpga/Kconfig         |    1 +
> >  arch/arm/mach-socfpga/socfpga.c       |    2 -
> >  drivers/clocksource/dw_apb_timer_of.c |   41
> >  ++++++++++++++++----------------- include/linux/dw_apb_timer.h         =

> >  |    1 -
> >  6 files changed, 22 insertions(+), 26 deletions(-)
> > =

> > diff --git a/arch/arm/mach-picoxcell/Kconfig
> > b/arch/arm/mach-picoxcell/Kconfig index 13bae78..3ef6bbe 100644
> > --- a/arch/arm/mach-picoxcell/Kconfig
> > +++ b/arch/arm/mach-picoxcell/Kconfig
> > @@ -6,6 +6,7 @@ config ARCH_PICOXCELL
> > =

> >  	select CPU_V6K
> >  	select DW_APB_TIMER
> >  	select DW_APB_TIMER_OF
> > =

> > +	select CLKSRC_OF
> =

> Shouldn't DW_APB_TIMER 'select CLKSRC_OF if OF' instead of selecting is f=
or
> each and every platform? While at it we can do the same to DW_APB_TIMER_O=
F.

if anything DW_APB_TIMER_OF should select both DW_APB_TIMER and 'CLKSRC_OF =
if =

OF', as the base DW_APB_TIMER_OF is the platform glue, that uses DW_APB_TIM=
ER =

internally.

But otherwise sounds sensible to not duplicate these selects everywhere.
