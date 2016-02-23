From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: rtc-pic32: Add PIC32 real time clock driver
Date: Tue, 23 Feb 2016 10:36:20 -0700
Message-ID: <56CC9894.7000307@microchip.com>
References: <1455905390-3491-2-git-send-email-joshua.henderson@microchip.com>
 <20160219181712.GD2222@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160219181712.GD2222-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Alexandre,

On 02/19/2016 11:17 AM, Alexandre Belloni wrote:
> Hi,
> 
> On 19/02/2016 at 11:09:45 -0700, Joshua Henderson wrote :
>> This driver adds support for the PIC32 real time clock and calendar
>> peripheral:
>> 	- reading and setting time
>> 	- alarms when connected to an IRQ
> 
> Just for confirmation, your probe() fails hard when there are no IRQ
> specified or the IRQ request fails.
> 
> I'll review later but if that the only thing, I can fix it up when
> applying, no need to resend.
> 

probe() does indeed fail when no interrupt is specified:

  ...
  pic32-rtc 1f8c0000.rtc: no irq for alarm
  ...
  hctosys: unable to open rtc device (rtc0)
  ...

If I'm following, I think there right answer here is to just change the wording
in the commit message to be clear that the interrupt is not conditional.  It's
required via binding.  This peripheral has a dedicated interrupt and I can't
imagine a case where it makes sense not to specify it.

I'm fine with something like "- alarms provided by dedicated interrupt" as a
replacement.

Josh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
