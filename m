From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [v4,1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Date: Mon, 15 Jul 2019 16:56:37 +0200
Message-ID: <20190715145637.GG4732@piout.net>
References: <20190715101520.22562-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190715101520.22562-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15/07/2019 18:15:19+0800, Biwen Li wrote:
> +	device_init_wakeup(&pdev->dev, true);
> +	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "ftm-alarm",
> +							&ftm_rtc_ops,
> +							THIS_MODULE);

To be clear, I want you to not use devm_rtc_device_register and use
devm_rtc_allocate_device and rtc_register_device.

> +	if (IS_ERR(rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "can't register rtc device\n");
> +		return PTR_ERR(rtc->rtc_dev);
> +	}
> +

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
