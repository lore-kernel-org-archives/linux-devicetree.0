From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small fixes
Date: Mon, 25 Mar 2013 10:11:15 -0300
Message-ID: <CAOMZO5ArDLKDLEzhYc7EP2CNQGcT=vO7ctbiEsjzsGs+EaT7Dw@mail.gmail.com>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
	<20121128025217.GC18593@nchen-desktop>
	<87ip6mor1e.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ip6mor1e.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On Thu, Jan 24, 2013 at 7:42 AM, Alexander Shishkin
<alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>
>> On Tue, Nov 27, 2012 at 05:16:55PM +0100, Michael Grzeschik wrote:
>>> Nearly every SoC from Freescale has this non-core usb registers. This series
>>> adds support for more users of this driver.
>>>
>>> This series is based on Peter Chen's work. Its needed to merge his master branch
>>> before applying this series:
>>>
>>> https://github.com/hzpeterchen/linux-usb.git
>>
>> I have tested it at i.mx6q sabrelite board, it works good.
>>
>> I have pushed your commit to my git, please cc me
>> your coming chipidea patches, thanks.
>>
>> Alex, please add:
>>
>> Reviewed-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Tested-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Looks good, queueing this one for submission.

Could you please let us know what is preventing this series to be applied?

Thanks,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
