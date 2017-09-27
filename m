From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: cadence-quadspi: Add runtime PM
 support
Date: Wed, 27 Sep 2017 16:18:49 +0530
Message-ID: <7237fa9e-4d3a-8a82-10c6-76737c23ed6f@ti.com>
References: <20170924105924.23923-1-vigneshr@ti.com>
 <20170924105924.23923-6-vigneshr@ti.com>
 <3a1160f9-a0ae-c84c-d209-af97c3c3b0f6@gmail.com>
 <4ee69ea4-14cc-4305-bf3f-8fe76d43bf6b@ti.com>
 <fa700cdf-f0b5-779b-4f38-3138a7612cc2@gmail.com>
 <038919d3-ff32-d0a7-4c0a-3be16436052d@ti.com>
 <e4ad5d80-9093-b667-f0a5-d3105be4e8cf@gmail.com>
 <alpine.DEB.2.20.1709251538420.2472@mgerlach-VirtualBox>
 <fdfe29bf-ff46-7542-8e36-e8e45e1ca85f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fdfe29bf-ff46-7542-8e36-e8e45e1ca85f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthew,

On Tuesday 26 September 2017 05:19 AM, Marek Vasut wrote:
[...]
>>>> Ok thanks! Do you know if pm_runtime_get_sync() can enable clocks for
>>>> QSPI on SoCFPGA or if clk_prepare_enable() is needed? Just trying to see
>>>> if its possible to get rid of clk_*() calls in favor of pm_*() calls.
>>>
>>> Not of the top of my head, sorry. +CC Matthew, he should know.
>>
>> I am not an expert at the clock framework nor the power management, but I
>> did ask around a bit.  No one I asked was planning to change the clk_*()
>> calls to pm_*() call, but the feedback was that it would be a good idea.
> 
> The question is, if we do the replacement, will it break on socfpga ?
> A quick test might be useful.
> 

yes, a quick qspi test with clk_prepare_enable() replaced by pm_*() calls
like below patch would be helpful:


diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 53c7d8e0327a..7ad3e176cc88 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -34,6 +34,7 @@
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
 #include <linux/timer.h>
+#include <linux/pm_runtime.h>
 
 #define CQSPI_NAME                     "cadence-qspi"
 #define CQSPI_MAX_CHIPSELECT           16
@@ -1206,11 +1207,8 @@ static int cqspi_probe(struct platform_device *pdev)
                return -ENXIO;
        }
 
-       ret = clk_prepare_enable(cqspi->clk);
-       if (ret) {
-               dev_err(dev, "Cannot enable QSPI clock.\n");
-               return ret;
-       }
+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
 
        cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
 
 



-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
