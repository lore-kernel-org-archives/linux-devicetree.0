From: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] Add DSP DT nodes on Keystone platforms
Date: Sun, 30 Jul 2017 20:53:05 -0700
Message-ID: <415d8904-b2cd-692e-da53-7ce75209d051@oracle.com>
References: <20170728231918.16778-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170728231918.16778-1-s-anna-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/28/17 4:19 PM, Suman Anna wrote:
> Hi Santosh,
> 
> The following series adds the DT nodes for the DSP devices present
> on the Keystone2 66AK2H/K, 66AK2L and 66AK2E SoCs. They are disabled
> in the base dts files, and enabled in the corresponding board files
> alongside an added common reserved CMA pool that is used by all the
> DSP devices. The bindings and driver support were added to mainline
> in 4.13-rc1, and this series adds the dt portions. Nodes are added
> as per bindings in
> Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> 
> Validation done on K2HK EVM, K2L EVM and K2E EVM. Supported features
> include basic load/boot (tested with rpmsg_client_sample) and Error
> Recovery (after reverting a patch merged in 4.13-rc1 that has caused
> a kernel crash, see [1]). Functionality with CMA nodes from HighMem
> require a patch in the virtio_rpmsg_bus core [2].
> 
Applied !!

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
