From: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Mon, 21 May 2012 12:47:48 -0700
Message-ID: <4FBA9BE4.7020303@grid-net.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <CAOMZO5AcP2cAAkuFPJn3Xp5NuR+JG4hDO7Ehq5H-V6PCy4DwNA@mail.gmail.com> <201205212141.52171.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205212141.52171.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/21/2012 12:41 PM, Marek Vasut wrote:
> Dear Fabio Estevam,
>
>> Hi Richard,
>>
>> On Mon, May 21, 2012 at 6:23 AM, Richard Zhao
>>
>> <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>  wrote:
>>> The work is based on  ci13xxx rework done by Alexander Shishkin.
>>>
>>> Status:
>>>   - this version only support host
>>>   - usbotg controler works at host role
>>>
>>> Changes since V1:
>>>   - Merge the work of Marek
>>>   - re-implement connect change notify
>>>   - imx6q: move part of code to clk
>>>   - imx6q: add config-on-boot gpios
>> Can you please also add the driver into the defconfig files?
>>
>> What about the existing USB host drivers for mx27/mx31/mx35/mx25/mx35?
>>
>> Is the idea to switch to drivers/usb/chipidea/host.c too?
> I think the core is the same, it's just the ci13xxx-imx driver that'd need to be
> written differently for these

So that means driver that you did are not going to be up streamed for 
mx28/mxs? And those interested should be tracking this patch set?

-Subodh
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
