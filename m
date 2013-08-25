From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [patch] dmaengine: ste_dma40: off by one in d40_of_probe()
Date: Sun, 25 Aug 2013 16:24:25 +0530
Message-ID: <20130825105425.GA2748@intel.com>
References: <20130823092343.GF31293@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130823092343.GF31293@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2013 at 12:23:43PM +0300, Dan Carpenter wrote:
> If "num_disabled" is equal to STEDMA40_MAX_PHYS (32) then we would write
> one space beyond the end of the pdata->disable_channels[] array.
Applied, thanks

~Vinod
