From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add driver for NXP SPI Flash Interface
 (SPIFI)
Date: Thu, 04 Jun 2015 12:05:18 -0300
Message-ID: <5570692E.2050603@vanguardiasur.com.ar>
References: <1433106362-6032-1-git-send-email-manabian@gmail.com> <1433106362-6032-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433106362-6032-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Joachim,

I tested the driver and found an issue with it.

On 05/31/2015 06:06 PM, Joachim Eastwood wrote:
> +
> +	spifi->mtd.priv  = &spifi->nor;
> +	spifi->nor.mtd   = &spifi->mtd;
> +	spifi->nor.dev   = spifi->dev;
> +	spifi->nor.priv  = spifi;
> +	spifi->nor.read  = nxp_spifi_read;
> +	spifi->nor.write = nxp_spifi_write;
> +	spifi->nor.erase = nxp_spifi_erase;
> +	spifi->nor.read_reg  = nxp_spifi_read_reg;
> +	spifi->nor.write_reg = nxp_spifi_write_reg;
> +
> +	ret = of_modalias_node(np, modalias, sizeof(modalias));
> +	if (ret < 0) {
> +		dev_err(spifi->dev, "unable to get device modalias\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The first read on a hard reset isn't reliable so do a
> +	 * dummy read of the id before calling spi_nor_scan().
> +	 * The reason for this problem is unknown.
> +	 *
> +	 * The official NXP spifilib uses more or less the same
> +	 * workaround that is applied here by reading the device
> +	 * id multiple times.
> +	 */
> +	nxp_spifi_dummy_id_read(&spifi->nor);
> +

Actually, I think there's an issue here. See how m25p80 deals
with modalias:

	[..]
        else if (!strcmp(spi->modalias, "spi-nor"))
                flash_name = NULL; /* auto-detect */
        else
                flash_name = spi->modalias;

        ret = spi_nor_scan(nor, flash_name, mode);
        if (ret)
                return ret;

I think the "auto-detect" quirk is really needed, or you are will
otherwise fail to probe with the generic "jedec,spi-nor" compatible
string.

Notice that the binding specifies the chip-specific compatible
as optional (it says _May_):

- compatible : May include a device-specific string consisting of the
               manufacturer and name of the chip.

> +	ret = spi_nor_scan(&spifi->nor, modalias, flash_read);
> +	if (ret) {
> +		dev_err(spifi->dev, "device scan failed\n");
> +		return ret;
> +	}

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
