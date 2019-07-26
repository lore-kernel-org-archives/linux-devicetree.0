From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v9 8/8] EDAC: armada_xp: Add support for more SoCs
Date: Fri, 26 Jul 2019 15:51:15 +0100
Message-ID: <128016c1-380f-70c4-3a89-2d3b0edf9f88@arm.com>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
 <20190712034904.5747-9-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712034904.5747-9-chris.packham@alliedtelesis.co.nz>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patches@armlinux.org.uk, mchehab@kernel.org, jlu@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

On 12/07/2019 04:49, Chris Packham wrote:
> The Armada 38x and other integrated SoCs use a reduced pin count so the
> width of the SDRAM interface is smaller than the Armada XP SoCs. This
> means that the definition of "full" and "half" width is reduced from
> 64/32 to 32/16.

> diff --git a/drivers/edac/armada_xp_edac.c b/drivers/edac/armada_xp_edac.c
> index 3759a4fbbdee..7f227bdcbc84 100644
> --- a/drivers/edac/armada_xp_edac.c
> +++ b/drivers/edac/armada_xp_edac.c
> @@ -332,6 +332,11 @@ static int axp_mc_probe(struct platform_device *pdev)
>  
>  	axp_mc_read_config(mci);
>  
> +	/* These SoCs have a reduced width bus */
> +	if (of_machine_is_compatible("marvell,armada380") ||
> +	    of_machine_is_compatible("marvell,armadaxp-98dx3236"))
> +		drvdata->width /= 2;

So the hardware's SDRAM_CONFIG_BUS_WIDTH value is wrong? Yuck.

Is it too late for the DTs on these two systems to provide a DT version of the 'bus_width'
to override the hardware's mis-advertised value?

This way you don't need to grow this list.

Acked-by: James Morse <james.morse@arm.com>


Thanks,

James
