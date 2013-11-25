From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: add ARMv8 PMU binding
Date: Mon, 25 Nov 2013 09:24:46 -0600
Message-ID: <CAL_JsqKArowT_DE8-vCJvmOSxjp+X9bngCXXsgjBK7G3wPZ7wA@mail.gmail.com>
References: <1385155032-9032-1-git-send-email-robherring2@gmail.com>
	<A8B9EAD7-0DBA-46D7-963F-30DEA0575EE2@codeaurora.org>
	<528FD003.8090607@gmail.com>
	<20131125091651.GA32081@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131125091651.GA32081-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 25, 2013 at 3:16 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wr=
ote:
> On Fri, Nov 22, 2013 at 09:43:31PM +0000, Rob Herring wrote:
>> On 11/22/2013 03:38 PM, Kumar Gala wrote:
>> >
>> > On Nov 22, 2013, at 3:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>> >
>> >> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> >>
>> >> Add missing "arm,armv8-pmuv3" compatible property for ARMv8 PMU.
>> >>
>> >> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> >> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> >> ---
>> >> Documentation/devicetree/bindings/arm/pmu.txt | 1 +
>> >> 1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Docu=
mentation/devicetree/bindings/arm/pmu.txt
>> >> index 343781b..3e1e498 100644
>> >> --- a/Documentation/devicetree/bindings/arm/pmu.txt
>> >> +++ b/Documentation/devicetree/bindings/arm/pmu.txt
>> >> @@ -7,6 +7,7 @@ representation in the device tree should be done =
as under:-
>> >> Required properties:
>> >>
>> >> - compatible : should be one of
>> >> +  "arm,armv8-pmuv3=94
>> >
>> > what about arm,armv8-pmu-v3?
>>
>> I'm just documenting what is already being used:
>>
>> arch/arm64/boot/dts/foundation-v8.dts:          compatible =3D
>> "arm,armv8-pmuv3";
>> arch/arm64/boot/dts/rtsm_ve-aemv8a.dts:         compatible =3D
>> "arm,armv8-pmuv3";
>>
>> Do we want to change those?
>
> It would probably have been nicer to have the '-' from the start, but
> adding it now is only going to expand the set of compatible strings f=
or
> no appreciable benefit.
>
> I don't see any value in adding a new form of the string, and we can'=
t
> change the existing one as it's already in use.

Is that an ack then?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
