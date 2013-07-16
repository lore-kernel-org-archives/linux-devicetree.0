From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] iio: at91: Use different prescal, startup mask in
 MR for different IP
Date: Tue, 16 Jul 2013 20:03:38 +0100
Message-ID: <51E5990A.4050709@kernel.org>
References: <1373789069-11604-1-git-send-email-josh.wu@atmel.com> <1373789069-11604-3-git-send-email-josh.wu@atmel.com> <20130715125815.GC2962@lukather> <51E505EA.4060502@atmel.com> <51E50864.6020904@atmel.com> <20130716133003.7c208cdf@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130716133003.7c208cdf@skate>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/16/2013 12:30 PM, Thomas Petazzoni wrote:
> Dear Nicolas Ferre,
> 
> On Tue, 16 Jul 2013 10:46:28 +0200, Nicolas Ferre wrote:
> 
>>> Ok, that make sense. I will use compatible names for the capabilities in
>>> next version. Thanks.
>>
>> Hold on a little bit Josh, I know that Jean-Christophe is not in favor 
>> of the use of multiple compatible strings. So, as the code is already 
>> there, let's wait and see if we find another argument...
> 
> I've asked exactly this question last week at Linaro Connect during the
> ARM SoC consolidation panel/discussion, where Grant Likely, Arnd
> Bergmann, Olof and others were answering Device Tree related questions.
> 
> My question, which precisely had the at91-adc DT binding in mind was
> precisely whether we should use different compatible properties to
> identify different revisions of an IP block and let the driver handle
> those differences, or whether the DT binding should provide sufficient
> properties (register offsets, bit numbers, etc.) to make the driver
> independent of the IP revisions. And clearly, the answer was that
> different compatible properties should be used to identify the
> different versions of the IP block, and the driver should abstract out
> the differences. I.e, was has been done for at91-adc is completely the
> opposite of the best practices for Device Tree on ARM.
> 
> See
> http://www.youtube.com/watch?v=zF_AXLgkFy4&feature=player_detailpage#t=1581s
> where I ask exactly this question, and get answers from Olof Johansson
> and Grant Likely. They clearly say that the solution of having separate
> compatible properties and a driver that handles the differences is the
> way to go. So the way at91-adc (and possibly other at91 drivers) is
> using the Device Tree is wrong, there should have been multiple
> compatible properties. It's a shame because this is something we did say
> when we submitted at91-adc and during the reviews, but the maintainer
> wasn't listening to our comments...
> 

Thanks for getting some clarity on this Thomas.  So I'll ask the somewhat obvious
question - how do we unwind from where we are to where we want to be wrt to the
bindings?
