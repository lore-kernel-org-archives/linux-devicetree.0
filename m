From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: add support for AMS AS3722 PMIC
Date: Tue, 17 Sep 2013 17:52:46 +0530
Message-ID: <52384996.8050704@nvidia.com>
References: <1379400338-20704-1-git-send-email-ldewangan@nvidia.com> <1379400338-20704-2-git-send-email-ldewangan@nvidia.com> <20130917112444.GU21013@sirena.org.uk> <5238450F.6090303@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5238450F.6090303-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 17 September 2013 05:33 PM, Laxman Dewangan wrote:
> On Tuesday 17 September 2013 04:54 PM, Mark Brown wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, Sep 17, 2013 at 12:15:35PM +0530, Laxman Dewangan wrote:
>>
>>> +MFD driver adds following mfd devices with their compatible values:
>>> +as3722-gpio: The compatible value of this as3722 gpio driver is
>>> +         "ams,as3722-gpio";
>>> +as3722-regulator: The compatible value of this as3722 regulator 
>>> driver is
>>> +         "ams,as3722-regulator";
>>> +as3722-rtc: The compatible value of this as3722 rtc driver is
>>> +         "ams,as3722-rtc";
>>> +as3722-adc: The compatible value of this as3722 adc driver is
>>> +         "ams,as3722-adc";
>>> +as3722-power-off: he compatible value of this as3722 power off 
>>> driver is
>>> +         "ams,as3722-power-off".
>> Personally I find this to be exposing implementation details of Linux -
>> unless there is something reusable about the binding that'd allow it to
>> be used to describe the contents of the chip the subnodes really aren't
>> adding any information that wasn't present from just knowing the parent
>> chip.  If there were relocatable IPs it'd be a bit different.
>
> Ok, then can we fix the the sub node name and parse these when adding 
> mfd devices and set the pdev->dev.of_node of child devices.
> Like
> parent_node {
>     ...
>     child1_node {
>         ...
>     };
>
>     child1_node {
Sorry, just wanted to say child2_node here.

> ...
>     };
> };
>
>
> and fix the node name of child1 and child2 and have this as part of 
> mfd-cell's of_node_name.
> So when we add the mfd devices, we look for these fixed name and if 
> matches then set the dev->of_node for that child sub device.
>
> This will avoid the code for getting child node pointer from parent 
> node in each driver. We fix the child node name in any case.
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
