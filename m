From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 1/2] soc: ti: display firmware file name as part of
 boot log
Date: Wed, 9 Sep 2015 12:38:13 -0400
Message-ID: <55F06075.6050405@ti.com>
References: <1441403199-10936-1-git-send-email-m-karicheri2@ti.com> <55EA673F.8010904@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EA673F.8010904-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/04/2015 11:53 PM, santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org wrote:
> On 9/4/15 5:46 PM, Murali Karicheri wrote:
>> To help the user, print the PDSP file name as part of
>> knav_queue_load_pdsp(). This will be useful for users to know what
>> version of the firmware is loaded to PDSP. Also update the
>> document for the location of the QMSS accumulator PDSP firmware.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>> ---
>
> Looks fine. Will pick both the patches.
>

Thanks Santhosh.

Is there a requirement to add the firmware to linux-firmware.git. Right 
now I have provided link to ti git repo that has the firmware. I have 
the patch ready in case this is required. Do you know?

Murali
> Regards,
> Santosh
>
>


-- 
Murali Karicheri
Linux Kernel, Keystone
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
