From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] dt: update PSCI binding documentation for v0.2
Date: Fri, 13 Sep 2013 14:23:29 -0500
Message-ID: <CAL_JsqJ-SY5MsnbETnK6k4GRHhtgiYztMo+bW7i85A4aWYjrPg@mail.gmail.com>
References: <1377564633-31638-1-git-send-email-robherring2@gmail.com>
	<20130903095235.GD18206@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130903095235.GD18206-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Charles Garcia-Tobin <Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2013 at 4:52 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Aug 27, 2013 at 01:50:33AM +0100, Rob Herring wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Hi Rob,
>
> Sorry for the delay on reviewing this.
>
>>
>> The PSCI spec from ARM has been updated to 0.2 version. Update the
>> binding document to reflect the spec changes. For the binding, the
>> major changes are the addition of psci_version, affinity_info,
>> migrate_info_type, migrate_info_up_cpu, system_reset and system_off
>> functions. The recommended function ID numbering has also changed.
>>
>> This update also defines 32 and 64 bit calling conventions. The calling
>> convention is defined on a per function ID basis.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
>> Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
>> Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
>> Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>,
>> Cc: Charles Garcia-Tobin <Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org>
>> Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>> v3: This version implements Mark's suggested binding with -32 and -64 suffixes.
>>
>>  Documentation/devicetree/bindings/arm/psci.txt | 62 +++++++++++++++++++-------
>>  1 file changed, 46 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.txt b/Documentation/devicetree/bindings/arm/psci.txt
>> index 433afe9..209bb04 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.txt
>> +++ b/Documentation/devicetree/bindings/arm/psci.txt
>> @@ -1,16 +1,17 @@
>>  * Power State Coordination Interface (PSCI)
>>
>>  Firmware implementing the PSCI functions described in ARM document number
>> -ARM DEN 0022A ("Power State Coordination Interface System Software on ARM
>> +ARM DEN 0022B ("Power State Coordination Interface System Software on ARM
>>  processors") can be used by Linux to initiate various CPU-centric power
>>  operations.
>>
>> -Issue A of the specification describes functions for CPU suspend, hotplug
>> -and migration of secure software.
>> +Issue B of the specification describes functions for CPU suspend, hotplug,
>> +migration of secure software, and system level reset and powerdown.
>>
>>  Functions are invoked by trapping to the privilege level of the PSCI
>>  firmware (specified as part of the binding below) and passing arguments
>> -in a manner similar to that specified by AAPCS:
>> +as defined in ARM document "SMC Calling Convention" (ARM DEN 0028) in a manner
>> +similar to that specified by AAPCS:
>>
>>        r0             => 32-bit Function ID / return value
>>       {r1 - r3}       => Parameters
>> @@ -21,10 +22,10 @@ to #0.
>>
>>  Main node required properties:
>>
>> - - compatible    : Must be "arm,psci"
>> + - compatible    : Must contain "arm,psci-0.2" or "arm,psci"
>>
>> - - method        : The method of calling the PSCI firmware. Permitted
>> -                   values are:
>> + - method        : The method defines the calling convention for the PSCI
>> +                   firmware. Permitted values are:
>>
>>                     "smc" : SMC #0, with the register assignments specified
>>                          in this binding.
>> @@ -32,24 +33,53 @@ Main node required properties:
>>                     "hvc" : HVC #0, with the register assignments specified
>>                          in this binding.
>>
>> + - psci_version  : Function ID for PSCI_VERSION operation. Required for
>> +                   "arm,psci-0.2" compatible version or later.
>> +
>
> While this seems sensible, I'm not sure that this needs to be mandatory.

It is quite pointless to have at all if we don't make it mandatory. I
would accept that it is pointless and the compatible string should
always reflect the version anyway, but ARM added the call and states
it is mandatory in the PSCI doc. I guess we could have mandatory for
the firmware to implement, but optional in the DT binding? That seems
silly though.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
