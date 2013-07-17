From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] spi/xilinx: signedness issue checking platform_get_irq()
Date: Wed, 17 Jul 2013 18:34:26 +0300
Message-ID: <20130717153426.GD5585@mwanda>
References: <20130717122638.GB4851@elgon.mountain>
 <51E6B259.3030303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E6B259.3030303@wwwdotorg.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2013 at 09:03:53AM -0600, Stephen Warren wrote:
> On 07/17/2013 06:26 AM, Dan Carpenter wrote:
> > "xspi->irq" is unsigned int so it's never less than zero.  I have added
> > a cast.
> 
> Um. Doesn't this just hide a warning, not solve the problem? If the
> value can't be negative, so the if condition never fires, then the cast
> won't change that...

No.  It fixes the problem but Mark is right that it's ugly.  Sorry
for that.  I will resend.

regards,
dan carpenter

