From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH v4 2/5] media: ov5695: add support for OV5695 sensor
Date: Tue, 9 Jan 2018 18:54:40 +0200
Message-ID: <20180109165440.droexlfysvtyt6kl@tarshish>
References: <1515509304-15941-1-git-send-email-zhengsq@rock-chips.com>
 <1515509304-15941-3-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515509304-15941-3-git-send-email-zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shunqian Zheng,

On Tue, Jan 09, 2018 at 10:48:21PM +0800, Shunqian Zheng wrote:
> +static int ov5695_write_array(struct i2c_client *client,
> +			      const struct regval *regs)
> +{
> +	u32 i;
> +	int ret = 0;
> +
> +	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
> +		ret = ov5695_write_reg(client, regs[i].addr,
> +				       OV5695_REG_VALUE_08BIT, regs[i].val);

This loop should stop on first failure, and return the error value. With 
current code a register write failure is masked by following writes.

> +
> +	return ret;
> +}

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
