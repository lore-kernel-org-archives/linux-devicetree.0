From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/lib: Export fdt routines to modules
Date: Fri, 18 Oct 2013 16:20:09 -0500
Message-ID: <5261A609.1020605@gmail.com>
References: <1381966065-16854-1-git-send-email-mbohan@codeaurora.org> <525F2397.40203@caviumnetworks.com> <20131017002731.GA22830@codeaurora.org> <525F6D83.1050808@roeck-us.net> <20131017235132.GA6241@codeaurora.org> <52608457.5040609@roeck-us.net> <20131018025405.GA3722@codeaurora.org> <33103C16-6472-4AAE-ADB8-50807CC96C85@antoniou-consulting.com> <52615A64.9040803@gmail.com> <52616228.80002@caviumnetworks.com> <20131018193229.GA30141@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131018193229.GA30141-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/18/2013 02:32 PM, Michael Bohan wrote:
> On Fri, Oct 18, 2013 at 09:30:32AM -0700, David Daney wrote:
>> On 10/18/2013 08:57 AM, Rob Herring wrote:
>> [...]
>>>
>>> Unflattening is definitely the right
>>> direction to go here.
>>>
>>
>> I wonder if that is really true.
>>
>> The device tree in question is very short lived, and used to control
>> the configuration of some hardware device when loading the driver.
>>
>> The use of it is completely contained within a single driver (at
>> least that is my understanding), it is not information that needs to
>> be shared system wide.
> 
> That's correct.
> 
>> Given that it is a driver implementation issue, rather than making
>> things work nicely system wide, I don't think it really matters what
>> is done.
>>
>> It may be that the overhead of unflattening the tree and then
>> freeing it, is much greater than just extracting a few things from
>> the FDT.
> 
> Yes, this was my original thought as well. On the other hand,
> having libfdt in the kernel does add a little extra bloat, and so
> it seems a tradeoff from one-time runtime overhead to footprint.
> 
>> That said, I don't really have a preference for what is done.  My
>> original questions were targeted at understanding this particular
>> use case.
> 
> My preference is probably straight libfdt calls, but if others
> think that unpacking is a better solution, I'm able to go that
> route as well. My only concern there is that we provide a means
> to detect invalid dtb image (ex. handle error codes) and also
> free the device_node allocations once the device is released.

I think we need to understand what you are putting in the DT first.

Given there are other desired uses like overlays which need to add the
necessary loading and unflattening support, a common solution is likely
more desirable.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
