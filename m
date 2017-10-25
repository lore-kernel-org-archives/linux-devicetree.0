From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/3] regulator: bindings: Add properties for
 coupled regulators
Date: Wed, 25 Oct 2017 09:31:45 +0200
Message-ID: <76404da2-fe50-b124-0f18-e93e3cb14014@samsung.com>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
        <CGME20171018124727eucas1p255ccce41852d5585640f2d97153d2fa8@eucas1p2.samsung.com>
        <1508330822-8039-2-git-send-email-m.purski@samsung.com>
        <20171024185801.bq27wszp7socsxqx@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20171024185801.bq27wszp7socsxqx@rob-hp-laptop>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/24/2017 08:58 PM, Rob Herring wrote:
> On Wed, Oct 18, 2017 at 02:47:00PM +0200, Maciej Purski wrote:
>> Some regulators require keeping their voltage spread below defined
>> max_spread.
>>
>> Add properties to provide information on regulators' coupling.
>>
>> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
>> index 378f6dc..6769565 100644
>> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
>> @@ -60,6 +60,10 @@ Optional properties:
>>   	0: Disable active discharge.
>>   	1: Enable active discharge.
>>   	Absence of this property will leave configuration to default.
>> +- regulator-coupled-with: Phandle to regulators with which the regulator
>> +  should be coupled. Allow up to 9 phandles.
> 
> 9? Sounds like a driver detail and pretty arbitrary.
> 
It's just a constant number that I defined as MAX_COUPLED, because in fact there 
isn't any use-case yet for even more than two regulators so MAX_COUPLED equal to 
9 is a really high number. If you find it cleaner, I can make this value variable.

> Is this linkage 2-way meaning 2 coupled regulators both have links to
> the other one? If so, then what happens when you have a high number? If
> not, how does one decide which regulator has this property?

Yes, it is 2-way. When you have a high number, then each regulator should have 
phandles to every other. So, if you have 3 regulators coupled, then each one 
should have 2 phandles.

> 
>> +- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
>> +  in microvolts.
>>   
>>   Deprecated properties:
>>   - regulator-compatible: If a regulator chip contains multiple
>> -- 
>> 2.7.4
>>
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
