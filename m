From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Fri, 09 May 2014 10:18:57 +0200
Message-ID: <536C8F71.5040604@redhat.com>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com> <1399483554-8824-4-git-send-email-boris.brezillon@free-electrons.com> <20140508110205.GB5767@lee--X1> <536BE366.8080907@free-electrons.com> <20140509071246.GE5767@lee--X1> <536C84F6.2050701@redhat.com> <20140509080807.GH5767@lee--X1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBJ47WKNQKGQE7BVL4EQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140509080807.GH5767@lee--X1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?B?RW1pbA==?= =?UTF-8?B?aW8gTMOzcGV6?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05/09/2014 10:08 AM, Lee Jones wrote:
>>>>>> +static struct platform_driver sun6i_prcm_driver = {
>>>>>> +	.driver = {
>>>>>> +		.name = "sun6i-prcm",
>>>>>> +		.owner = THIS_MODULE,
>>>>>> +		.of_match_table = sun6i_prcm_dt_ids,
>>>>>> +	},
>>>>>> +	.probe = sun6i_prcm_probe,
>>>>> You need a .remove() call-back.
>>>>
>>>> This driver cannot be compiled as module (see the Kconfig definition)
>>>> and the devices are not hotpluggable, as a result a probed device will
>>>> never be removed.
>>>>
>>>> Do you still want me to implement the remove function ?
>>>
>>> .remove() also be run on shut down.
>>
>> That is not true, if your device needs to do anything special at shutdown
>> you need to add a shutdown callback. Devices are kept as is (not torn down)
>> on shutdown.
> 
> Ah okay, I'll bow to your knowledge.  So there's no reason for this
> driver to ever call mfd_remove_devices() then?

No, this is an integral part of the SOC, which never gets removed in any way.

Regards,

Hans
