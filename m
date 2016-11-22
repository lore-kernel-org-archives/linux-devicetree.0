From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Tue, 22 Nov 2016 10:44:47 -0800
Message-ID: <5834921F.2020809@gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582F5DC0.4080804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/18/16 12:00, Frank Rowand wrote:
> On 11/18/16 06:46, Rob Herring wrote:
>> On Thu, Nov 17, 2016 at 03:32:54PM +0000, Sudeep Holla wrote:
>>> Currently platforms/drivers needing to get the machine model name are
>>> replicating the same snippet of code. In some case, the OF reference
>>> counting is either missing or incorrect.
>>>
>>> This patch adds support to read the machine model name either using
>>> the "model" or the "compatible" property in the device tree root node
>>> to the core OF/DT code.
>>>
>>> This can be used to remove all the duplicate code snippets doing exactly
>>> same thing later.
>>>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
>>>  include/linux/of.h |  6 ++++++
>>>  2 files changed, 38 insertions(+)
>>>
>>> Hi Rob,
>>>
>>> It would be good if we can target this for v4.10, so that we have no
>>> dependencies to push PATCH 2/2 in v4.11
>>
>> Applied.
>>
>> Rob
>>
> 
> A little fast on the trigger Rob.
> 
> -Frank

This patch adds a function that leads to conflating the "model" property
and the "compatible" property. This leads to opaque, confusing and unclear
code where ever it is used.   I think it is not good for the device tree
framework to contribute to writing unclear code.

Further, only two of the proposed users of this new function appear to
be proper usage.  I do not think that the small amount of reduced lines
of code is a good trade off for the reduced code clarity and for the
potential for future mis-use of this function.

Can I convince you to revert this patch?

If not, will you accept a patch to change the function name to more
clearly indicate what it does?  (One possible name would be
of_model_or_1st_compatible().)

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
