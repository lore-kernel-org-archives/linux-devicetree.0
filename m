From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: imx-drm: ipu-v3: ipu-common.c: Cleaning up
 return of uninitialized variable
Date: Thu, 19 Jun 2014 15:51:00 -0700
Message-ID: <20140619225100.GA15258@kroah.com>
References: <1402788921-15458-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <1402788921-15458-2-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1402788921-15458-2-git-send-email-rickard_strandqvist@spectrumdigital.se>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Valentina Manea <valentina.manea.m@gmail.com>, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 15, 2014 at 01:35:21AM +0200, Rickard Strandqvist wrote:
> Before when there was an error a uninitialized variable would be returnd.
> Now it returns -ENODEV
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>  drivers/staging/imx-drm/ipu-v3/ipu-common.c |    4 ++--

This file isn't even in the tree anymore, what did you make this patch
against?
