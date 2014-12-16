From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCHv1] rtc: bcm-iproc: Add support for Broadcom iproc rtc
Date: Tue, 16 Dec 2014 12:05:08 -0800
Message-ID: <54909074.2070804@broadcom.com>
References: <1418757750-3628-1-git-send-email-arun.ramamurthy@broadcom.com> <7947905.aK8KkUx4sY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7947905.aK8KkUx4sY@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Arun Ramamurthy <arunrama-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 14-12-16 11:42 AM, Arnd Bergmann wrote:
> On Tuesday 16 December 2014 11:22:30 arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org wrote:
>> +       rtc: iproc_rtc@0x03026000 {
>> +               compatible = "brcm,iproc-rtc";
>> +               reg =   spru_bbl:               <0x03026000 0xC>,
>> +                       crmu_pwr_good_status:   <0x0301C02C 0x14>,
>> +                       crmu_bbl_auth:          <0x03024C74 0x8>;
>> +               interrupts = spru_rtc_periodic: <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
>> +                            spru_alarm:        <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>
> The reg properties look really random, could it be that the registers
> are really part of some other device that contains multiple functions?
>
This RTC block is on a battery backed logic island and is accessed 
indirectly using the spru_bbl registers. The CRMU registers are required 
to read the power status and write to some authentication registers. 
Without writing to these authentication
registers, we cannot access any of the spru_bbl registers. In conclusion
I don't think the CRMU register accesses can be considered as another 
device access. Do you agree Arnd?

> Also, what do you use the labels for?
>
The labels are purely to improve readability of the device tree entry
> 	Arnd
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
