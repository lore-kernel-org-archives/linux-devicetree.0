From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/8] driver core: make deferring probe after init
 optional
Date: Thu, 24 May 2018 21:00:31 +0200
Message-ID: <20180524190031.GB31019@kroah.com>
References: <20180524175024.19874-1-robh@kernel.org>
 <20180524175024.19874-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180524175024.19874-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Graf <agraf@suse.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, boot-architecture@lists.linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 24, 2018 at 12:50:17PM -0500, Rob Herring wrote:
> Deferred probe will currently wait forever on dependent devices to probe,
> but sometimes a driver will never exist. It's also not always critical for
> a driver to exist. Platforms can rely on default configuration from the
> bootloader or reset defaults for things such as pinctrl and power domains.
> This is often the case with initial platform support until various drivers
> get enabled. There's at least 2 scenarios where deferred probe can render
> a platform broken. Both involve using a DT which has more devices and
> dependencies than the kernel supports. The 1st case is a driver may be
> disabled in the kernel config. The 2nd case is the kernel version may
> simply not have the dependent driver. This can happen if using a newer DT
> (provided by firmware perhaps) with a stable kernel version.
> 
> Subsystems or drivers may opt-in to this behavior by calling
> driver_deferred_probe_check_init_done() instead of just returning
> -EPROBE_DEFER. They may use additional information from DT or kernel's
> config to decide whether to continue to defer probe or not.
> 
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/base/dd.c      | 17 +++++++++++++++++
>  include/linux/device.h |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index c9f54089429b..d6034718da6f 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -226,6 +226,16 @@ void device_unblock_probing(void)
>  	driver_deferred_probe_trigger();
>  }
>  
> +int driver_deferred_probe_check_init_done(struct device *dev, bool optional)
> +{
> +	if (optional && initcalls_done) {

Wait, what's the "optional" mess here?

The caller knows this value, so why do you need to even pass it in here?

And bool values that are not obvious are horrid.  I had to go look this
up when reading the later patches that just passed "true" in this
variable as I had no idea what that meant.

So as-is, no, this isn't ok, sorry.

And at the least, this needs some kerneldoc to explain it :)

thanks,

greg k-h
