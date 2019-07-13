Return-Path: <SRS0=DKhf=VK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39297 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfGMNZA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jul 2019 09:25:00 -0400
Date: Sat, 13 Jul 2019 06:24:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] device-tree: bindinds: add NXP PCT2075 as compatible
 device to LM75
Message-ID: <20190713132458.GA13733@roeck-us.net>
References: <20190711124504.7580-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711124504.7580-1-daniel@zonque.org>
Sender: devicetree-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 11, 2019 at 02:45:03PM +0200, Daniel Mack wrote:
> The PCT2075 is compatible to other chips that are already handled by
> the LM75 driver.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> index 12d8cf7cf592..bfb22b249708 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> @@ -15,6 +15,7 @@ Required properties:
>  		"maxim,max31725",
>  		"maxim,max31726",
>  		"maxim,mcp980x",
> +		"nxp,pct2075",
>  		"st,stds75",
>  		"st,stlm75",
>  		"microchip,tcn75",
