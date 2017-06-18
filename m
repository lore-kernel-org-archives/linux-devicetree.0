From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 01/28] dt-bindings: Add vendor prefix for Actions Semi
Date: Sun, 18 Jun 2017 20:46:33 +0200
Message-ID: <73b532f1-2339-c660-53fe-2bb25a265c22@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-2-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Thomas Liau <thomas.liau@actions-semi.com>
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, devicetree@vger.kernel.org, 96boards@ucrobotics.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:53 schrieb Andreas Färber:
> Actions Semiconductor was listed on NASDAQ as ACTS until Dec 16, 2016.
> 
> Cc: mp-cs@actions-semi.com
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v3 -> v4: Unchanged
>  
>  v2 -> v3:
>  * Fixed sort order after rename
>  
>  v1 -> v2:
>  * Reverted from "acts" to "actions" (cf. IAP140 "mrvl" vs. "marvell")
>  
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

With still no Acked-by or other reply from Actions, I have now applied
this patch to linux-actions.git v4.13/dt branch:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.13/dt

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
