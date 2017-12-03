From: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: configs: keystone_defconfig: Enable few
 peripheral drivers
Date: Sat, 2 Dec 2017 20:00:09 -0800
Message-ID: <fb0c662b-d462-c663-7cf0-443ace3565ba@oracle.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
 <20171123075154.3938-7-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171123075154.3938-7-vigneshr-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/22/17 11:51 PM, Vignesh R wrote:
> Enable drivers for QSPI, LEDS, gpio-decoder that are present on 66AK2G EVM
> and 66AK2G ICE boards.
> 
> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> ---
Please submit a patch also to enable all these peripherals
in multi-v7 config. Just enable all remainder
options enabled in keystone config also in multi-v7.

Am pushing this series to next now.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
