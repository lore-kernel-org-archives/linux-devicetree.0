From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Mon, 11 Feb 2019 10:23:42 +0530
Message-ID: <fd245dc9-6d3c-8075-a684-d4fe6cb85849@ti.com>
References: <20190128054935.4972-1-vigneshr@ti.com>
 <20190128054935.4972-3-vigneshr@ti.com>
 <2efbca08-c4ab-34ea-0e34-05aed7168df8@microchip.com>
 <daa35c21-195e-eeb5-8aa2-cf42eff6a554@ti.com>
 <20190210141912.1da19db6@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210141912.1da19db6@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 10/02/19 6:49 PM, Boris Brezillon wrote:
> On Tue, 5 Feb 2019 11:43:46 +0530
> Vignesh R <vigneshr@ti.com> wrote:
> 
>>>>  static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>>>  {
>>>> -	const struct spi_nor_hwcaps hwcaps = {
>>>> -		.mask = SNOR_HWCAPS_READ |
>>>> -			SNOR_HWCAPS_READ_FAST |
>>>> -			SNOR_HWCAPS_READ_1_1_2 |
>>>> -			SNOR_HWCAPS_READ_1_1_4 |
>>>> -			SNOR_HWCAPS_PP,
>>>> -	};
>>>>  	struct platform_device *pdev = cqspi->pdev;
>>>>  	struct device *dev = &pdev->dev;
>>>> +	const struct cqspi_driver_platdata *ddata;
>>>> +	struct spi_nor_hwcaps hwcaps;
>>>>  	struct cqspi_flash_pdata *f_pdata;
>>>>  	struct spi_nor *nor;
>>>>  	struct mtd_info *mtd;
>>>>  	unsigned int cs;
>>>>  	int i, ret;
>>>>  
>>>> +	ddata = of_device_get_match_data(dev);
>>>> +	if (!ddata)
>>>> +		hwcaps.mask = CQSPI_BASE_HWCAPS_MASK;  
>>>
>>> Now that .data is set in all cqspi_dt_ids[], maybe it's better to print a
>>> message and return an error here. But I guess it's a matter of taste, so not a
>>> show stopper.  
>>
>> Since, driver data is kernel internal field, I guess there is little
>> help in printing out the error to the user when its missing. I prefer to
>> keep this as is, as basic Quad mode is supported by all versions of the IP.
> 
> Well, if all compat entries have an associated platdata instance we
> don't need to support the !ddata case, right? I think enforcing the
> presence of such a platdata is actually is a sane thing to do (which
> implies returning an error when ddata is NULL).
> 

Ok, will respin with a dev_err() and return -EINVAL when ddata is NULL.

-- 
Regards
Vignesh
