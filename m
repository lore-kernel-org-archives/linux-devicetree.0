From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: rtc: add ABEOZ9 support
Date: Mon, 18 Feb 2019 22:35:37 +0100
Message-ID: <20190218213537.GZ10129@piout.net>
References: <20190218202930.28140-1-panfilov.artyom@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190218202930.28140-1-panfilov.artyom@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artem Panfilov <panfilov.artyom@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 18/02/2019 23:29:29+0300, Artem Panfilov wrote:
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This was not necessary as the maintainer can collect tags in the same
thread as the patch.

> ---

As Rob explained, you should add a changelog here.

>  Documentation/devicetree/bindings/rtc/rtc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
> index 7c8da6926095..0ac93f2dcedc 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> @@ -39,6 +39,7 @@ possibly an interrupt line.
>  Compatible		Vendor / Chip
>  ==========		=============
>  abracon,abb5zes3	AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
> +abracon,abeoz9		AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
>  dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
>  dallas,ds1672		Dallas DS1672 Real-time Clock
>  dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
> -- 
> 2.19.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
