From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Thu, 23 Feb 2017 10:28:52 +0100
Message-ID: <20170223102852.47d5bf5d@crub>
References: <1487759951-20711-1-git-send-email-agust@denx.de>
 <1487759951-20711-3-git-send-email-agust@denx.de>
 <e9620f07-48bd-1f83-a686-6874becbba86@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e9620f07-48bd-1f83-a686-6874becbba86-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Feb 2017 16:04:47 +0100
Michal Simek michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org wrote:
...
>> +	/* program latency */
>> +	usleep_range(prog_latency_1000us, prog_latency_1000us + 500);  
>
>Based on my colleague for spartan6 this should be 5ms and other xilinx
>fpgas can take up to 7.5ms.
>
>In general, it is better to poll for INIT_B pin==High (but that takes
>another GPIO) and wait until at least 10 ms before timeout.

checked in the ug380.pdf, it depends on the speed grade, for some
spartan6 it can be max. 4ms, for others 5ms. It is a max. value,
INIT_B can go high earlier, but in my hw setup INIT_B is not
connected. Someone with a hw setup with INIT_B connected can
add optional support for INIT_P polling.

...
>> +static int xilinx_spi_write_complete(struct fpga_manager *mgr,
>> +				     struct fpga_image_info *info)
>> +{
>> +	struct xilinx_spi_conf *conf = mgr->priv;
>> +	int wait;
>> +
>> +	if (gpiod_get_value(conf->done))
>> +		return 0;
>> +
>> +	wait = info->config_complete_timeout_us / FPGA_MIN_CFG_WAIT_US;
>> +	if (info->config_complete_timeout_us % FPGA_MIN_CFG_WAIT_US)
>> +		wait += 1;
>> +
>> +	while (wait--) {
>> +		usleep_range(FPGA_MIN_CFG_WAIT_US, FPGA_MIN_CFG_WAIT_US + 5);
>> +
>> +		if (gpiod_get_value(conf->done))
>> +			return 0;
>> +	}
>> +  
>
>Based on my colleague:
>IMHO, for step 4 it is better to do these steps to cover more possible
>configuration DONE scenarios:
>
>While ((DONE==0) and (NOT TIMEOUT)) {
>    Continue to apply CCLK cycles;
>    Check DONE;
>    timeout++;
>}
>
>Apply at least 8 more CCLK cycles.
>
>The timeout should be equivalent to at least 10 ms of time.

You mead Step 8 I think, not step 4. Will see what I can change.

Thansk,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
