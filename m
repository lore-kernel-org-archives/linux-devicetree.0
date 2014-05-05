From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/3] regulator: Add LTC3589 support
Date: Mon, 05 May 2014 09:17:23 +0200
Message-ID: <1399274243.3871.2.camel@paszta.hi.pengutronix.de>
References: <1398789430-23897-1-git-send-email-p.zabel@pengutronix.de>
	 <1398789430-23897-3-git-send-email-p.zabel@pengutronix.de>
	 <20140501180738.GP3245@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140501180738.GP3245@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 01.05.2014, 11:07 -0700 schrieb Mark Brown:
> On Tue, Apr 29, 2014 at 06:37:10PM +0200, Philipp Zabel wrote:
> > This patch adds support for the Linear Technology LTC3589, LTC3589-1,
> > and LTC3589-2 8-output I2C voltage regulator ICs.
> 
> One small nit in addition to the vendor prefix thing:
> 
> > +static const int ltc3589_12_ldo4[] = {
> > +	1200000, 1800000, 2500000, 3200000,
> > +};
> 
> This could use regulator_map_voltage_ascend(), though for all practical
> purposes the table is so small it makes no meaningful difference.

The table for the LTC3589-without-1/2 variant is not ascending.
If it makes no difference, I'd prefer to use the same ops for both.

regards
Philipp
