Return-Path: <sachin.kamat@linaro.org>
MIME-Version: 1.0
In-Reply-To: <520C023A.5050204@wwwdotorg.org>
References: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
	<1376479377-15732-2-git-send-email-sachin.kamat@linaro.org>
	<520C023A.5050204@wwwdotorg.org>
Date: Thu, 22 Aug 2013 22:00:05 +0530
Message-ID: <CAK9yfHzTOGBw+FHsQ3qww7+DJR-SLx_9r2ryFDXVtduiLZXsCg@mail.gmail.com>
Subject: Re: [PATCH Resend 2/2] usb: phy: samsung: Update usbphy documentation
From: Sachin Kamat <sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Rob Herring <robherring2@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On 15 August 2013 03:48, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/14/2013 05:22 AM, Sachin Kamat wrote:
>> Updated the documentation as per the latest driver implementation.
>> While at it also fixed some trivial typos.
>
>> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>
>> +- clocks : Clock IDs array as required by the controller.
>> +- clock-names : names of clocks listed in clocks property in the same order
>> +            as requested by the controller driver.
>
> This is wrong. The DT binding must specify the set of required
> clock-names, not the driver; bindings must be self-contained.
OK.

Also, the
> order shouldn't matter, since everything should be looked up by name;
> all that matters is the entries in clocks/clock-names match.

It was supposed to mean the order of clocks to clock-names (relative).
I will re-phrase it.

>
>>  Optional properties:
>> -- #address-cells: should be '1' when usbphy node has a child node with 'reg'
>> +- #address-cellsi : should be '1' when usbphy node has a child node with 'reg'
>>                 property.
>
> Type "cellsi".

right.
>
> What should the value be if there is no child node? In other words, I
> think just delete the text "when usbphy node has a child node with 'reg'
> property.". Same for size-cells.

OK

>
>> -- #size-cells: should be '1' when usbphy node has a child node with 'reg'
>> +- #size-cells : should be '1' when usbphy node has a child node with 'reg'
>>              property.
>
> I don't think it's worth changing the binding doc just to add a space
> before the colon... It looks better the first way, although
> unfortunately many DT binding docs have the extra space.

I too prefer without the extra space. However most of the Samsung
bindings do have them and hence
thought of keeping this one consistent.

>
>> +- clocks : Clock IDs array as required by the controller.
>> +- clock-names : names of clocks correseponding to IDs in the clock property
>>              as requested by the controller driver.
>
> May as well s/correseponding/corresponding/.

Right.

Thanks for your review.


 --
With warm regards,
Sachin
