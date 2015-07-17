From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v9 5/7] staging: fpga manager core
Date: Fri, 17 Jul 2015 10:27:29 -0700
Message-ID: <55A93B01.4080009@infradead.org>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-6-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1437148277-5405-6-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull@opensource.altera.com, gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On 07/17/15 08:51, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> ---
>  drivers/staging/Kconfig         |    2 +
>  drivers/staging/Makefile        |    1 +
>  drivers/staging/fpga/Kconfig    |   14 ++
>  drivers/staging/fpga/Makefile   |    8 +
>  drivers/staging/fpga/fpga-mgr.c |  373 +++++++++++++++++++++++++++++++++++++++
>  include/linux/fpga/fpga-mgr.h   |  127 +++++++++++++
>  6 files changed, 525 insertions(+)
>  create mode 100644 drivers/staging/fpga/Kconfig
>  create mode 100644 drivers/staging/fpga/Makefile
>  create mode 100644 drivers/staging/fpga/fpga-mgr.c
>  create mode 100644 include/linux/fpga/fpga-mgr.h

> diff --git a/drivers/staging/fpga/Kconfig b/drivers/staging/fpga/Kconfig
> new file mode 100644
> index 0000000..8254ca0
> --- /dev/null
> +++ b/drivers/staging/fpga/Kconfig
> @@ -0,0 +1,14 @@
> +#
> +# FPGA framework configuration
> +#
> +
> +menu "FPGA Configuration Support"
> +
> +config FPGA
> +	bool "FPGA Configuration Framework"
> +	help
> +	  Say Y here if you want support for configuring FPGAs from the
> +	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
> +	  manager drivers.
> +
> +endmenu

Is there some good reason why this is 'bool' instead of 'tristate'?
I.e., why can't it be built as a loadable module?

Thanks.

-- 
~Randy
