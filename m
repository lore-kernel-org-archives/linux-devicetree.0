From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] Re: [PATCH] arm64: defconfig: Enable MFD_AXP20X_I2C
Date: Wed, 24 Oct 2018 18:07:51 +0100
Message-ID: <20181024170751.uf4xxo4h7ew5lpne@flea>
References: <20180731133828.2582-1-jagan@amarulasolutions.com>
 <20180731134036.mzgntiv6fwxg2vja@flea>
 <CAMty3ZC2==BYChib71qyzd7oRkUHB3hunKw2FGRj3t=U2vK5nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZC2==BYChib71qyzd7oRkUHB3hunKw2FGRj3t=U2vK5nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 01:52:37PM +0530, Jagan Teki wrote:
> On Tue, Jul 31, 2018 at 7:10 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, Jul 31, 2018 at 07:08:28PM +0530, Jagan Teki wrote:
> > > The Allwinner H6 SoC is paired with the X-Powers AXP805 PMIC
> > > connected via I2C.
> > >
> > > Enable the driver for this PMIC.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> Can you apply this? needed for mmc to detect on H6

Please resend it.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
