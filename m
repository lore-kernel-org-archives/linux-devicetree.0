From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Wed, 19 Apr 2017 19:37:40 -0700
Message-ID: <58F81EF4.5070304@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <58F6C088.8020304@gmail.com>
 <20170418224953.685943a3@grimm.local.home>
 <641aa8ee-9b54-716a-77a1-076cafb95e3a@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <641aa8ee-9b54-716a-77a1-076cafb95e3a-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19/17 11:45, Tyrel Datwyler wrote:
> On 04/18/2017 07:49 PM, Steven Rostedt wrote:
>> On Tue, 18 Apr 2017 18:42:32 -0700
>> Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> And of course the other issue with using tracepoints is the extra space
>>> required to hold the tracepoint info.  With the pr_debug() approach, the
>>> space usage can be easily removed for a production kernel via a config
>>> option.
>>
>> Now if you are saying you want to be able to enable debugging without
>> the tracing infrastructure I would agree. As the tracing infrastructure
>> is large. But I'm working on shrinking it more.
> 
> The primary consumers of OF_DYNAMIC seem to be pseries and powernv where
> we are generally going to see the trace infrastructure enabled by
> default in production.

Another primary consumer will be overlays for ARM expansion boards.  Still
a work in progress.

-Frank

> 
> -Tyrel
> 
>>
>>>
>>> Tracepoints are wonderful technology, but not always the proper tool to
>>> use for debug info.
>>
>> But if you are going to have tracing enabled regardless, adding a few
>> more tracepoints isn't going to make the difference.
>>
>> -- Steve
>>
>>>
>>>> If Rob wants to convert printk() style data to trace data (and I can't
>>>> convince him otherwise) then I will have further comments on this specific
>>>> patch.
>>>>
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
