From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: add ARMv8 PMU binding
Date: Fri, 22 Nov 2013 15:43:31 -0600
Message-ID: <528FD003.8090607@gmail.com>
References: <1385155032-9032-1-git-send-email-robherring2@gmail.com> <A8B9EAD7-0DBA-46D7-963F-30DEA0575EE2@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <A8B9EAD7-0DBA-46D7-963F-30DEA0575EE2-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/22/2013 03:38 PM, Kumar Gala wrote:
>=20
> On Nov 22, 2013, at 3:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>=20
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> Add missing "arm,armv8-pmuv3" compatible property for ARMv8 PMU.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> ---
>> Documentation/devicetree/bindings/arm/pmu.txt | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documen=
tation/devicetree/bindings/arm/pmu.txt
>> index 343781b..3e1e498 100644
>> --- a/Documentation/devicetree/bindings/arm/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/pmu.txt
>> @@ -7,6 +7,7 @@ representation in the device tree should be done as =
under:-
>> Required properties:
>>
>> - compatible : should be one of
>> +	"arm,armv8-pmuv3=94
>=20
> what about arm,armv8-pmu-v3?

I'm just documenting what is already being used:

arch/arm64/boot/dts/foundation-v8.dts:          compatible =3D
"arm,armv8-pmuv3";
arch/arm64/boot/dts/rtsm_ve-aemv8a.dts:         compatible =3D
"arm,armv8-pmuv3";

Do we want to change those?

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
