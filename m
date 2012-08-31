From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 7/7] mfd: anatop-mfd: remove anatop driver
Date: Fri, 31 Aug 2012 09:39:26 +0800
Message-ID: <20120831013924.GB7726@r65073-Latitude-D630>
References: <1346237818-9498-1-git-send-email-b29396@freescale.com>
 <1346237818-9498-8-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346237818-9498-8-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, sameo@linux.intel.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, richard.zhao@freescale.com, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2012 at 06:56:58PM +0800, Dong Aisheng wrote:
> -config MFD_ANATOP
> -	bool "Support for Freescale i.MX on-chip ANATOP controller"
> -	depends on SOC_IMX6Q
> -	help
> -	  Select this option to enable Freescale i.MX on-chip ANATOP
> -	  MFD controller. This controller embeds regulator and
> -	  thermal devices for Freescale i.MX platforms.
> -

All the occurrences of MFD_ANATOP should be removed too.  I know there
is one in arch/arm/mach-imx/Kconfig.

Regards,
Shawn
