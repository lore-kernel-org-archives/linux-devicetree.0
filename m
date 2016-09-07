From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/5] Use mmio-sram driver for Keystone MSMC RAM
Date: Wed, 7 Sep 2016 09:11:05 -0700
Message-ID: <d797bb0d-41b5-45a7-6faf-95baaab0215b@oracle.com>
References: <20160901225846.31058-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160901225846.31058-1-s-anna-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Suman,

On 9/1/2016 3:58 PM, Suman Anna wrote:
> Hi,
>
> The Keystone 2 family of SoCs have an on-chip RAM called the
> Multicore Shared Memory (MSM) RAM. This RAM is accessible through
> the Multicore Shared Memory Controller (MSMC). This series represents
> these on-chip RAMs as sram nodes so that the memory allocations
> can be managed by the in-kernel mmio-sram driver.
>
> The first 4 patches adds the basic SRAM nodes on each of the SoCs,
> and the last patch enables the generic on-chip SRAM driver for
> keystone defconfig.
>
The series looks good in general but I would like to understand
the users of this memory in kernel. Is that going to be posted
as a follow up patch ? Is the Power controller going to make
use of this SRAM for PM code ?

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
