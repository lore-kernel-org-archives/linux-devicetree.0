From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Add support for the rockchip mmc clock phases using the framework
Date: Fri, 28 Nov 2014 00:47:14 +0100
Message-ID: <3766029.50NHsEnjv7@diego>
References: <1417051827-12564-1-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417051827-12564-1-git-send-email-amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, addy ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 26. November 2014, 17:30:25 schrieb Alexandru M Stan:
> For now all I have is the getter and setter for the phase, nothing that uses
> it (that is ready). You can test the getter like this:
> localhost ~ # cat /sys/kernel/debug/clk/clk_summary|grep sample -C 1
> sclk_sdio1                            0            0    24000000          0
> 0 sdio1_sample                       0            0    12000000          0
> 0 sdio1_drv                          0            0    12000000          0
> 90 --
> 	sclk_sdmmc                      1            1   297000000          0 0
> 		sdmmc_sample                 0            0   148500000          0 
134
> 		sdmmc_drv                    0            0   148500000          0 
90
> --
> 	sclk_sdio0                      1            1   100000000          0 0
> 		sdio0_sample                 0            0    50000000          0 0
> 		sdio0_drv                    0            0    50000000          0 
90
> 	sclk_emmc                       1            1   100000000          0 0
> 		emmc_sample                  0            0    50000000          0 0
> 		emmc_drv                     0            0    50000000          0 
180
> 
> Next thing that will come is some dts changes that will make use of these
> new clocks, and eventually mmc code will be changed to tune with these
> clocks. You can see some WIP on
> https://chromium-review.googlesource.com/#/c/227240

I've applied both patches to my clk branch.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
