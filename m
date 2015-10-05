From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] regulator: max77802: Add input supply properties to DT
 binding doc
Date: Mon, 5 Oct 2015 19:33:44 +0200
Message-ID: <5612B478.7030802@osg.samsung.com>
References: <1444057643-29672-1-git-send-email-javier@osg.samsung.com>
 <CAL_JsqKg-NdDFuVcff2YGZExkPHwTaO5c-hpyy2Dai75RAReDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKg-NdDFuVcff2YGZExkPHwTaO5c-hpyy2Dai75RAReDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thanks for your feedback.

On 10/05/2015 06:15 PM, Rob Herring wrote:
> On Mon, Oct 5, 2015 at 10:07 AM, Javier Martinez Canillas
> <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
>> The max77802 regulator driver defines the supply name for each regulator
>> so these can be described in DT but is not mentioned in the binding doc.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>
>> ---
>>
>>  .../devicetree/bindings/regulator/max77802.txt     | 23 +++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
>> index 79e5476444f7..b466689c47ea 100644
>> --- a/Documentation/devicetree/bindings/regulator/max77802.txt
>> +++ b/Documentation/devicetree/bindings/regulator/max77802.txt
>> @@ -8,7 +8,26 @@ regulators that can be controlled over I2C.
>>
>>  Following properties should be present in main device node of the MFD chip.
>>
>> -Optional node:
> 
> regulators is still a node, so you should have 2 sections.
>

You are right, I included both because I saw other DT bindings doing
this but agree the correct approach is to have two separate sections.

Mark already applied this patch though so I can't send a v2 but I'll
post an incremental patch on top of his topic/max77802 branch:

https://git.kernel.org/cgit/linux/kernel/git/broonie/regulator.git/log/?h=topic/max77802

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
