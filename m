Return-Path: <sachin.kamat@linaro.org>
MIME-Version: 1.0
In-Reply-To: <520C0146.5050300@wwwdotorg.org>
References: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
	<520C0146.5050300@wwwdotorg.org>
Date: Thu, 22 Aug 2013 21:31:54 +0530
Message-ID: <CAK9yfHx=OPygx0sB5Bj8wVBOT-xj-oQcJg92eEY7iHKfWPSFMw@mail.gmail.com>
Subject: Re: [PATCH Resend 1/2] usb: samsung: Update Exynos ehci/ohci bindings documentation
From: Sachin Kamat <sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Rob Herring <robherring2@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On 15 August 2013 03:44, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/14/2013 05:22 AM, Sachin Kamat wrote:
>> Updated the document as per the latest implementation.
>> While at it also fixed some trivial typos.
>
>> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>
>>  EHCI
>>  Required properties:
>> - - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
>> -   EHCI controller in host mode.
>> - - reg: physical base address of the controller and length of memory mapped
>> + - compatible : should be one of the following for USB 2.0 EHCI controller
>> +             in host mode:
>> +     (a) "samsung,exynos5440-ehci" for Exynos5440 SoC
>> +     (b) "samsung,exynos4210-ehci" for all other Exynos4 and 5 SoCs
>
> I'm not sure the text "in host mode" belongs there. The DT should
> describe the presence of the EHCI controller HW module. Whether the
> module is programmed for host mode or device mode is surely a run-time
> decision, not something that would need different DT bindings?

Yes, you are right. Probably since our boards mostly have only the
host connector, the original author was tempted to mention it that way
which I carried forward. I will remove it and re-send. Thanks for the
review.



-- 
With warm regards,
Sachin
