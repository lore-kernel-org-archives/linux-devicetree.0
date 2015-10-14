From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] rtc: pcf8563: disable CLKOUT
Date: Wed, 14 Oct 2015 06:19:29 +0200
Message-ID: <561DD7D1.5040102@denx.de>
References: <1444712938-22865-1-git-send-email-hs@denx.de>
 <20151013201703.GA3421@piout.net>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151013201703.GA3421-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Georg.Soffel-k21M0aUVSxZWk0Htik3J/w@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

Am 13.10.2015 um 22:17 schrieb Alexandre Belloni:
> Hi,
>
> On 13/10/2015 at 07:08:58 +0200, Heiko Schocher wrote :
>> Disable the CLKOUT of the RTC after power-up.
>> After power-up/reset of the RTC, CLKOUT is enabled by default,
>> with CLKOUT enabled the RTC chip has 2-3 times higher power
>> consumption. If you do not need CLKOUT, you can disable the
>> CLKOUT with setting "disable-clkout" property.
>>
>
> I think you can simply unconditionally disable clkout. My preferred way
> of doing what you suggest is probably to register a clock in the CCF. If
> the clock is not used, it will be automatically disabled.
> It will also provide a generic way of setting the clkout frequency (some
> RTC are able to output 32kHZ, 1kHz and 1Hz).

Does disabling it ot break some boards?

I take a look into CCF, good idea.

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
