From: Mayuresh Chitale <mchitale-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: dt-bindings: Add the binding info for
 APM X-Gene PCIe DMA driver
Date: Wed, 7 Jan 2015 16:12:36 +0530
Message-ID: <CAL-zptOMnD_c_HPOke_27O4bfmg_W7jgfBNvUccykWneyv0JUw@mail.gmail.com>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
	<1420608537-12296-3-git-send-email-mchitale@apm.com>
	<2098807.VbUeJKFBVr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2098807.VbUeJKFBVr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for you comments. Please see inline.

--Mayuresh.

On Wed, Jan 7, 2015 at 2:00 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 07 January 2015 10:58:55 Mayuresh Chitale wrote:
>> +Required properties:
>> +- compatible :
>> +       - "apm,xgene-pciedma" for pcie DMA on X-Gene SoC
>> +- interrupts : An interrupt-specifier which is used to handle DMA interrupts
>> +
>> +Examples:
>> +               pciedma0 {
>> +                       status = "disabled";
>> +                       compatible = "apm,xgene-pciedma";
>> +                       reg = < 0x0 0x1F2B0154 0x0 0xC
>> +                               0x0 0x1F2B0058 0x0 0x8>;
>> +                       reg-names = "cfg", "intr";
>> +                       interrupts = <0x0 0xC6 0x4>;
>> +               };
>>
>
> The example contains a "reg-names" property that is neither listed
> as optional nor mandatory, and that is not used by the driver.
> Bettter drop that from the example.
>
> The 'reg' property is not documented in the binding. Please
> document which register each index refers to.

Ok. I will make those changes.

>
>         Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
