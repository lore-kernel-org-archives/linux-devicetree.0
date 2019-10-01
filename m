From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Rename roc-pc with libretech notation
Date: Tue, 1 Oct 2019 16:03:54 +0530
Message-ID: <CAMty3ZBZ0kXsc-4EwUwy9rAHcDvhhYL1JWkyhhdvSvfRdyvvwA@mail.gmail.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-5-jagan@amarulasolutions.com> <4177305.6QI6aNXrAv@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4177305.6QI6aNXrAv@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Da Xue <da@lessconfused.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2019 at 3:02 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Jagan,
>
> Am Donnerstag, 19. September 2019, 07:28:20 CEST schrieb Jagan Teki:
> > Though the ROC-PC is manufactured by firefly, it is co-designed
> > by libretch like other Libretech computer boards from allwinner,
> > amlogic does.
> >
> > So, it is always meaningful to keep maintain those vendors who
> > are part of design participation so-that the linux mainline
> > code will expose outside world who are the makers of such
> > hardware prototypes.
> >
> > So, rename the existing rk3399-roc-pc.dts with libretch notation,
> > rk3399-libretech-roc-rk3399-pc.dts
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile                           | 2 +-
> >  .../{rk3399-roc-pc.dts => rk3399-libretech-roc-rk3399-pc.dts}   | 0
>
> Somewhat "randomly" renaming files for "exposure" of the maker isn't the
> way to go. Especially as the file name itself is merely a handle and not
> meant for fame. The board filename should mainly enable developers to
> hopefully the correct board file to use/change - and "rk3399-roc-pc"
> is sufficiently unique to do that.
>
> Similar to how the NanoPi boards do that.
>
> And renames not only loose the history of changes but also in this case
> the file is in the kernel since july 2018 - more than a year, so this might
> actually affect the workflow of someone.

Yes, I agreed this point.

>
> So I'd really expect an actual technical reason for a rename.

This changes purely based on the recent changes on naming conventions
that have been followed in amlogic and allwinner with regards to
libretech [1]. I have seen few Bananapi boards from Allwinner H3 has
been converted as per Libretech computer recently. I assume these
changes are because libretech has part of co-designed vendor and also
open source forum supported for these hardware.

For further information, may be Da Xue can comment on this.

[1] https://libre.computer/products/boards/
