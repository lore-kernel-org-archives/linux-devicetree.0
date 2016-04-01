From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB PHY
Date: Fri, 1 Apr 2016 22:49:25 +0300
Message-ID: <56FED0C5.1000603@cogentembedded.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
 <56FE74AC.6080303@ti.com> <20160401144510.GA6264@uda0271908>
 <56FE9B8F.7050605@lechnology.com> <20160401161931.GC6264@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160401161931.GC6264@uda0271908>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/01/2016 07:19 PM, Bin Liu wrote:

>>>>> +EXPORT_SYMBOL_GPL(da8xx_usb20_phy_set_mode);
>>>>
>>>> Don't prefer export symbols from PHY driver. That'll create unnecessary
>>>> dependencies between the controller and the PHY.
>>>
>>> Agreed.
>>>
>>>>
>>>> I think it'll be better to create a new attribute and use it?
>>>
>>> Another simpler option is to not support _set_mode() for DA8xx, and the
>>> phy driver set the otgmode bit in probe() based on dr_mode of the
>>> controller.
>>>
>>> Regards,
>>> -Bin.
>>>
>>
>> This certainly works for my particular use case, however, Sergei
>> Shtylyov, who wrote the da8xx musb glue layer originally, seemed to
>> recall in his review of the patch series that this really is
>> necessary for OTG mode to work properly.
>
> I don't know much about the usb module on DA8xx, but it seems to me that
> _set_mode() has nothing to do with OTG mode.

    No, it does.

> musb_core only calls
> _set_mode() in two places - 1) sysfs: musb_mode_store(), 2) init:
> musb_init_controller(). None of them should be related to OTG mode.

    Both these places do select OTG mode.

> Regards,
> -Bin.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
