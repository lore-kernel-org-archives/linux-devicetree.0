From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] of: irq: use of_property_read_bool() for
 "interrupt-controller" prop
Date: Fri, 21 Jul 2017 20:36:17 +0300
Message-ID: <54c732e1-8458-cd27-2d0e-ce44a9870fd2@cogentembedded.com>
References: <20170708203318.045262932@cogentembedded.com>
 <20170721154604.kbjb74ebzicodckl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721154604.kbjb74ebzicodckl@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/21/2017 06:46 PM, Rob Herring wrote:

>> The "interrupt-controller" property is boolean, i.e. has no value.  The DT
>> interrupt parsing code predates of_property_read_bool(), so it uses either
>> of_get_property() or of_find_property() -- the former isn't quite correct
>> for the boolean props (but works somehow). Use the modern boolean prop API
>> instead.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>>  drivers/of/irq.c |    5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> Both applied, thanks.

    TY!

> Any plans to convert other users?

    No, not yet -- I fix things as I see them.

> Rob

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
