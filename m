From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Date: Fri, 13 Oct 2017 16:08:45 -0700
Message-ID: <59E1477D.6060700@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 07/25/17 13:36, Rob Herring wrote:
> On Tue, Apr 25, 2017 at 7:09 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
> 
> [...]
> 
>> @@ -1261,6 +1263,8 @@ void __init unflatten_device_tree(void)
>>
>>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>         of_alias_scan(early_init_dt_alloc_memory_arch);
>> +
>> +       unittest_unflatten_overlay_base();
> 
> This breaks on systems that don't boot with FDT and call
> unflatten_device_tree, namely x86 and UML (UML needs a few hacks to
> work) which was a feature of the unittest. Considering applying
> overlays on x86 is something we'll want to support, the unittest
> should support that case.
> 
> Rob

What is the symptom of the breakage?  Or what is causing breakage?

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
