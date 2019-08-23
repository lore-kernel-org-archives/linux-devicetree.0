From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [1/3] rtc/fsl: support flextimer for lx2160a
Date: Fri, 23 Aug 2019 16:25:04 +0200
Message-ID: <20190823142504.GA30479@piout.net>
References: <20190823095740.12280-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823095740.12280-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23/08/2019 17:57:38+0800, Biwen Li wrote:
> The patch supports flextimer for lx2160a
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> index 4f7259c2d6a3..2b81525f6db8 100644
> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] = {
>  	{ .compatible = "fsl,ls1088a-ftm-alarm", },
>  	{ .compatible = "fsl,ls208xa-ftm-alarm", },
>  	{ .compatible = "fsl,ls1028a-ftm-alarm", },
> +	{ .compatible = "fsl,lx2160a-ftm-alarm", },
>  	{ },
>  };

I've squashed it with 3/3 and in the patch adding the driver. I also
added proper documentation.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
