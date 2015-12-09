From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 16:22:40 -0800
Message-ID: <CALAqxLXqoEb7VjDpGM8JgKtb=dKgWcpaKbgGzGTOCBu44w-Dfw@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<20151208220722.GG4000@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151208220722.GG4000-P9SbAA3LsXe39TS3lRcy0mP6iJigPa5YXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 2:07 PM, Bjorn Andersson
<bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
> On Tue 08 Dec 13:29 PST 2015, John Stultz wrote:
>
>> This patch adds a basic driver to allow for commands like
>> "reboot bootloader" and "reboot recovery" to communicate this
>> reboot-reason to the bootloader.
>>
>> This is commonly done on Android devices, in order to reboot
>> the device into fastboot or recovery mode. It also supports
>> custom OEM specific commands, via "reboot oem-<value>".
>>
>> This driver pulls the phys memory address from DT as well as
>> the magic reason values that are written to the address for
>> each mode.
>>
>> For an example, this patch also adds the DT support for
>> the nexus7 device via its dts (which is not yet upstream).
>>
>> Thoughts and feedback would be appreciated!
>>
>
> Good to see some work on this, I want it too :)
>
> I do however think this is Qualcomm specific in its implementation, so
> adding Andy and linux-arm-msm.

Right. So this is based off of the qualcomm implementation. But I'm
hoping to reuse it for other hardware.


> [..]
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> index 5183d18..ee5dcb7 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> @@ -282,6 +282,15 @@
>>                       };
>>               };
>>
>> +             reboot_reason: reboot_reason@2a03f65c {
>> +                     compatible              = "reboot_reason";
>> +                     reg                     = <0x2A03F65C 0x4>;
>> +                     reason,none             = <0x77665501>;
>> +                     reason,bootloader       = <0x77665500>;
>> +                     reason,recovery         = <0x77665502>;
>> +                     reason,oem              = <0x6f656d00>;
>> +             };
>> +
>
> This address refers to IMEM, which is shared with a number of other
> uses. So I think we should have a simple-mfd (and syscon) with this
> within.

Errr.. I'm going to have to read up there. I'm not super familiar with
any of those drivers, so I'll try to see how exactly they would map in
here.


> I like the fact that you don't hard code the magics in the
> implementation, as I've seen additions from multiple places - so perhaps
> it should be made even more flexible.
>
> OMAP seems to use strings here instead of magics, but the delivery
> mechanism looks to be the same. But I think of this as Qualcomm
> specific.

Yea. This is good feedback. EFI bootloaders have their own
implementations as well.  I suspect we'll need a few different driver
"types" to handle these differences, ie: value vs string.

I'll maybe extend the compatible string to make it clear that this is
a "value" style, and we can extend it with a string type later if
folks care?

>> +static int reboot_reason(struct notifier_block *nb, unsigned long action,
>> +                                                             void *data)
>> +{
>> +     char *cmd = (char *)data;
>> +     long reason = reasons[NONE];
>> +
>> +     if (!reboot_reason_addr)
>> +             return NOTIFY_DONE;
>> +
>> +     if (cmd != NULL) {
>> +             if (!strncmp(cmd, "bootloader", 10))
>> +                     reason = reasons[BOOTLOADER];
>> +             else if (!strncmp(cmd, "recovery", 8))
>> +                     reason = reasons[RECOVERY];
>> +             else if (!strncmp(cmd, "oem-", 4)) {
>> +                     unsigned long code;
>> +
>> +                     if (!kstrtoul(cmd+4, 0, &code))
>> +                             reason = reasons[OEM] | (code & 0xff);
>> +             }
>> +     }
>
> In the case where we didn't find a match you should write the "normal"
> reason here, otherwise I think you will end up in recovery when recovery
> issues a reboot (in Android that is).

So, reason is initialized to NONE here. So that should handle this,
no? Or do you mean something more subtle?

>
>> +
>> +     if (reason != -1)
>> +             writel(reason, reboot_reason_addr);
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static int reboot_reason_probe(struct platform_device *pdev)
>> +{
>> +     struct resource *res;
>> +     u32 val;
>> +     int i;
>> +
>> +     /* initialize the reasons */
>> +     for (i = 0; i < MAX_REASONS; i++)
>> +             reasons[i] = -1;
>> +
>> +     /* Try to grab the reason io address */
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     reboot_reason_addr = devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(reboot_reason_addr))
>> +             return PTR_ERR(reboot_reason_addr);
>> +
>
> Please acquire this memory from a syscon (preferably the the parent
> simple-mfd).

Ok. Will look into this. Sorry for my unfamiliarity with these details.


>> +     /* initialize specified reasons from DT */
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
>> +             reasons[NONE] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
>> +             reasons[BOOTLOADER] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
>> +             reasons[RECOVERY] = val;
>> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
>> +             reasons[OEM] = val;
>
> I would like for this to be less hard coded.

Any tips here on how to do so?

thanks for all the feedback!
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
