From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [patch] spi/xilinx: signedness issue checking platform_get_irq()
Date: Wed, 17 Jul 2013 09:03:53 -0600
Message-ID: <51E6B259.3030303@wwwdotorg.org>
References: <20130717122638.GB4851@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20130717122638.GB4851@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/17/2013 06:26 AM, Dan Carpenter wrote:
> "xspi->irq" is unsigned int so it's never less than zero.  I have added
> a cast.

Um. Doesn't this just hide a warning, not solve the problem? If the
value can't be negative, so the if condition never fires, then the cast
won't change that...
