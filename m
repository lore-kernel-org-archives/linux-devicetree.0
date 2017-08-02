From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/7] K2G: Add QSPI support
Date: Wed, 2 Aug 2017 11:22:07 +0530
Message-ID: <00b2b8b8-3f3d-d563-bebc-f37f67362aa0@ti.com>
References: <20170801045434.8733-1-vigneshr@ti.com>
 <29c0e8ec-1f9f-cfc9-2d0e-e4d31890b699@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29c0e8ec-1f9f-cfc9-2d0e-e4d31890b699-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 01 August 2017 11:31 PM, Santosh Shilimkar wrote:
> On 7/31/2017 9:54 PM, Vignesh R wrote:
>> This series adds support for Cadence QSPI for 66AK2G SoC. The first
>> three patches enhance the cadence-quadspi driver to support loopback
>> clock and pm_runtime and tweaks for 66AK2G SoC. Remaining patches add
>> DT nodes and enable the driver in defconfig.
>>
>> Tested on 66AK2G GP and ICE boards.
>>
>> Vignesh R (7):
>>    mtd: spi-nor: cadence-quadspi: add a delay in write sequence
>>    mtd: spi-nor: cadence-quadspi: Add support to enable loopback clock
>>      circuit
>>    mtd: spi-nor: cadence-quadspi: Add runtime PM support
>>    ARM: dts: keystone-k2g: Add QSPI DT entry
>>    ARM: dts: keystone-k2g-evm: Add QSPI node
>>    ARM: dts: keystone-k2g-ice: Add QSPI node
>>    ARM: configs: keystone: Enable Cadence QSPI driver
>>
> Please separate dts and driver patches in its own series
> while posting next time since they go throgh different
> subsystem trees. Get your driver patch queed
> first before adding DTS and enabling config option.

Okay. I thought it would be easy for you to know when driver patches are
queued, if DTS changes are part of the same series. Will post DT nodes
separately from next time or if I need to do a v2 of this series.

-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
