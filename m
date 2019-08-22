From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [v7,1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Date: Thu, 22 Aug 2019 23:12:16 +0200
Message-ID: <20190822211216.GC27031@piout.net>
References: <20190813030157.48590-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813030157.48590-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13/08/2019 11:01:56+0800, Biwen Li wrote:
> For the paltforms including LS1012A, LS1021A, LS1028A, LS1043A,
> LS1046A, LS1088A, LS208xA that has the FlexTimer
> module, implementing alarm functions within RTC subsystem
> to wakeup the system when system going to sleep (work with RCPM driver).
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v7:
>     - None
> 
> Change in v6:
>     - None
> 
> Change in v5:
>     - replace devm_rtc_device_register with devm_rtc_allocate_device
>     and rtc_register_device
> 
> Change in v4:
>     - clean code
>     - correct requesting irq
>     - register as a regular RTC driver
>     - change return value of ftm_rtc_set_alarm from -EINVAL to -ERANGE
>     - replace pr_err with dev_err
>     - sort alphabetically
>     - auto select RCPM driver
>     - correct UTC time in ftm_rtc_read_time
> 
> Change in v3:
> 	- add some comments about clock source and errata
> 	- adjust format
> 	- replace endian with big_endian of struct ftm_rtc
> 	- remove compatible "fsl,ftm-alarm"
> 
> Change in v2:
> 	- remove code about setting rcpm
> 
>  drivers/rtc/Kconfig             |  15 ++
>  drivers/rtc/Makefile            |   1 +
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 336 ++++++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 drivers/rtc/rtc-fsl-ftm-alarm.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
