From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/3] regulator: bindings: Add properties for
 coupled regulators
Date: Wed, 25 Oct 2017 07:59:17 -0500
Message-ID: <CAL_Jsq+m5kK0U7-dEBRuxyQFOwv0iYsHr3QjJBJyo1GBG+u2GA@mail.gmail.com>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
 <CGME20171018124727eucas1p255ccce41852d5585640f2d97153d2fa8@eucas1p2.samsung.com>
 <1508330822-8039-2-git-send-email-m.purski@samsung.com> <20171024185801.bq27wszp7socsxqx@rob-hp-laptop>
 <76404da2-fe50-b124-0f18-e93e3cb14014@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <76404da2-fe50-b124-0f18-e93e3cb14014-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 25, 2017 at 2:31 AM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
>
> On 10/24/2017 08:58 PM, Rob Herring wrote:
>>
>> On Wed, Oct 18, 2017 at 02:47:00PM +0200, Maciej Purski wrote:
>>>
>>> Some regulators require keeping their voltage spread below defined
>>> max_spread.
>>>
>>> Add properties to provide information on regulators' coupling.
>>>
>>> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt
>>> b/Documentation/devicetree/bindings/regulator/regulator.txt
>>> index 378f6dc..6769565 100644
>>> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
>>> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
>>> @@ -60,6 +60,10 @@ Optional properties:
>>>         0: Disable active discharge.
>>>         1: Enable active discharge.
>>>         Absence of this property will leave configuration to default.
>>> +- regulator-coupled-with: Phandle to regulators with which the regulator
>>> +  should be coupled. Allow up to 9 phandles.
>>
>>
>> 9? Sounds like a driver detail and pretty arbitrary.
>>
> It's just a constant number that I defined as MAX_COUPLED, because in fact
> there isn't any use-case yet for even more than two regulators so
> MAX_COUPLED equal to 9 is a really high number. If you find it cleaner, I
> can make this value variable.

Just drop the statement. The OS simply needs to support however many
there are for the h/w it supports.

>
>> Is this linkage 2-way meaning 2 coupled regulators both have links to
>> the other one? If so, then what happens when you have a high number? If
>> not, how does one decide which regulator has this property?
>
>
> Yes, it is 2-way. When you have a high number, then each regulator should
> have phandles to every other. So, if you have 3 regulators coupled, then
> each one should have 2 phandles.

Please add this to the description. That doesn't really seem ideal if
you have a lot, but I somewhat doubt we'll see more than 2-3.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
