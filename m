From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/10] dt/bindings: arm-boards: add binding for Versatile
 core module
Date: Wed, 21 May 2014 10:34:18 -0500
Message-ID: <CAL_JsqJTuMu4jz5t39gSt+DQieVkrvCUNyrp01yGqW_+17uQtw@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-8-git-send-email-robherring2@gmail.com>
	<7810339.hMuUdCPTp0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7810339.hMuUdCPTp0@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 21, 2014 at 3:24 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 20 May 2014 16:09:33 Rob Herring wrote:
>> diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
>> index 3509707..3a950d9 100644
>> --- a/Documentation/devicetree/bindings/arm/arm-boards
>> +++ b/Documentation/devicetree/bindings/arm/arm-boards
>> @@ -86,3 +86,9 @@ Interrupt controllers:
>>         compatible = "arm,versatile-sic";
>>         interrupt-controller;
>>         #interrupt-cells = <1>;
>> +
>> +Required nodes:
>> +
>> +- core-module: the root node to the Versatile platforms must have
>> +  a core-module with regs and the compatible string
>> +  "arm,core-module-versatile"
>>
>
>
> Should we mark this compatible="syscon" as well, so we can move
> the accesses into syscon references later if we want to?

Yes, probably so. That should be done on Integrator and Realview as
well if not already.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
