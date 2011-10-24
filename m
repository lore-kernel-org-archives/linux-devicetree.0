From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH V3 1/2] ARM: at91: dt: at91sam9g45 family and board
	device tree files
Date: Mon, 24 Oct 2011 16:12:54 +0200
Message-ID: <20111024141253.GF26649@sapphire.tkos.co.il>
References: <4E9F8226.4030503@gmail.com>
	<15ab652499e7f6f8a26724bfd90643a8f3f96ad9.1319464310.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <15ab652499e7f6f8a26724bfd90643a8f3f96ad9.1319464310.git.nicolas.ferre@atmel.com>
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
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Mon, Oct 24, 2011 at 04:05:00PM +0200, Nicolas Ferre wrote:
> Create a new device tree source file for Atmel at91sam9g45 SoC family.
> The Evaluation Kit at91sam9m10g45ek includes it.
> This first basic support will be populated as drivers and boards will be
> converted to device tree.
> Contains serial, dma and interrupt controllers.
> 
> The generic board file still takes advantage of platform data for early serial
> init. As we need a storage media and the NAND flash driver is not converted to
> DT yet, we keep old initialization for it.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---

[snip]

> +DT_MACHINE_START(at91sam9m10g45ek_dt, "Atmel AT91SAM (Device Tree)")

Since this is a generic AT91 machine descriptor, won't "at91sam_dt" be a more 
appropriate name?

> +	/* Maintainer: Atmel */
> +	.timer		= &at91sam926x_timer,
> +	.map_io		= at91_map_io,
> +	.init_early	= ek_init_early,
> +	.init_irq	= at91_dt_init_irq,
> +	.init_machine	= at91_dt_device_init,
> +	.dt_compat	= at91_dt_board_compat,
> +MACHINE_END

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
