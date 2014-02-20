From: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] usb: chipidea: msm: Clean and fix glue layer driver
Date: Wed, 19 Feb 2014 20:07:21 -0800
Message-ID: <CA+bK7J5LrV-Dh1tNhEwhJ4y+XbkDeQkwVWoUYFX46X9uV1HdUQ@mail.gmail.com>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
	<CA+bK7J7D1bgehNMaMtWWggZ5KDBfZ8LK0bEYUARmc8OD3wa89Q@mail.gmail.com>
	<1392821911.17130.63.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392821911.17130.63.camel@iivanov-dev>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks very much.  I will try out the things you mention and let you
know if I make progress.
 -- Tim


On Wed, Feb 19, 2014 at 6:58 AM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi Tim,
>
> On Tue, 2014-02-18 at 22:21 -0800, Tim Bird wrote:
>> Ivan,
>>
>> I'm having tremendous problems getting this driver to initialize.  For
>> some reason, I can't get the driver to actually transition the
>> hardware into peripheral mode.  At first I was getting a lot of probe
>> deferrals, based on not finding the regulators early enough in the
>> boot, and I thought it was an issue with the gadget drivers loading
>> before the driver could complete its setup.  However, I switched
>> everything to loading via modules, and now have less probe deferrals,
>> but I still can't get the driver to activate.
>
> My understanding for gadget drivers is that you can have only one
> of them active in particular time. When compiled in kernel you can
> chose only one of them, also you can have only one module (function)
> loaded.
>
>
>>   I see zero interrupts.
>
> Right, I think that we will not see interrupts until we have
> SPMI drivers which could control PMIC chip, PMIC is responsible
> to do ID line detection and generate IRQ to APQ/MSM chip.
>
>> In particular the routine hw_device_state (which turns on interrupts
>> in the controller) is never called, because I can't get
>> msm_otg_start_peripheral to actually kick the hardware.
>>
>
> OTG state machine is not used at all. This phy-"otg" driver is
> working only in "peripheral" mode, because of missing PMIC
> communication.
>
> The only callback which you could see to be executed is
> struct usb_otg::set_peripheral(), when you load gadget driver.
>
>
> <snip>
>
> (Would you mind sharing your config?).
>
> Sure. Attached.
>
>
>> I tried configuring the qcom,otg-control for user controlled mode
>> setting (via debugfs),
>
> Never testes this. It was there before.
>
>>
>> My kernel is based on an internal Sony 3.13-rc6 kernel with clock and
>> regulator patches applied, as well as your phy-msm-usb.c patches from
>> November and your chipidea patches from yesterday.
>
> You will need also 4th chipidea patch[1]. I have dropped it, because
> I will like to upstream PHY driver changes first. They are depended
> anyway.
>
> To reduce dependency to other drivers, I could recommend you to
> use Zero gadget driver. It should be enough to test USB stack,
> where APQ device will be peripheral and development workstation
> will be a host[2].
>
>
> # cat zero.sh
> #!/bin/sh
> cd /lib/modules/$(uname -r)/kernel/drivers/usb/gadget
> insmod ./libcomposite.ko
> insmod ./usb_f_ss_lb.ko
> insmod ./g_zero.ko
>
>
>> [   22.454287] [<c022afd8>] (warn_slowpath_common+0x68/0x88) from
>> [<c022b08c>] (warn_slowpath_fmt+0x30/0x40)
>> [   22.463060] [<c022b08c>] (warn_slowpath_fmt+0x30/0x40) from
>> [<bf005024>] (msm_otg_probe+0x24/0x904 [phy_msm_usb])
>> [   22.472703] [<bf005024>] (msm_otg_probe+0x24/0x904 [phy_msm_usb])
>
> This is know non-fatal issue. I will try to see how to fix it.
>
>
> Regards,
> Ivan
>
> [1] usb: chipidea: msm: Use USB PHY API to control PHY state
> [2] http://www.linux-usb.org/usbtest/
>
>



-- 
 -- Tim Bird
Senior Software Engineer, Sony Mobile
Architecture Group Chair, CE Workgroup, Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
