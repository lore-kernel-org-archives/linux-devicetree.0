From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 1/5] watchdog: davinci: change driver to use WDT core
Date: Wed, 4 Dec 2013 12:48:18 -0800
Message-ID: <20131204204818.GA3096@roeck-us.net>
References: <1386185970-14488-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386185970-14488-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386185970-14488-2-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, wim@iguana.be, nsekhar@ti.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 04, 2013 at 09:39:26PM +0200, Ivan Khoronzhuk wrote:
> To reduce code duplicate and increase code readability use WDT core
> code to handle WDT interface.
> 
> Remove io_lock as the WDT core uses mutex to lock each wdt device.
> Remove wdt_state as the WDT core tracks state with its own variable.
> 
> The watchdog_init_timeout() can read timeout value from timeout-sec
> property if the passed value is out of bounds. The heartbeat is
> initialized in next way. If heartbeat is not set thought module
> parameter, try to read it's value from WDT node timeout-sec property.
> If node has no one, use default value.
> 
> The heartbeat is hold in wdd->timeout by WDT core, so use it in
> order to set timeout period.
> 
> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Looks good, except you did not explain ...

>  
> -	dev_info(dev, "heartbeat %d sec\n", heartbeat);
> +	watchdog_set_nowayout(wdd, 1);
>  
why nowayout is enforced.

Thanks,
Guenter
