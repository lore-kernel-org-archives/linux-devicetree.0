From: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] watchdog: ImgTec PDC Watchdog Timer Driver
Date: Fri, 14 Nov 2014 14:08:07 +0000
Message-ID: <54660CC7.7010802@imgtec.com>
References: <1415805483-26268-1-git-send-email-Naidu.Tellapati@imgtec.com> <1415805483-26268-2-git-send-email-Naidu.Tellapati@imgtec.com> <CAL1qeaHt14p3cjk7hLx_E2qKdqR+qHne-BJmHvVrgBF-4AyU=A@mail.gmail.com> <89F3BC60EA3A0141B1F6C2A661D95E5E3F192BB4@hbmail01.hb.imgtec.org>,<5464B191.9020401@imgtec.com> <27E62D98F903554192E3C13AFCC91C3C2F505E3E@hbmail01.hb.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27E62D98F903554192E3C13AFCC91C3C2F505E3E-C8yLA94LPOy3snIXRfWIHVBRoQTxkR7k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/14/14 13:08, Naidu Tellapati wrote:
> Hi James & James,
>
>> On 13/11/14 12:58, Jude Abraham wrote:
>>>>>   +/* timeout in seconds */
>>>>>   +#define PDC_WD_MIN_TIMEOUT             1
>>>>>   +#define PDC_WD_MAX_TIMEOUT             131072
>>>>> +#define PDC_WD_DEFAULT_TIMEOUT         64
>>>>>   +#define PDC_WD_DEFAULT_PRETIMEOUT      PDC_WD_MAX_TIMEOUT
>>>>>   +#define MIN_TIMEOUT_SHIFT              14  /* Clock rate 32768Hz=2^(14+1)*/
>>>> The input clock is not fixed at 32kHz.  I believe it can be configured to run at a different rate.
>>> I think it is  a 32 Khz fixed clock to the block. We are speaking to my hardware team for confirmation.
>>> We will address the review comment after receive feedback from  my hardware team.
>> It should ideally be 32KHz, but that doesn't mean it will be guaranteed
>> to be. The input clock rate is still dependent on the SoC clock setup to
>> provide the clock, and that can usually be reconfigured i.e. from a
>> dedicated external oscillator on the board if provided (hopefully
>> providing the right frequency), or derived from a shared oscillator of
>> some other frequency.
>> For TZ1090 SoC with this IP block, powering down the rest of the SoC
>> happened to reset the low power clock configuration and it would switch
>> clock source to the main oscillator with a fixed divide, which certainly
>> wasn't 32khz most of the time. Each of the low power drivers had to then
>> take this into account in their configuration (img-ir for IR timings,
>> wdt to a lesser extent, and most importantly rtc so as not to lose time
>> or wake up at the wrong time!).
> Please suggest us any valid minimum and maximum clock rates for the Watchdog on Pistachio.
>
> Thanks and regards,
> Naidu.
There are 2 dividers in the clock path, with an input signal of 400MHz 
under normal conditions.  Each divider can divide by up to 128, so the 
minimum frequency is 24.414kHz.  The maximum frequency that could be 
tolerated is 50MHz.  As previously discussed the expected operating 
frequency is 32kHz.

James.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
