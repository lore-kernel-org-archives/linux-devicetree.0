From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Rename roc-pc with libretech
 notation
Date: Tue, 1 Oct 2019 19:01:09 +0800
Message-ID: <CAGb2v67J_Dir72==ZxLmW-yeEsryWEJduVnHQiL96nn0vJEMcg@mail.gmail.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-5-jagan@amarulasolutions.com> <4177305.6QI6aNXrAv@phil>
 <CAMty3ZBZ0kXsc-4EwUwy9rAHcDvhhYL1JWkyhhdvSvfRdyvvwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMty3ZBZ0kXsc-4EwUwy9rAHcDvhhYL1JWkyhhdvSvfRdyvvwA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Levin Du <djw@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Akash Gajjar <akash@openedev.com>, Da Xue <da@lessconfused.com>, linux-amarula <linux-amarula@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 1, 2019 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Mon, Sep 30, 2019 at 3:02 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Hi Jagan,
> >
> > Am Donnerstag, 19. September 2019, 07:28:20 CEST schrieb Jagan Teki:
> > > Though the ROC-PC is manufactured by firefly, it is co-designed
> > > by libretch like other Libretech computer boards from allwinner,
> > > amlogic does.
> > >
> > > So, it is always meaningful to keep maintain those vendors who
> > > are part of design participation so-that the linux mainline
> > > code will expose outside world who are the makers of such
> > > hardware prototypes.
> > >
> > > So, rename the existing rk3399-roc-pc.dts with libretch notation,
> > > rk3399-libretech-roc-rk3399-pc.dts
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/Makefile                           | 2 +-
> > >  .../{rk3399-roc-pc.dts => rk3399-libretech-roc-rk3399-pc.dts}   | 0
> >
> > Somewhat "randomly" renaming files for "exposure" of the maker isn't the
> > way to go. Especially as the file name itself is merely a handle and not
> > meant for fame. The board filename should mainly enable developers to
> > hopefully the correct board file to use/change - and "rk3399-roc-pc"
> > is sufficiently unique to do that.
> >
> > Similar to how the NanoPi boards do that.
> >
> > And renames not only loose the history of changes but also in this case
> > the file is in the kernel since july 2018 - more than a year, so this might
> > actually affect the workflow of someone.
>
> Yes, I agreed this point.
>
> >
> > So I'd really expect an actual technical reason for a rename.
>
> This changes purely based on the recent changes on naming conventions
> that have been followed in amlogic and allwinner with regards to
> libretech [1]. I have seen few Bananapi boards from Allwinner H3 has
> been converted as per Libretech computer recently. I assume these

The DTS file for AML-S905X-CC has never been renamed.

The ALL-H3-CC was only reworked to split out the common bits to accommodate
the different SoC (H3 vs H5) variants for the same board. Even after the
rework, the board DTS files retained their original naming scheme. Same
goes for the Bananapi M2+. However we have never renamed Bananapi files
to Libretech.

Since Libre Computer and Firefly both have the ROC-RK3399-PC, renaming
it is likely to cause some confusion.

ChenYu

> changes are because libretech has part of co-designed vendor and also
> open source forum supported for these hardware.
>
> For further information, may be Da Xue can comment on this.
>
> [1] https://libre.computer/products/boards/
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
