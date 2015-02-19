From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: amba uarts - arm type uarts fifo size provided by device tree
Date: Wed, 18 Feb 2015 19:48:39 -0500
Message-ID: <54E532E7.8090008@linaro.org>
References: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <20150218190601.GI29429@leverpostej> <54E4E916.1010009@linaro.org> <20150219003409.GX8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150219003409.GX8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/18/2015 07:34 PM, Russell King - ARM Linux wrote:
> On Wed, Feb 18, 2015 at 02:33:42PM -0500, Jorge Ramirez-Ortiz wrote:
>> On 02/18/2015 02:06 PM, Mark Rutland wrote:
>>> Hi,
>>>
>>> Please Cc lakml for patches in this area in future.
>>>
>>> On Wed, Feb 18, 2015 at 06:53:11PM +0000, Jorge Ramirez-Ortiz wrote:
>>>> [PATCH 1/2] Documentation: bindings: add optional fifo size property
>>>> [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present
>>>>
>>>>
>>>> These patches aim at resolving an issue present on some of the amba pl011
>>>> uarts.  
>>> Which systems are affected? Neither of your two patches add the property
>>> to any dts file.
>>
>> yes, the system affected is still under revision (I should have mentioned)
>> https://lkml.org/lkml/2015/2/5/144
> Sorry, I can't follow that thread.  What FIFO size do your UARTs have?
> What is the full ID of the UARTs?
>

I just added a temporary printk to my logs for clarity

[    3.328845] name = f7111000.uart, id = 0x241011, amba_rev = 2, fifo size = 64

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
