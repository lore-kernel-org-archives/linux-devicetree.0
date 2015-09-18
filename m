From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Fri, 18 Sep 2015 09:24:42 -0500
Message-ID: <CAL_JsqLwPnYB7ahvFZLwJVV=JNx8BCnM0nmWGyzA_YyimDXOLA@mail.gmail.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com>
 <55FACAA2.4010403@kernel.org> <181E6FCF-F1D6-42BC-B0B0-6ADB993A5A83@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <181E6FCF-F1D6-42BC-B0B0-6ADB993A5A83@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 18, 2015 at 4:15 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Rob,
>
>> On Sep 17, 2015, at 17:13 , Rob Herring <robh@kernel.org> wrote:
>>
>> On 09/16/2015 11:11 AM, Pantelis Antoniou wrote:
>>> Changesets are very powerful, but the lack of a helper API
>>> makes using them cumbersome. Introduce a simple copy based
>>> API that makes things considerably easier.

[...]

>>> +struct device_node *of_changeset_create_device_nodev(
>>> +    struct of_changeset *ocs, struct device_node *parent,
>>> +    const char *fmt, va_list vargs)
>>> +{
>>> +    struct device_node *node;
>>> +
>>> +    node = __of_node_dupv(NULL, fmt, vargs);
>>> +    if (!node)
>>> +            return ERR_PTR(-ENOMEM);
>>> +
>>> +    node->parent = parent;
>>> +    return node;
>>> +}
>>
>> EXPORT_SYMBOL_GPL here and on others?
>>
>
> Err, none of the others of_changeset* methods are exported right now.
> Up to now it was all internal API; should I go ahead and put EXPORT_SYMBOL_GPL
> to all the others as well?

Okay, NM then.

Rob
