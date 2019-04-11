From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v6 04/12] firmware: ti_sci: Add RM mapping table for am654
Date: Thu, 11 Apr 2019 07:54:16 -0700
Message-ID: <20190411145416.GP2839@atomide.com>
References: <20190410041358.16809-1-lokeshvutla@ti.com>
 <20190410041358.16809-5-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190410041358.16809-5-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

* Lokesh Vutla <lokeshvutla@ti.com> [190410 04:15]:
> From: Peter Ujfalusi <peter.ujfalusi@ti.com>
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.txt b/Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
> index b56a02c10ae6..6f0cd31c1520 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
> @@ -24,7 +24,8 @@ relationship between the TI-SCI parent node to the child node.
>  
>  Required properties:
>  -------------------
> -- compatible: should be "ti,k2g-sci"
> +- compatible:	should be "ti,k2g-sci" for TI 66AK2G SoC
> +		should be "ti,am654-sci" for for TI AM654 SoC
>  - mbox-names:
>  	"rx" - Mailbox corresponding to receive path
>  	"tx" - Mailbox corresponding to transmit path
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index d303f5a14da9..88e461498def 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -2297,10 +2297,33 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
>  	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
>  	.max_msgs = 20,
>  	.max_msg_size = 64,
> +	.rm_type_map = NULL,
> +};
> +
> +static struct ti_sci_rm_type_map ti_sci_am654_rm_type_map[] = {
> +	{.dev_id = 56, .type = 0x00b}, /* GIC_IRQ */
> +	{.dev_id = 179, .type = 0x000}, /* MAIN_NAV_UDMASS_IA0 */
> +	{.dev_id = 187, .type = 0x009}, /* MAIN_NAV_RA */
> +	{.dev_id = 188, .type = 0x006}, /* MAIN_NAV_UDMAP */
> +	{.dev_id = 194, .type = 0x007}, /* MCU_NAV_UDMAP */
> +	{.dev_id = 195, .type = 0x00a}, /* MCU_NAV_RA */
> +	{.dev_id = 0, .type = 0x000}, /* end of table */
> +};
> +
> +/* Description for AM654 */
> +static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
> +	.default_host_id = 12,
> +	/* Conservative duration */
> +	.max_rx_timeout_ms = 10000,
> +	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
> +	.max_msgs = 20,
> +	.max_msg_size = 60,
> +	.rm_type_map = ti_sci_am654_rm_type_map,
>  };
>  
>  static const struct of_device_id ti_sci_of_match[] = {
>  	{.compatible = "ti,k2g-sci", .data = &ti_sci_pmmc_k2g_desc},
> +	{.compatible = "ti,am654-sci", .data = &ti_sci_pmmc_am654_desc},
>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ti_sci_of_match);

Great, this approach with mapping table in the driver based on
the compatible looks good to me and avoids stuffing the IDs
into device tree:

Acked-by: Tony Lindgren <tony@atomide.com>
