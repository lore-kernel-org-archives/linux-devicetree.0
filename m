From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/7] mfd: MT6397: Add regmap for MT8135 and MT6397 SoC
Date: Tue, 18 Nov 2014 14:46:18 +0100
Message-ID: <20141118134618.GF30369@pengutronix.de>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
 <1416210027-5562-3-git-send-email-flora.fu@mediatek.com>
 <20141118114645.GX24004@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141118114645.GX24004@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Flora Fu <flora.fu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Dongdong Cheng <dongdong.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 18, 2014 at 11:46:45AM +0000, Lee Jones wrote:
> On Mon, 17 Nov 2014, Flora Fu wrote:
> 
> > Add PMIC wrapper of MT8135 to access MFD MT6397.
> > This is regmap of MT6397 MFD.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >  drivers/mfd/Kconfig            |   8 +
> >  drivers/mfd/Makefile           |   1 +
> >  drivers/mfd/mt8135-pmic-wrap.c | 847 +++++++++++++++++++++++++++++++++++++++++
> 
> All of the PMIC functionality needs removing from MFD and placed
> somewhere else.  I suggest either drivers/power or drivers/regulator.

This is no PMIC functionality. The MT8135 has a unit which is is used to
access the PMIC (which is not only a PMIC, but also Touchscreen
interface and other stuff). This unit is called pmic-wrapper in the
docs. See the introductory mail for a nice picture.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
