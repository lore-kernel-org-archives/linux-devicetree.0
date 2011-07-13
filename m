From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-esdhc-imx: add device tree probe
 support
Date: Wed, 13 Jul 2011 20:28:12 +0400
Message-ID: <20110713162812.GA7764@oksana.dev.rtsoft.ru>
References: <1309970870-13336-1-git-send-email-shawn.guo@linaro.org>
 <1309970870-13336-5-git-send-email-shawn.guo@linaro.org>
 <20110706210518.GD5371@ponder.secretlab.ca>
 <20110713155212.GB7875@oksana.dev.rtsoft.ru>
 <20110713110940.460a7966@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110713110940.460a7966@schlenkerla.am.freescale.net>
Sender: linux-mmc-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: patches@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-mmc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Chris Ball <cjb@laptop.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2011 at 11:09:40AM -0500, Scott Wood wrote:
[...]
> > - You can't automatically convert named resources into 'struct
> >   resource *', as we do for platform devices now;
> 
> So add named resource support to platform devices. :-)

There are surely no technical difficulties, it's more about 'type
safety', and as a consequence -- resources being discoverable.

If we want to use named resources, I think we should explicitly reserve
the *-{regs,interrupts,gpios} suffixes for such purposes. And once such
a reservation is done, we're safe again -- resources become discoverable.

Thanks,

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
