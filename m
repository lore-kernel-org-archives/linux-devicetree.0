From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  2/2] ARM: shmobile: Enable BQ32000 rtc in
 shmobile_defconfig
Date: Thu, 17 Aug 2017 11:01:12 +0200
Message-ID: <20170817090112.GE27693@verge.net.au>
References: <1502197465-61546-1-git-send-email-biju.das@bp.renesas.com>
 <1502197465-61546-3-git-send-email-biju.das@bp.renesas.com>
 <20170809090421.GN2705@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170809090421.GN2705@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 09, 2017 at 11:04:21AM +0200, Simon Horman wrote:
> On Tue, Aug 08, 2017 at 02:04:25PM +0100, Biju Das wrote:
> > The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> > To increase hardware support enable the driver in the
> > shmobile_defconfig multiplatform configuration.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks, applied for v4.14.

Please consider posting a similar patch for multi_v7_defconfig.

> > ---
> >  arch/arm/configs/shmobile_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> > index 18886c5..7b4fc01 100644
> > --- a/arch/arm/configs/shmobile_defconfig
> > +++ b/arch/arm/configs/shmobile_defconfig
> > @@ -193,6 +193,7 @@ CONFIG_LEDS_CLASS=y
> >  CONFIG_LEDS_GPIO=y
> >  CONFIG_RTC_CLASS=y
> >  CONFIG_RTC_DRV_RS5C372=y
> > +CONFIG_RTC_DRV_BQ32K=y
> >  CONFIG_RTC_DRV_S35390A=y
> >  CONFIG_RTC_DRV_RX8581=y
> >  CONFIG_RTC_DRV_DA9063=y
> > -- 
> > 1.9.1
> > 
> 
