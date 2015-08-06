From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFCv3 1/4] docs: dts: Added documentation for Xilinx Zynq Reset
 Controller bindings.
Date: Thu, 6 Aug 2015 06:54:23 +0200
Message-ID: <55C2E87F.7060502@xilinx.com>
References: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
 <1438305237-18497-2-git-send-email-moritz.fischer@ettus.com>
 <1438675772.3793.18.camel@pengutronix.de>
 <CAAtXAHeauiD5smAqMbheJWuv4BT-2YqJWOSBjYPq900icpT1Rg@mail.gmail.com>
 <1438701017.3793.45.camel@pengutronix.de>
 <CAAtXAHfJF-5PAgCc4ZC71omc_ye6L4qa2ks2E1BdoSXxDzZu1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHfJF-5PAgCc4ZC71omc_ye6L4qa2ks2E1BdoSXxDzZu1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/05/2015 09:43 PM, Moritz Fischer wrote:
> Michal,
> 
> On Tue, Aug 4, 2015 at 8:10 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> Hi Moritz,
>>
>> Am Dienstag, den 04.08.2015, 08:05 -0700 schrieb Moritz Fischer:
>>> Hi Philip,
>>>
>>> On Tue, Aug 4, 2015 at 1:09 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>>>> Hi Moritz,
>>>>
>>>> Am Donnerstag, den 30.07.2015, 18:13 -0700 schrieb Moritz Fischer:
>> [...]
>>>>> +Required properties:
>>>>> +- compatible: "xlnx,zynq-reset"
>>>>> +- reg: SLCR offset and size taken via syscon <0x200 0x48>
>>>>> +- syscon: <&slcr>
>>>>> +  This should be a phandle to the Zynq's SLCR register.
>>>>
>>>>                                                  ^ register singular?
>>> Do you want me to resend the entire set, or are you cool with just git
>>> amending the 's' for registers?
>>
>> Amended and applied, thanks.
> 
> Will you take 4/4 and 2/4 via your tree?

Applied to zynq/dt and zynq/soc.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
