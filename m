From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v3 1/6] watchdog: davinci: change driver to use WDT core
Date: Tue, 26 Nov 2013 13:09:56 +0200
Message-ID: <52948184.50604@ti.com>
References: <1385388285-10553-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1385388285-10553-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385388285-10553-2-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, wim@iguana.be, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/25/2013 04:04 PM, Ivan Khoronzhuk wrote:
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
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   arch/arm/mach-davinci/da8xx-dt.c      |    2 +-
>   arch/arm/mach-davinci/devices-da8xx.c |    4 +-
>   arch/arm/mach-davinci/devices.c       |    2 +-
>   drivers/watchdog/Kconfig              |    2 +
>   drivers/watchdog/davinci_wdt.c        |  151 ++++++++-------------------------
>   5 files changed, 43 insertions(+), 118 deletions(-)

Pls note, that this patch contains both changes in platform and driver 
code to fix regression reported by Sekhar Nori on v2 of this series and 
caused by driver name changing.

Is it ok?

It can be splitted, but then both patches will introduce regression by 
itself and thing will work only if both of them will be applied together.

>
> diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
> index d2bc574..ed19287 100644
[...]
> -MODULE_ALIAS("platform:watchdog");
> +MODULE_ALIAS("platform:davinci-wdt");
>
Regards,
-Grygorii
