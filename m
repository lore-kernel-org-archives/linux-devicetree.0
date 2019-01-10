From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 3/3] rtc: sd3078: new driver.
Date: Thu, 10 Jan 2019 21:57:01 +0100
Message-ID: <20190110205701.GA2362@piout.net>
References: <1544696030-17159-1-git-send-email-long17.cool@163.com>
 <1544696030-17159-3-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544696030-17159-3-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dianlong Li <long17.cool@163.com>
Cc: robh@kernel.org, a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13/12/2018 18:13:50+0800, Dianlong Li wrote:
> The sd3078 is a combination RTC and SRAM device with I2C interface.
> 
> Signed-off-by: Dianlong Li <long17.cool@163.com>
> ---
>  MAINTAINERS              |    6 ++
>  drivers/rtc/Kconfig      |    9 ++
>  drivers/rtc/Makefile     |    1 +
>  drivers/rtc/rtc-sd3078.c |  232 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 248 insertions(+)
>  create mode 100644 drivers/rtc/rtc-sd3078.c
> 

All applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
