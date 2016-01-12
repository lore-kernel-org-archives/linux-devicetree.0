From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: Update the APM X-Gene SoC EDAC DTS
 binding for missing RB
Date: Tue, 12 Jan 2016 15:24:41 -0800
Message-ID: <CAPw-ZTmuavkEd0_7W+86m_RQHZHGCwWr4dRNCxjrgBPLa_Qg0w@mail.gmail.com>
References: <1452639900-30919-1-git-send-email-lho@apm.com>
	<1452639900-30919-2-git-send-email-lho@apm.com>
	<4027351.WdK3AXxgBQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4027351.WdK3AXxgBQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-edac <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

>> --- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>> +++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>  - regmap-mcba          : Regmap of the MCB-A (memory bridge) resource.
>>  - regmap-mcbb          : Regmap of the MCB-B (memory bridge) resource.
>>  - regmap-efuse         : Regmap of the PMD efuse resource.
>> +- regmap-rb            : Regmap of the register bus resource.
>>  - reg                  : First resource shall be the CPU bus (PCP) resource.
>>  - interrupts            : Interrupt-specifier for MCU, PMD, L3, or SoC error
>>                           IRQ(s).
>> @@ -64,6 +65,11 @@ Example:
>>                 reg = <0x0 0x1054a000 0x0 0x20>;
>>         };
>>
>> +       rb: rb@7e000000 {
>> +               compatible = "apm,xgene-rb", "syscon";
>> +               reg = <0x0 0x7e000000 0x0 0x10>;
>> +       };
>> +
>>         edac@78800000 {
>>                 compatible = "apm,xgene-edac";
>>
>
> When you add a property, please list that as "optional", not "required",
> to ensure that the old dtb files still conform to the binding.
>
> In the driver, make sure it is not a fatal error when the property is
> missing and the driver can keep working without it.

>From my view, this is required. Otherwise, the error condition will
NOT be cleared correctly and will get constant interrupt. Though, for
compatibility, we can make it optional but system will be unusable
should such error occurred. Though, it would be rare or with bad FW. I
will fix in the next version by making it optional such as it will
still probe correctly with older DT binding.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
