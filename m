From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/5] watchdog: sp805: add 'timeout-sec' DT property
 support
Date: Tue, 22 May 2018 13:57:27 -0700
Message-ID: <20180522205727.GC16363@roeck-us.net>
References: <1527014840-21236-1-git-send-email-ray.jui@broadcom.com>
 <1527014840-21236-3-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527014840-21236-3-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 11:47:17AM -0700, Ray Jui wrote:
> Add support for optional devicetree property 'timeout-sec'.
> 'timeout-sec' is used in the driver if specified in devicetree.
> Otherwise, fall back to driver default, i.e., 60 seconds
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp805_wdt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 03805bc..1484609 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -230,7 +230,14 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
>  	spin_lock_init(&wdt->lock);
>  	watchdog_set_nowayout(&wdt->wdd, nowayout);
>  	watchdog_set_drvdata(&wdt->wdd, wdt);
> -	wdt_setload(&wdt->wdd, DEFAULT_TIMEOUT);
> +
> +	/*
> +	 * If 'timeout-sec' devicetree property is specified, use that.
> +	 * Otherwise, use DEFAULT_TIMEOUT
> +	 */
> +	wdt->wdd.timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeout(&wdt->wdd, 0, &adev->dev);
> +	wdt_setload(&wdt->wdd, wdt->wdd.timeout);
>  
>  	ret = watchdog_register_device(&wdt->wdd);
>  	if (ret) {
> -- 
> 2.1.4
> 
