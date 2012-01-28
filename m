From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/3] ARM: at91/tc/clocksource: Add 32 bit variant to
 Timer Counter
Date: Sat, 28 Jan 2012 11:31:01 -0700
Message-ID: <20120128183101.GE2501@ponder.secretlab.ca>
References: <a311afe3c46da62f7a1e82d2fa933e24ad4eef7e.1326995849.git.nicolas.ferre@atmel.com>
 <d1105b63fce5787a4717ca92ad35397923078e99.1326995849.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <d1105b63fce5787a4717ca92ad35397923078e99.1326995849.git.nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: plagnioj@jcrosoft.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2012 at 07:05:12PM +0100, Nicolas Ferre wrote:
> Some SoC have a 32 bit variant of Timer Counter Blocks. We do not
> need the chaining of two 16 bit counters anymore for them.
> 
> The SoC nature is deduced from the device tree "compatible" string.
> For non-device-tree configurations, backward compatibility is maintained
> by using the default 16 bit counter configuration.
> 
> This patch addresses both the atmel_tclib and its user: tcb_clksrc
> clocksource.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Looks reasonable to me.  One comment below, but otherwise:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

>  static const struct of_device_id atmel_tcb_dt_ids[] = {
>  	{
>  		.compatible = "atmel,at91rm9200-tcb",
> +		.data = &tcb_rm9200_config,
> +	}, {
> +		.compatible = "atmel,at91sam9x5-tcb",
> +		.data = &tcb_sam9x5_config,
>  	}, {
>  		/* sentinel */
>  	}

Using wildcards ('x') in compatible values is strongly discouraged.
Use specific device names instead.  You never know when a vendor may
introduce another part number that fits with the wildcard, but isn't
actually compatible.

Use the exact device name(s) and newer devices can claim compatibility
with the old in the .dts file.

g.
