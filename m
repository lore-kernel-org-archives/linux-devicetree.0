From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 4/5] mmc: mxcmmc: enable DMA support on mpc512x
Date: Tue, 2 Apr 2013 09:48:17 +0200
Message-ID: <20130402074817.GK1906@pengutronix.de>
References: <1364768585-5177-1-git-send-email-agust@denx.de>
 <1364768585-5177-5-git-send-email-agust@denx.de>
 <20130402065654.GC1906@pengutronix.de>
 <20130402092944.387d6561@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130402092944.387d6561@crub>
Sender: linux-mmc-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: linux-mmc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Markus Pargmann <mpa@pengutronix.de>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2013 at 09:29:44AM +0200, Anatolij Gustschin wrote:
> On Tue, 2 Apr 2013 08:56:54 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> ...
> > > @@ -336,6 +359,8 @@ static int mxcmci_setup_data(struct mxcmci_host *host, struct mmc_data *data)
> > >  	} else {
> > >  		host->dma_dir = DMA_TO_DEVICE;
> > >  		slave_dirn = DMA_MEM_TO_DEV;
> > > +
> > > +		mxcmci_fixup_buffers(data);
> > 
> > For the register accesses it's fine the way you did in this version, but
> > here I think a
> > 
> > 	if (is_mpc512x_mmc())
> > 		swap_buffer()
> > 
> > would look better.
> 
> the swapping function uses optimised st_le32() which is not available
> on ARM, that's the reason why this is build time selected.

Ah, ok. I think it's fine then.

> Maybe the
> "fixup" in the function name is not pretty, I can change it to "swap"
> then.

Yes, that would be better.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
