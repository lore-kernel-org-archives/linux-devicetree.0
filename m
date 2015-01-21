From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 00/13] mtd: st_spi_fsm: Align with ST's internal
 development
Date: Wed, 21 Jan 2015 12:49:30 +0000
Message-ID: <20150121124930.GA22024@x1>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <20150113051452.GR9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150113051452.GR9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jan 2015, Brian Norris wrote:
> On Mon, Dec 15, 2014 at 11:59:07AM +0000, Lee Jones wrote:
> > Hi Brian, all,
> > =20
> >  [x] Bulid test
> >  [x] Bisectable
> >  [x] Smatch
> >  [x] Sparse
>=20
> Picked patches 1, 2, and 5 to l2-mtd.git. I requested changes to patc=
h 3
> and possibly 4. The rest look OK, but I don't want to futz with patch
> conflicts on the remaining. Please rebase to l2-mtd.git if/when you
> resend.

Sure.  I'll get on to that now.

> > v3:
> >   Further aligned with upstream changes as suggested by Peter Griff=
in.
> >   The clk_ignore_unused kernel command line parameter is due to be =
turned
> >   off on STiH4* platforms, so we no longer give the driver the chan=
ce to
> >   opt-out of fetching the EMI clock.  We also now provide syscfg of=
fsets
> >   inside the driver, as it's simpler and reduces the cost of having=
 lots
> >   of extra DT properties.
>=20
> Typically "simpler" and "reducing the cost of having lots of extra DT
> properties" aren't good enough reasons for immediately breaking an
> existing DT binding. We usually expect to support both for some perio=
d
> of time.

Only once a binding has became ABI.  As there are no users of this
driver yet (this will change after this sync'ing patch-set has been
applied), so we can safely consider this binding to be in-progress and
as such, not yet ABI, thus we can do this ol' switch-aroo without the
usual 6 month deprecation period.

> > v2:
> >   These are the last remaining patches in the set, all rebased and
> >   with the DT documentation requested after the last submission.
> > =20
> > v1:
> >   This patch-set updates ST's FSM SPI-NOR driver with all the inter=
nal
> >   goodness which has happened since the initial (now upstreamed) sn=
apshot
> >   was taken. It covers just over 6 months worth of internal develop=
ment
> >   and bug-fixes. A final whitespace clean-up is also appended to th=
e set
> >   - to make it look pretty and stuff. :)
> >=20
> > Angus Clark (3):
> >   mtd: st_spi_fsm: Add support for N25Q512 and N25Q00A devices
> >   mtd: st_spi_fsm: Update Spansion device entries
> >   mtd: st_spi_fsm: Improve busy wait handling
> >=20
> > Lee Jones (9):
> >   mtd: st_spi_fsm: Extend fsm_clear_fifo to handle unwanted bytes
> >   mtd: st_spi_fsm: Obtain and use EMI clock
> >   mtd: st_spi_fsm: dt-bindings: Deprecate generic compatible string
> >   mtd: st_spi_fsm: Fetch boot device locations from DT match tables
> >   mtd: st_spi_fsm: Fix [-Wsign-compare] build warning
> >   mtd: st_spi_fsm: Update the JEDEC probe to handle extended READID=
s
> >   mtd: st_spi_fsm: General tidy-up
> >   ARM: STi: stih416: Use new platform specific compatible string
> >   ARM: STi: stih416: Supply EMI clock reference to FSM SPI NOR
> >=20
> > Nunzio Raciti (1):
> >   mtd: st_spi_fsm: Add support for Micron N25Q512A
> >=20
> >  Documentation/devicetree/bindings/mtd/st-fsm.txt |  20 +-
> >  arch/arm/boot/dts/stih416.dtsi                   |   6 +-
> >  drivers/mtd/devices/st_spi_fsm.c                 | 747 +++++++++++=
++++--------
> >  include/dt-bindings/clock/stih416-clks.h         |   1 +
> >  4 files changed, 519 insertions(+), 255 deletions(-)
> >=20
>=20
> Brian

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
