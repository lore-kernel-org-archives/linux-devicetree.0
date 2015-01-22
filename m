From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: [PATCH 2/2] remoteproc: microblaze: Add support for microblaze
 on Zynq
Date: Thu, 22 Jan 2015 10:53:13 -0600
Message-ID: <54C12AF9.40200@mentor.com>
References: <a458462d2dc6901440bded015608f7a9df9e7942.1421662385.git.michal.simek@xilinx.com> <10276362c737fc9da863f1a07737fd91f7340242.1421662385.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10276362c737fc9da863f1a07737fd91f7340242.1421662385.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, Ohad Ben-Cohen <ohad@wizery.com>, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 01/19/2015 04:30 AM, Michal Simek wrote:
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5e343bab9458..3955f42e9e9c 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -64,4 +64,15 @@ config DA8XX_REMOTEPROC
>  	  It's safe to say n here if you're not interested in multimedia
>  	  offloading.
> 
> +config MB_REMOTEPROC
> +	tristate "Support Microblaze remoteproc"
> +	depends on ARCH_ZYNQ && !DEBUG_SG
> +	select GPIO_XILINX
> +	select REMOTEPROC
> +	select RPMSG
> +	default m
> +	help
> +	  Say y here to support Xilinx Microblaze remote processors
> +	  on the Xilinx Zynq.
> +
>  endmenu

The dependency on !DEBUG_SG seems unusual, and worth a comment if it's
truly needed.  And the module should be disabled by default, no?
