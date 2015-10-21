From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] EDAC: Add AMD Seattle SoC EDAC
Date: Wed, 21 Oct 2015 11:01:30 +0100
Message-ID: <5627627A.9010906@arm.com>
References: <1445282597-18999-1-git-send-email-brijeshkumar.singh@amd.com>
 <20151019205236.GB453@leverpostej> <56266F7E.6030404@amd.com>
 <20151020165744.GE31130@pd.tnic> <20151020172654.GC4943@leverpostej>
 <20151020173639.GH31130@pd.tnic> <5626F09F.4050107@huawei.com>
 <20151021093536.GA3575@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021093536.GA3575-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huxinwei <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 21/10/15 10:35, Borislav Petkov wrote:
> On Wed, Oct 21, 2015 at 09:55:43AM +0800, Hanjun Guo wrote:
>> So I think the meaning of those error register is the same, but the way
>> of handle it may different from SoCs, for single bit error:
>>
>>  - SoC may trigger a interrupt;
>>  - SoC may just keep silent so we need to scan the registers using poll
>>    mechanism.
>>
>> For Double bit error:
>>   - SoC may also keep silent
>>   - Trigger a interrupt
>>   - Trigger a SEI (system error)
>>
>> Any suggestion to cover those cases?
> 
> Well, I guess we can implement all those and have them configurable
> in the sense that a single driver loads, it has all functionality and
> dependent on the vendor detection, it does only what the vendor wants
> like trigger an interrupt or remain silent or ...

I guess the firmware (running in EL3) will take precedence over this
driver anyway, so we could just optimistically implement all errors, as
the driver will just never see errors that are handled in firmware (?)
In case of a critical error for instance I expect the firmware to never
return to EL1.

> 
> Btw, in talking about this with Andre last night, he had the suggestion
> that this functionality is also in other implementations besides A57 so
> maybe the driver should be called arm_cortex_edac...

Yeah, so looking at the A-72 and the A-53 TRM I see those registers to
be there as well. The A-72 and the A-57 versions look identical to me,
the A-53 version is only slightly different, but apparently still
compatible.
So I'd suggest to let this driver load on detecting all three MIDRs.
Should later revisions of any of those parts change the register
meaning, we could add a blacklist or specific MIDR detection.

But let's just not assume the worst in the first place ;-)

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
