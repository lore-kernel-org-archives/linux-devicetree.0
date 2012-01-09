From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [RFC PATCH v3 3/5] pinctrl: imx: add pinctrl imx driver
Date: Mon, 9 Jan 2012 10:08:51 +0800
Message-ID: <20120109020848.GF1835@S2101-09.ap.freescale.net>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-4-git-send-email-b29396@freescale.com>
 <20120108130542.GC2203@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120108130542.GC2203@richard-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, w.sang@pengutronix.de, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, cjb@laptop.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com
List-Id: devicetree@vger.kernel.org

On Sun, Jan 08, 2012 at 09:05:44PM +0800, Richard Zhao wrote:
> > +enum imx_imx53_pinctrl_pads {
> > +	MX53_GPIO_19 = 0,
> > +	MX53_KEY_COL0 = 1,
> > +	MX53_KEY_ROW0 = 2,
> > +	MX53_KEY_COL1 = 3,
> > +	MX53_KEY_ROW1 = 4,
> > +	MX53_KEY_COL2 = 5,
> > +	MX53_KEY_ROW2 = 6,
> ...
> Why not describe it in dts and make this file generic for imx?
> One node for one pad,

Doing this will bloat the device tree dramatically.  Actually I had
a patch doing so before the pinctrl subsystem was born, but it
concerned Grant a lot for that reason and thus died.

> it'll be easy to extend pad properties. You know
> the pad may set pull up/down, open drain, drive strenth, daisy chain etc.
> The features have to be supported, to make your model usefull.
> 
As Aisheng mentioned, the pinconf support will be added later.

-- 
Regards,
Shawn
