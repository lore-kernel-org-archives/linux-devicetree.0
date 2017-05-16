From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] cec: add STM32 cec driver
Date: Tue, 16 May 2017 15:09:25 +0200
Message-ID: <c1b7a339-7746-76ec-a1f4-e1bcd01fbdd0@xs4all.nl>
References: <1494939383-18937-1-git-send-email-benjamin.gaignard@linaro.org>
 <1494939383-18937-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494939383-18937-3-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, yannick.fertre-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Looks good, except for the logical address handling that I think is wrong:

On 16/05/17 14:56, Benjamin Gaignard wrote:
> This patch add cec driver for STM32 platforms.
> cec hardware block isn't not always used with hdmi so
> cec notifier is not implemented. That will be done later
> when STM32 DSI driver will be available.
> 
> Driver compliance has been tested with cec-ctl and cec-compliance
> tools.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/media/platform/Kconfig           |  11 +
>  drivers/media/platform/Makefile          |   2 +
>  drivers/media/platform/stm32/Makefile    |   1 +
>  drivers/media/platform/stm32/stm32-cec.c | 384 +++++++++++++++++++++++++++++++
>  4 files changed, 398 insertions(+)
>  create mode 100644 drivers/media/platform/stm32/Makefile
>  create mode 100644 drivers/media/platform/stm32/stm32-cec.c
> 

<snip>

> +static int stm32_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
> +{
> +	struct stm32_cec *cec = adap->priv;
> +
> +	regmap_update_bits(cec->regmap, CEC_CR, CECEN, 0);
> +
> +	if (logical_addr == CEC_LOG_ADDR_INVALID)
> +		regmap_update_bits(cec->regmap, CEC_CFGR, OAR, 0);
> +	else
> +		regmap_update_bits(cec->regmap, CEC_CFGR, OAR,
> +				   (1 << logical_addr) << 16);
> +
> +	regmap_update_bits(cec->regmap, CEC_CR, CECEN, CECEN);
> +
> +	return 0;
> +}
> +

If you allocate more than one logical address, then stm32_cec_adap_log_addr()
is called once for each LA. But right now the second call would overwrite
the first LA. Right?

Try 'cec-ctl --audio --playback' to allocate two logical addresses.

<snip>

> +static int stm32_cec_monitor_all(struct cec_adapter *adap, bool enable)
> +{
> +	struct stm32_cec *cec = adap->priv;
> +
> +	regmap_update_bits(cec->regmap, CEC_CR, CECEN, 0);
> +
> +	if (enable) {
> +		regmap_update_bits(cec->regmap, CEC_CFGR, OAR, OAR)

You shouldn't have to change the OAR mask. This would have the adapter
Ack all logical addresses.

> +		regmap_update_bits(cec->regmap, CEC_CFGR, LSTN, 0);
> +	} else {
> +		regmap_update_bits(cec->regmap, CEC_CFGR, OAR, 0);

And this would disable all logical addresses.

I would expect that only the LSTN bit was changed.

In monitoring mode it should still Ack any messages directed to us.

> +		regmap_update_bits(cec->regmap, CEC_CFGR, LSTN, LSTN);
> +	}
> +
> +	regmap_update_bits(cec->regmap, CEC_CR, CECEN, CECEN);
> +
> +	return 0;
> +}

<snip>

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
