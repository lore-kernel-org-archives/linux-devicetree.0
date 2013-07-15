From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] regulator: pfuze100: add pfuze100 regulator driver
Date: Mon, 15 Jul 2013 14:49:51 +0800
Message-ID: <20130715064949.GA11486@S2101-09.ap.freescale.net>
References: <1373604855-17714-1-git-send-email-b38343@freescale.com>
 <20130715012233.GA2730@S2101-09.ap.freescale.net>
 <20130715064037.GA4722@Robin-OptiPlex-780>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130715064037.GA4722@Robin-OptiPlex-780>
Sender: linux-doc-owner@vger.kernel.org
To: Robin Gong <b38343@freescale.com>
Cc: linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, lgirdwood@gmail.com, broonie@kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 02:40:39PM +0800, Robin Gong wrote:
> > > +static const struct of_device_id pfuze_dt_ids[] = {
> > > +	{ .compatible = "fsl,pfuze100", .data = (void *)PFUZE_ID_PFUZE100},
> > 
> > You do not use .data in the driver at all, and can just drop it.
> >
> good catch. .driver_data  of i2c_device_id and .data of of_device_id are two different ways to let driver know which chip used now by DTS or not. I should use them to know which chip used now ,although I can know by reading chipid register. 
> 

If you can figure out the chip ID from hardware, it should be used as
the preference over compatible and .driver_data.

Shawn

