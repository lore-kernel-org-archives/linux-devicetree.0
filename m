From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dtc: create tool to diff device trees
Date: Thu, 07 Jan 2016 10:40:29 -0800
Message-ID: <568EB11D.2060604@gmail.com>
References: <5684F17E.6060209@gmail.com> <CAL_JsqKWUGZp24-GMO=f1zOYvAntVtr0cKBUKz_7XK5F_epWOg@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKWUGZp24-GMO=f1zOYvAntVtr0cKBUKz_7XK5F_epWOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/4/2016 1:29 PM, Rob Herring wrote:
> On Thu, Dec 31, 2015 at 3:12 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Create script to diff device trees.
>>
>> The device tree can be in any of the forms recognized by the dtc compiler:
>>   - source
>>   - binary blob
>>   - file system tree (from /proc/devicetree)
>>
>> If the device tree is a source file, then it is pre-processed in the
>> same way as it would be when built in the linux kernel source tree
>> before diffing.
> 
> In general, I'd like to see some of this move to dtc and the kernel
> dependencies minimized.
> 

I didn't address this comment in my first reply.  Didn't mean to gloss
over it.

I agree with the sentiment, but I'm not sure how to act on it.  I don't
think that dtc should be changed to be Linux specific (but if the dtc
maintainers think differently I would follow their lead).  You did
provide at least one example of minimizing kernel dependencies
(removing the arch specific Makefile dtc flags), but beyond that
I'm not sure what can be done.

On the positive side, we can avoid adding more kernel dependencies.

< snip >

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
