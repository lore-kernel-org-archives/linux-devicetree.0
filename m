From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: Add LEGO MINDSTORTMS EV3 dts
Date: Wed, 26 Oct 2016 20:30:27 -0500
Message-ID: <38a3a10c-a269-6a9f-305c-7d38ec9b839b@lechnology.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-6-git-send-email-david@lechnology.com>
 <b0022fad-a96e-86d4-71ba-2b803e5421fe@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b0022fad-a96e-86d4-71ba-2b803e5421fe-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2016 06:58 AM, Sekhar Nori wrote:
> On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
>> This adds a device tree definition file for LEGO MINDSTORMS EV3.
>
> Thanks for the patch!
>
>>
>> What is working:
>>
>> * Pin muxing
>> * MicroSD card reader
>> * UART on input port 1
>>
>> What is partially working:
>>
>> * Buttons - working after GPIO fix
>> * LEDs - working after GPIO fix
>> * Poweroff/reset - working after GPIO fix
>
> Is the GPIO fix something that will go in v4.9-rc cycle ?
>

FYI, the fix is in linux-gpio/fixes now.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
