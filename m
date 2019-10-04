From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 3/3] mfd: madera: Add support for requesting the
 supply clocks
Date: Fri, 4 Oct 2019 15:21:34 +0000
Message-ID: <20191004152134.GA31391@ediswmail.ad.cirrus.com>
References: <20191001134617.12093-1-ckeepax@opensource.cirrus.com>
 <20191001134617.12093-3-ckeepax@opensource.cirrus.com>
 <20191004143410.GJ18429@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191004143410.GJ18429@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 04, 2019 at 03:34:10PM +0100, Lee Jones wrote:
> On Tue, 01 Oct 2019, Charles Keepax wrote:
> 
> > Add the ability to get the clock for each clock input pin of the chip
> > and enable MCLK2 since that is expected to be a permanently enabled
> > 32kHz clock.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  	/* Init 32k clock sourced from MCLK2 */
> > +	ret = clk_prepare_enable(madera->mclk[MADERA_MCLK2].clk);
> > +	if (ret != 0) {
> 
> Nit: Why is this not 'if (ret)' like in the rest of the file?
> 

Apologies will get that fixed up.

Thanks,
Charles
