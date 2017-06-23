From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] vsprintf: Add %p extension "%pOF" for device tree
Date: Fri, 23 Jun 2017 09:08:55 -0500
Message-ID: <CAL_JsqJiV7qam+p5YpURtC_G0J16+kBuat4yK0+XB99UH7FmzQ@mail.gmail.com>
References: <20170614203025.7581-4-robh@kernel.org> <20170622204445.14930-1-robh@kernel.org>
 <d22444aa-39da-ec74-42a1-63f1fa40c7d3@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d22444aa-39da-ec74-42a1-63f1fa40c7d3-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 5:44 PM, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On 06/22/2017 01:44 PM, Rob Herring wrote:
>> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>
>> 90% of the usage of device node's full_name is printing it out in a
>> kernel message. However, storing the full path for every node is
>> wasteful and redundant. With a custom format specifier, we can generate
>> the full path at run-time and eventually remove the full path from every
>> node.
>>
>> For instance typical use is:
>>       pr_info("Frobbing node %s\n", node->full_name);
>>
>> Which can be written now as:
>>       pr_info("Frobbing node %pOF\n", node);
>
>
> isn't OF for flags -- and Of for full name?
> Typo or a change in the last 2 years?

It changed in the discussion 2 years ago. The intent is:

%pO - kobj
%pOF - device_node, defaulting to full name

There's no support of base kobj's, but I guess I should make that
intent clear in the documentation.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
