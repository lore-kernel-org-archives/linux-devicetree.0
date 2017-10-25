From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [RFC PATCH v2 1/3] regulator: bindings: Add properties for
 coupled regulators
Date: Wed, 25 Oct 2017 15:10:38 +0200
Message-ID: <48819030-3cc7-8223-3bff-e0b860c2d21d@samsung.com>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
        <CGME20171018124727eucas1p255ccce41852d5585640f2d97153d2fa8@eucas1p2.samsung.com>
        <1508330822-8039-2-git-send-email-m.purski@samsung.com>
        <20171024185801.bq27wszp7socsxqx@rob-hp-laptop>
        <76404da2-fe50-b124-0f18-e93e3cb14014@samsung.com>
        <CAL_Jsq+m5kK0U7-dEBRuxyQFOwv0iYsHr3QjJBJyo1GBG+u2GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAL_Jsq+m5kK0U7-dEBRuxyQFOwv0iYsHr3QjJBJyo1GBG+u2GA@mail.gmail.com>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On 10/25/2017 02:59 PM, Rob Herring wrote:
> On Wed, Oct 25, 2017 at 2:31 AM, Maciej Purski <m.purski@samsung.com> wrote:
>>
>>
>> On 10/24/2017 08:58 PM, Rob Herring wrote:
>>>
>>> On Wed, Oct 18, 2017 at 02:47:00PM +0200, Maciej Purski wrote:
>>>>
>>>> Some regulators require keeping their voltage spread below defined
>>>> max_spread.
>>>>
>>>> Add properties to provide information on regulators' coupling.
>>>>
>>>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt
>>>> b/Documentation/devicetree/bindings/regulator/regulator.txt
>>>> index 378f6dc..6769565 100644
>>>> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
>>>> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
>>>> @@ -60,6 +60,10 @@ Optional properties:
>>>>          0: Disable active discharge.
>>>>          1: Enable active discharge.
>>>>          Absence of this property will leave configuration to default.
>>>> +- regulator-coupled-with: Phandle to regulators with which the regulator
>>>> +  should be coupled. Allow up to 9 phandles.
>>>
>>>
>>> 9? Sounds like a driver detail and pretty arbitrary.
>>>
>> It's just a constant number that I defined as MAX_COUPLED, because in fact
>> there isn't any use-case yet for even more than two regulators so
>> MAX_COUPLED equal to 9 is a really high number. If you find it cleaner, I
>> can make this value variable.
> 
> Just drop the statement. The OS simply needs to support however many
> there are for the h/w it supports.
> 

Ok, I get this.

>>
>>> Is this linkage 2-way meaning 2 coupled regulators both have links to
>>> the other one? If so, then what happens when you have a high number? If
>>> not, how does one decide which regulator has this property?
>>
>>
>> Yes, it is 2-way. When you have a high number, then each regulator should
>> have phandles to every other. So, if you have 3 regulators coupled, then
>> each one should have 2 phandles.
> 
> Please add this to the description. That doesn't really seem ideal if
> you have a lot, but I somewhat doubt we'll see more than 2-3.
> 
> Rob
> 

I'll fix the description in the next version. Yes, I agree that we won't see 
more than 2-3 coupled regulators.

Best Regards,

Maciej Purski
