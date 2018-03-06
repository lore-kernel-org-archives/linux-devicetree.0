From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v3 2/4] rtc: isl1208: switch to rtc_register_device
Date: Tue, 6 Mar 2018 21:20:36 +0100
Message-ID: <20180306202036.GH3035@piout.net>
References: <1520246373-19023-1-git-send-email-Denis.Osterland@diehl.com>
 <1520246373-19023-3-git-send-email-Denis.Osterland@diehl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520246373-19023-3-git-send-email-Denis.Osterland@diehl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Denis OSTERLAND <denis.osterland@diehl.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mgr@pengutronix.de" <mgr@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 05/03/2018 at 10:43:53 +0000, Denis OSTERLAND wrote:
> From: Denis Osterland <Denis.Osterland@diehl.com>
> 
> Fix possible race condition.
> It is not allowed to return with an error code after RTC is registered.
> 
> Suggested-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Denis Osterland <Denis.Osterland@diehl.com>
> Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/rtc/rtc-isl1208.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
