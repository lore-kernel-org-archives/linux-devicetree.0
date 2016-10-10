From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: keystone-k2*: Increase SPI Flash
 partition size for U-Boot
Date: Mon, 10 Oct 2016 09:01:58 -0700
Message-ID: <d1a4b59e-5524-9851-425e-5e86e05a593c@oracle.com>
References: <20161010141141.21333-1-vigneshr@ti.com>
 <20161010143144.GB1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161010143144.GB1041-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vignesh,

On 10/10/2016 7:31 AM, Russell King - ARM Linux wrote:
> On Mon, Oct 10, 2016 at 07:41:41PM +0530, Vignesh R wrote:
>> U-Boot SPI Boot image is now more than 512KB for Keystone2 devices and
>> cannot fit into existing partition. So, increase the SPI Flash partition
>> for U-Boot to 1MB for all Keystone2 devices.
>>
>> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
>> ---
>>
>> This was submitted to v4.9 merge window but was never picked up:
>> https://patchwork.kernel.org/patch/9135023/

Another point is, if you want me to pick your patch, please copy
me next time :-). AFAIK, am seeing this patch in my inbox first time.

>
> I think you need to explain why it's safe to change the layout of the
> flash partitions like this.
>
> - What is this "misc" partition?
>
> - Why is it safe to move the "misc" partition in this way?
>
> - Do users need to do anything with data stored in the "misc" partition
>   when changing kernels?
>
> If the "misc" partition is simply unused space on the flash device, why
> list it in DT?
>
Thanks Russell. Yes, above clarification would be good to get first.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
